<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="Ebook.DB.DBconnect"%>
<%@page import="Ebook.Curd.BookCurdImp"%>
<%@page import="Ebook.Entity.BookDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@include file="../all_component/All_css.jsp"%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
/* ------------NavBar CSS--------------- */
.bg-custom {
	background: #e57373 !important;
}

body {
	background: #f3e5f5;
}
</style>
</head>
<body>
	<%@include file="AdminNavbar.jsp"%>
	<c:if test ="${empty AdminObj}">
	<c:redirect url="../register.jsp"/>
	</c:if>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">All Book Details</p>
						<!-- Display success or error messages with the help of jstl -->
						<!-- For Edit book massage-->
						<div class="massege">
							<c:if test="${not empty updateSuccMsg }">
								<p class="text-center text-success fs-4 ">${updateSuccMsg}</p>
								<c:remove var="updateSuccMsg" scope="session" />
							</c:if>
							<c:if test="${not empty updateFailedMsg }">
								<p class="text-center text-danger fs-4 ">${updateFailedMsg}</p>
								<c:remove var="updateFailedMsg" scope="session" />
							</c:if>
							<!-- For Delete book massage-->
							<c:if test="${not empty deleteSuccMsg }">
								<p class="text-center text-success fs-4 ">${deleteSuccMsg}</p>
								<c:remove var="deleteSuccMsg" scope="session" />
							</c:if>
							<c:if test="${not empty deleteFailedMsg }">
								<p class="text-center text-danger fs-4 ">${deleteFailedMsg}</p>
								<c:remove var="deleteFailedMsg" scope="session" />
							</c:if>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Id</th>
									<th scope="col">Book Name</th>
									<th scope="col">Book Author</th>
									<th scope="col">Price</th>
									<th scope="col">Categories</th>
									<th scope="col">Status</th>
									<th scope="col">Image</th>
									<th scope="col">Email</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								BookCurdImp dao = new BookCurdImp(DBconnect.getConn());
								List<BookDetails> list = dao.getAllBooks();
								for (BookDetails b : list) {
								%>
								<tr>
									<td><%=b.getBookId()%></td>
									<td><%=b.getBookname()%></td>
									<td><%=b.getAuthor()%></td>
									<td><%=b.getPrice()%></td>
									<td><%=b.getBookCategory()%></td>
									<td><%=b.getBookStatus()%></td>
									<td><img src="../bookImg/<%=b.getPhotoName()%>"
										style="width: 50px; height: 50px"></td>
									<td><%=b.getEmail()%></td>
									<td>
										<form action="../deleteBook" method="post">
											<input type="hidden"name="bookid" value="<%=b.getBookId() %>">
											<a href="EditBook.jsp?bookId=<%=b.getBookId()%>"
												class="btn btn-sm btn-primary"><i class="fa-solid fa-user-pen"></i>&nbsp;Edit</a>&nbsp;
											<button type="submit" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>&nbsp;Delete</button>

										</form>
									</td>


								</tr>

								<%
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>