<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book Details</title>
<%@include file="all_component/All_css.jsp"%>
<%@page import="Ebook.DB.DBconnect"%>
<%@page import="Ebook.Curd.BookCurdImp"%>
<%@page import="Ebook.Entity.BookDetails"%>
<style>
body {
	background: #f3e5f5;
}

.divLeft {
	background-image: linear-gradient(to right, #ef9a9a, #f5aeb1, #f9c2c6, #fcd7db, #ffebee);
	border-radius: 12px 0px 0px 12px;
}

.divRight {
	background-image: linear-gradient(to left, #ef9a9a, #f5aeb1, #f9c2c6, #fcd7db, #ffebee);
	border-radius: 0px 12px 12px 0px;
}

.iconContainer {
	height: 130px;
	padding-top: 20px;
}

.p {
	padding: 10px;
	font-size: 15px;
}

.btnfield {
	padding: -40px 10px 0 10px;
}

.fs {
	font-size: 35px;
	padding-bottom: 15px;
	color: red;
}

.container {
	margin-top: 70px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset,
		rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
	border-radius: 5px;
}

.bgh1 {
	background: #e57373;
	box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px
		13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
	border-radius: 0% 42% 0% 42%;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userObj");
	%>
	<%
	int bookId = Integer.parseInt(request.getParameter("bookId"));
	BookCurdImp dao = new BookCurdImp(DBconnect.getConn());
	BookDetails b = dao.getBookById(bookId);
	%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-5 text-center p-5 border divLeft">
				<img src="bookImg/<%=b.getPhotoName()%>"
					style="height: 150px; width: 130px"><br>
				<h4 class="mt-3">
					Book Name : <span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h5>
					Author Name : <span class="text-success"><%=b.getAuthor()%></span>
				</h5>
				<h5>
					Category : <span class="text-success"><%=b.getBookCategory()%></span>
				</h5>
			</div>
			<div class="col-md-7 text-center p-3 border divRight">
				<h2 class="fs-1 bgh1"><%=b.getBookname()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="pt-1">Contact To Seller</h5>
				<h5>
					<i class="far fa-envelop"></i>Email:<%=b.getEmail()%>
				</h5>
				<h5>
					<i class="far fa-envelop"></i>Contact No:<%=u.getMobileNo()%>
				</h5>
				<%
				} else {
				%>
				<h5 class="pt-3">Buy the New Book</h5>
				<h5>
					<i class="far fa-envelop"></i>Email:<%=b.getEmail()%>
				</h5>
				<%
				}
				%>
				<div class="iconContainer">
					<div class=row>
						<div class="col-md-4 text-center p">
							<i class="fa-solid fa-money-bill-wheat fs"></i>
							<p>Cash On Delivery</p>
						</div>
						<div class="col-md-4 text-center p">
							<i class="fa-solid fa-rotate-left fs"></i>
							<p>Return Available</p>
						</div>
						<div class="col-md-4 text-center p">
							<i class="fa-solid fa-truck-fast fs"></i>
							<p>Free Shipping</p>
						</div>
					</div>
					<%
					if ("Old".equals(b.getBookCategory())) {
					%>
					<div class="text-end btnfield">
						<a href="index.jsp" class="btn btn-primary m-2"><i
							class="fa-solid fa-cart-shopping"></i>&nbsp;Continue Shopping</a> <a
							href="#" class="btn btn-warning m-2">&#8377; 200</a>
					</div>
					<%
					} else {
					%>
					<div class="text-end btnfield">
						<a
							href="cartServlet?bookId=<%=b.getBookId()%>&&userEmail=<%=u.getEmail()%> "
							class="btn btn-primary m-2"><i
							class="fa-solid fa-cart-shopping"></i>&nbsp;AddCart</a> <a href="#"
							class="btn btn-warning m-2">&#8377; 200</a>
					</div>
					<%
					}
					%>
				</div>

			</div>
		</div>
	</div>
</body>
</html>