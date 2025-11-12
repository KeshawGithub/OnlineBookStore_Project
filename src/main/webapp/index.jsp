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

<title>EBook Index</title>
<%@include file="all_component/All_css.jsp"%>
<!-- <link rel="stylesheet" href="IndexStyle.css"> -->
<style type="text/css">
@charset "ISO-8859-1";

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-image: url("imageEbook/bgGirlImage.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
/* ------------NavBar CSS--------------- */
.bg-custom {
	background: transparent !important;
}
/* -------------After NavBar Container css-----------------  */
.back-img {
	background: url("imageEbook/Book.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	height: 550px;
}

.back-img h1 {
	color: white;
	padding: 100px 0 0 170px;
	text-shadow: 0px 7px 10px black;
}

.text {
	display: inline-block;
	padding-left: 10px;
	margin-top: 80px
}

/*-------------Feature Container-----------------*/
.features {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background: white;
	padding: 35px;
	text-align: center;
	flex-wrap: wrap;
}

.feature-box {
	display: flex;
	align-items: center;
	gap: 10px;
	margin: 10px;
}

.feature-box i {
	font-size: 30px;
	color: #ef5350;
}

.feature-text h3 {
	font-size: 1.2em;
	color: #222;
	font-weight: bold;
}

.feature-text p {
	font-size: 0.9em;
	color: #555;
}

/* ---------------Search Container css---------------------- */
.SearchContainer {
	display: flex;
	justify-content: center;
	padding: 20px;
	background: #b0bec5;
}

.SearchContainer form {
	display: flex;
	align-items: center;
	border: 2px solid #ddd;
	border-radius: 25px;
	overflow: hidden;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.SearchContainer input[type="text"] {
	padding: 10px 15px;
	font-size: 16px;
	border: none;
	outline: none;
	flex: 1;
	width: 700px;
}

.SearchContainer button {
	background-color: #ff6f61;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.SearchContainer button:hover {
	background-color: #ff3d30;
}

/* -------------subscribe-section css-----------------  */
.subscribe-section {
	height: 300px;
	padding: 80px 130px 80px 80px;
	display: flex;
	justify-content: right;
	align-items: center;
	background: transparent /* Background color */;
	display: flex;
}

.subscribe-form {
	display: flex;
	flex-direction: column;
	align-items: end;
}

.subscribe-form h2 {
	color: white;
	font-size: 25px;
	margin-bottom: 10px;
}

.subscribe-form input[type="email"] {
	padding: 10px;
	font-size: 16px;
	border: none;
	border-radius: 10px;
	width: 300px;
	background: #e8eaf6;
}

.subscribe-form input[type="email"]:focus {
	background: white;
	border: none;
	outline: none;
	box-shadow: none; /* Ensures no shadow appears */
}

.subscribe-form button {
	margin-top: 10px;
	padding: 5px 40px;
	font-size: 16px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.subscribe-form button:hover {
	background-color: #218838;
}
/* -------------Book Container css-----------------  */
.btn-custom1 {
	font-size: 18px;
	font-weight: bold;
	width: 150px;
	height: 40px;
	background: white;
	border: 2px solid #e57373;
	color: #e57373;
	border-radius: 10px;
	box-shadow: -2px 2px 5px rga(0, 0, 0, .5);
	cursor: pointer;
	position: relative;
	z-index: 1;
	overflow: hidden;
	transition: 1s all ease;
}

.btn-custom1::before {
	content: '';
	width: 50%;
	height: 100%;
	background: #ef5350;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	transform: translateX(-100%);
	transition: 1s all ease;
}

.btn-custom1:hover::before {
	transform: translateX(0%) rotate(180deg);
}

.btn-custom1::after {
	content: '';
	width: 50%;
	height: 100%;
	background: #ef5350;
	position: absolute;
	top: 0;
	left: 50%;
	z-index: -1;
	transform: translateX(100%);
	transition: 1s all ease;
}

.btn-custom1:hover::after {
	transform: translateX(-2%) rotate(180deg);
}

.btn-custom1:hover {
	color: white;
	border-color: white;
}

.bodyContainer {
	font-family: 'Arial', sans-serif;
	background-color: #eeeeee;
	padding-bottom: 30px;
}

.TitleContainer {
	font-family: 'Arial', sans-serif;
	display: flex;
	justify-content: center;
	padding: 20px 0;
}

.section-title-container {
	width: 100%;
	max-width: 1200px;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

.section-title-container::before, .section-title-container::after {
	content: "";
	flex: 1;
	height: 1px;
	background: #37474f;
	position: relative;
	top: 0%;
	margin: 0 0;
}

.section-title {
	font-size: 25px;
	font-weight: bold;
	padding: 3px 20px;
	background: #fff;
	border: 1px solid #37474f;
	border-radius: 4px;
}

.bookcontainer {
	border-radius: 15px;
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s,
		color 0.4s;
}

.bookcontainer:hover {
	background-color: #e0e0e0;
	transform: translateY(-15px);
	box-shadow: 0 10px 20px #455a64;
	/* Adjust shadow for better contrast */
}

.cbody {
	padding-left: 0px;
	padding-right: 0px;
}

@media only screen and (max-width:575px) {
	.back-img {
		height: 600px;
	}
	.back-img h1 {
		font-size: 44px;
		padding-left: 20px;
		background-repeat: no-repeat;
		background-size: cover;
	}
	.features {
		display: flex;
		overflow: hidden;
	}

}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userObj");
	%>



	<!-- -------------After NavBar Container-----------------  -->
	<div class="container-fulid back-img">

		<%@include file="all_component/navbar.jsp"%>
		<div class="text">
			<h1>
				Effortless <i class="fa-solid fa-book"></i>Book Trading....
			</h1>
			<!-- Display success or error messages with the help of jstl -->
						<div class="massege">
							<c:if test="${not empty addCart }">
								<p class="text-center text-light fs-4 ">${addCart}</p>
								<c:remove var="addCart" scope="session" />
							</c:if>
							<c:if test="${not empty notAdded }">
								<p class="text-center text-danger fs-4 ">${notAdded}</p>
								<c:remove var="notAdded" scope="session" />
							</c:if>
	
							<c:if test="${not empty Logout }">
								<p class="text-center text-light fs-4 ">${Logout}</p>
								<c:remove var="Logout" scope="session" />
							</c:if>
							
							<c:if test="${not empty LoginSuccMsg }">
								<p class="text-center text-light fs-4 ">${LoginSuccMsg}</p>
								<c:remove var="LoginSuccMsg" scope="session" />
							</c:if>
						</div>
		</div>
	</div>

	<!-- -------------Feature Container-----------------  -->
	<div class="container-fulid ">
		<div class="features ">
			<div class="feature-box">
				<i class="fas fa-truck"></i>
				<div class="feature-text">
					<h3>Free Shipping</h3>
					<p>Order Over $100</p>
				</div>
			</div>

			<div class="feature-box">
				<i class="fas fa-lock"></i>
				<div class="feature-text">
					<h3>Secure Payment</h3>
					<p>100% Secure Payment</p>
				</div>
			</div>

			<div class="feature-box">
				<i class="fas fa-undo"></i>
				<div class="feature-text">
					<h3>Easy Returns</h3>
					<p>10 Days Returns</p>
				</div>
			</div>

			<div class="feature-box">
				<i class="fas fa-headset"></i>
				<div class="feature-text">
					<h3>24/7 Support</h3>
					<p>Call Us Anytime</p>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------Search Container-------------------- -->
	<div class="SearchContainer">
		<form>
			<input type="text" placeholder="What you are looking for?">
			<button type="submit">Search</button>
		</form>
	</div>

	<!-- ------------Search Container End---------------- -->

	<!-- -------------Recent Book Container-----------------  -->
	<div class="bodyContainer">
		<div class="container-fluid pt-3">
			<div class="TitleContainer">
				<div class="section-title-container">
					<div class="section-title">New Arrivals</div>
				</div>
			</div>

			<div class="row ">
				<%
				BookCurdImp dao2 = new BookCurdImp(DBconnect.getConn());
				List<BookDetails> list1 = dao2.getRecentBook();
				for (BookDetails b : list1) {
				%>
				<div class="col-md-3">
					<div class="card mt-4 bookcontainer">
						<div class="card-body text-center cbody">
							<img src="bookImg/<%=b.getPhotoName()%>" alt="Book Image"
								class="img-thumbnail" style="width: 150px; height: 200px;">
							<h5 class="mt-2"><%=b.getBookname()%></h5>
							<p><%=b.getAuthor()%></p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							<p>
								<strong>Category:</strong>
								<%=b.getBookCategory()%>
							</p>
							<a href="viewBook.jsp?bookId=<%=b.getBookId()%>"
								class="btn btn-success mt-2"><i
								class="fa-solid fa-basket-shopping"></i>&nbsp;Details</a>
							 <a
								href="#" class="btn btn-warning mt-2">&#8377; <%=b.getPrice()%></a>
							<%
							} else {
							%>
							<p>
								<strong>Category:</strong>
								<%=b.getBookCategory()%>
							</p>
							<div>
								<%
								if (u == null) {
								%>
								<a href="register.jsp" class="btn btn-danger mt-2"><i
									class="fa-solid fa-cart-shopping"></i>&nbsp;Add Cart</a>
								<%
								} else {
								%>
								<a
									href="cartServlet?bookId=<%=b.getBookId()%>&&userEmail=<%=u.getEmail()%> "
									class="btn btn-danger mt-2"><i
									class="fa-solid fa-cart-shopping"></i>&nbsp;Add Cart</a>
								<%
								}
								%>

								<a href="viewBook.jsp?bookId=<%=b.getBookId()%>"
									class="btn btn-success mt-2"><i
									class="fa-solid fa-basket-shopping"></i>&nbsp;Details</a> <a
									href="#" class="btn btn-warning mt-2">&#8377; <%=b.getPrice()%></a>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
		<div class="text-center mb-2">
			<a href="allRecentBook.jsp" class="btn btn-custom1 mt-5">View All</a>
		</div>
	</div>

	<!-- -------------subscribe-section-----------------  -->
	<div class="subscribe-section">
		<form class="subscribe-form">
			<h2>Subscribe For Latest Updates</h2>
			<input type="email" placeholder="Enter your email" required>
			<button type="submit">Subscribe</button>
		</form>
	</div>


	<!-- -------------New Book Container-----------------  -->
	<div class="bodyContainer">
		<div class="container-fluid pt-3">
			<div class="TitleContainer">
				<div class="section-title-container">
					<div class="section-title">New Book</div>
				</div>
			</div>
			<div class="row ">
				<%
				BookCurdImp dao = new BookCurdImp(DBconnect.getConn());
				List<BookDetails> list = dao.getNewBook();
				for (BookDetails b : list) {
				%>
				<div class="col-md-3 ">

					<div class="card mt-4 bookcontainer">
						<div class="card-body text-center cbody">
							<img src="bookImg/<%=b.getPhotoName()%>" alt="Java Programming"
								class="img-thumbnail" style="width: 150px; height: 200px;">
							<h5 class="mt-2"><%=b.getBookname()%></h5>
							<p><%=b.getAuthor()%></p>
							<p>
								<strong>Category:</strong>
								<%=b.getBookCategory()%>
							</p>
							<div>
							<%
								if (u == null) {
								%>
								<a href="register.jsp" class="btn btn-danger mt-2"><i
									class="fa-solid fa-cart-shopping"></i>&nbsp;Add Cart</a>
								<%
								} else {
								%>
								<a
									href="cartServlet?bookId=<%=b.getBookId()%>&&userEmail=<%=u.getEmail()%> "
									class="btn btn-danger mt-2"><i
									class="fa-solid fa-cart-shopping"></i>&nbsp;Add Cart</a>
								<%
								}
								%>
								 <a
								href="viewBook.jsp?bookId=<%=b.getBookId()%>"
								class="btn btn-success mt-2"><i
								class="fa-solid fa-basket-shopping"></i>&nbsp;View Details</a> <a
								href="#" class="btn btn-warning mt-2">&#8377; <%=b.getPrice()%></a>
						</div>
						</div>
						
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mb-2">
			<a href="allNewBook.jsp" class="btn btn-custom1 mt-5">View All</a>
		</div>
	</div>


	<!-- -------------Old Book Container-----------------  -->
	<div class="bodyContainer">
		<div class="container-fluid pt-3">
			<div class="TitleContainer">
				<div class="section-title-container">
					<div class="section-title">Old Book</div>
				</div>
			</div>
			<div class="row ">
				<%
				BookCurdImp dao3 = new BookCurdImp(DBconnect.getConn());
				List<BookDetails> list3 = dao3.getOldBook();
				for (BookDetails b : list3) {
				%>
				<div class="col-md-3">
					<div class="card mt-4 bookcontainer">
						<div class="card-body text-center cbody">
							<img src="bookImg/<%=b.getPhotoName()%>" alt="Java Programming"
								class="img-thumbnail" style="width: 150px; height: 200px;">
							<h5 class="mt-2"><%=b.getBookname()%></h5>
							<p><%=b.getAuthor()%></p>
							<p>
								<strong>Category:</strong>
								<%=b.getBookCategory()%>
							</p>
							<a href="viewBook.jsp?bookId=<%=b.getBookId()%>"
								class="btn btn-success mt-2"><i
								class="fa-solid fa-basket-shopping"></i>&nbsp;View Details</a> <a
								href="#" class="btn btn-warning mt-2">&#8377; <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mb-2">
			<a href="allOldBook.jsp" class="btn btn-custom1 mt-5">View All</a>
		</div>

	</div>




	<%@include file="all_component/footer.jsp"%>
</body>
</html>