<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.*"%>
<%@page import="Ebook.Entity.Order"%>
<%@page import="Ebook.Entity.BookDetails"%>
<%@page import="Ebook.Curd.OrderCurdImp"%>
<%@page import="Ebook.Curd.BookCurdImp"%>
<%@page import="Ebook.DB.DBconnect"%>
<%@page import="Ebook.Entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_component/All_css.jsp"%>
<title>My Order</title>
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
<%@include file="all_component/navbar.jsp"%>

<!-- Redirect if not logged in -->
<c:if test="${empty userObj}">
	<c:redirect url="register.jsp" />
</c:if>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-12">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">My Order Details</p>

					<%
						User userObj = (User) session.getAttribute("userObj");
						if (userObj != null) {
						    OrderCurdImp dao = new OrderCurdImp(DBconnect.getConn());
						    List<Order> list = dao.getOrdersByEmail(userObj.getEmail());
						    BookCurdImp bc = new BookCurdImp(DBconnect.getConn());
					%>

					<table class="table table-bordered table-striped">
						<thead class="table-dark">
							<tr>
								<th scope="col">Order Id</th>
								<th scope="col">User Email</th>
								<th scope="col">Book Name(s)</th>
								<th scope="col">Author(s)</th>
								<th scope="col">Total Price <i class="fa-solid fa-indian-rupee-sign"></i></th>
								<th scope="col">Payment Type</th>
								<th scope="col">Order Date</th>
							</tr>
						</thead>

						<tbody>
							<%
								for (Order o : list) {
									String bookIds = o.getBookId(); // e.g. "2,5,7"
									String[] ids = bookIds.split(",");

									StringBuilder names = new StringBuilder();
									StringBuilder authors = new StringBuilder();

									for (String id : ids) {
										try {
											int bookId = Integer.parseInt(id.trim());
											BookDetails bd = bc.getBookById(bookId);
											if (bd != null) {
												if (names.length() > 0) names.append(", ");
												if (authors.length() > 0) authors.append(", ");
												names.append(bd.getBookname());
												authors.append(bd.getAuthor());
											}
										} catch (Exception ex) {
											ex.printStackTrace();
										}
									}
							%>
							<tr>
								<td><%=o.getOrderId()%></td>
								<td><%=o.getUseremail()%></td>
								<td><%=names.toString()%></td>
								<td><%=authors.toString()%></td>
								<td><%=o.getTotalPrice()%></td>
								<td><%=o.getModeOfPayment()%></td>
								<td><%=o.getOrderDate()%></td>
							</tr>
							<%
								} // end for loop

								if (list.isEmpty()) {
							%>
							<tr>
								<td colspan="8" class="text-center text-danger">No Orders Found!</td>
							</tr>
							<%
								} // end if list empty
							%>
						</tbody>
					</table>

					<%
						} else {
					%>
						<h4 class="text-center text-danger">User not logged in!</h4>
					<%
						} // end outer if
					%>

				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
