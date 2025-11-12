<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="Ebook.DB.DBconnect"%>
<%@page import="Ebook.Curd.BookCurdImp"%>
<%@page import="Ebook.Entity.BookDetails"%>
<%@page import="Ebook.Entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_component/All_css.jsp"%>
<title>Sell Old Book</title>
<style>
body {
	background: #ffcdd2;
}

.card {
	background: transparent;
	border: none;
	border-radius: 8px;
	margin-bottom: 12px;
}

.bb {
	background: #fff;
	padding: 0px 50px;
	border-radius: 30px;
	box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px
		10px 10px;
}
.bbb {
	padding: 30px;
	background: #C4BABD;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	border-radius: 15px;
}
.bgimg {
	margin: 0px 50px 0px 20px;
}

h3 {
	font-size: 35px;
	color: #000;
	font-family: ' Serif(red serifs)';
	margin: 20px 0px;
}

/* for button 6*/
.btn6 {
	margin: 5px;
	font-size: 18px;
	font-weight: bold;
	height: 42px;
	background: #757575;
	color: white;
	border-color: black;
	border-radius: 10px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	cursor: pointer;
	position: relative;
	z-index: 1;
	overflow: hidden;
	transition: 1s all ease;
}

.btn6::before {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300%;
	height: 300%;
	background: #2e7d32;
	border-radius: 70%;
	z-index: -1;
	transform: translate(-50%, -50%) scale(0);
	transition: 1.5s all ease;
}

.btn6:hover::before {
	transform: translate(-50%, -50%) scale(1);
}

.btn6:hover {
	color: black;
	/* background-color: white; */
	border-color: black;
}

.footer {
	margin-top: 20px !important;
}
</style>

</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="register.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<form action="sellOldBook" method="post"
						enctype="multipart/form-data">
						<div class="row ">
							<div class="col-md-6">
								<div class="bbb">
								<h3 class="text-center h3">Your Uploaded Books</h3>
								<c:if test="${empty userObj}">
									<c:redirect url="register.jsp" />
								</c:if>
								<!-- Display success or error messages with the help of jstl -->

								<c:if test="${not empty RemoveSucc }">
									<div class="alert alert-success text-center fs-3" role="alert">${RemoveSucc}</div>
									<c:remove var="RemoveSucc" scope="session" />
								</c:if>
								<c:if test="${not empty RemoveFaield}">
									<div class="alert alert-danger text-center fs-3" role="alert">${RemoveFaield}</div>
									<c:remove var="RemoveFaield" scope="session" />
								</c:if>
								<table class="table table-striped">
									<thead>
										<tr>
											<td scope="col">Book</td>
											<td scope="col">Book Name</td>
											<td scope="col">Author</td>
											<td scope="col">Price</td>
											<td scope="col">Action</td>
										</tr>
									</thead>
									<tbody>
										<%
										User u = (User) session.getAttribute("userObj");
										if (u != null) {
											BookCurdImp dao = new BookCurdImp(DBconnect.getConn());
											List<BookDetails> bookList = dao.getAllUploadedBookByUser(u.getEmail());

											if (bookList != null && !bookList.isEmpty()) {
												for (BookDetails c : bookList) {
										%>
										<tr>
											
											<td scope="row"><img src="bookImg/<%=c.getPhotoName()%>"
										style="width: 50px; height: 50px"></td>
											<th><%=c.getBookname()%></th>
											<td><%=c.getAuthor()%></td>
											<td><%=c.getPrice()%></td>
											<td><a
												href="removeOldBook?bookId=<%=c.getBookId()%>&email=<%=c.getEmail()%>"
												class="btn btn-sm btn-danger"> <i
													class="fa-solid fa-trash"></i> Remove
											</a></td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td colspan="4">No books found. Please upload books to
												view them here.</td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td colspan="4">User not logged in. Please log in to
												view your uploaded books.</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>


								
								</div>



							</div>

							<div class="col-md-6 bb ">

								<h3 class="text-center">Sell Old Book</h3>
								<!-- Display success or error messages with the help of jstl -->
								<div class="massege">
									<c:if test="${not empty bookSuccMsg }">
										<p class="text-center text-success fs-4 ">${bookSuccMsg}</p>
										<c:remove var="bookSuccMsg" scope="session" />
									</c:if>
									<c:if test="${not empty bookFailedMsg }">
										<p class="text-center text-warning fs-4 ">${bookFailedMsg}</p>
										<c:remove var="bookFailedMsg" scope="session" />
									</c:if>
								</div>
								<input type="hidden" value="${userObj.email }" name="UserEmail">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label fs-5">Book
										Name</label> <input type="text" class="form-control" name="bookName"
										id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label fs-5">Author
										Name</label> <input type="text" class="form-control" name="authorName"
										id="exampleInputPassword1">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail" class="form-label fs-5">Price</label>
									<input type="text" class="form-control" name="price"
										id="exampleInputPassword1">
								</div>
								<div class="mb-3">
									<label for="exampleInputControlFile1" class="form-label fs-5">Upload
										Image</label> <input type="file" class="form-control" name="BookImage"
										id="exampleInputControlFile1">

								</div>
								<div class="mb-3 mt-4 text-end">
									<button type="submit" class="btn btn6 col-md-5 btnn">Add
										Book</button>

								</div>
							</div>


						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>