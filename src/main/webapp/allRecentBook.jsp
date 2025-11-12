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
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="all_component/All_css.jsp"%>
<title>AllRecentBook</title>
<style>
/* -------------Book Container css-----------------  */
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
/* -----------------Footer CSS-------------------------- */
.footer {
	margin-top: 0px !important;
}

#carouselExampleIndicators {
	height: 70vh; /* Adjust the carousel height */
}

#carouselExampleIndicators .carousel-inner {
	height: 100%; /* Ensure the inner container fills the carousel */
}

#carouselExampleIndicators .carousel-item {
	height: 100%; /* Make each slide take full height */
}

#carouselExampleIndicators .carousel-item img {
	height: 100%; /* Set images to fill the slide height */
	object-fit: fitr;
	/* Ensure images maintain aspect ratio and fill space */
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel" data-bs-touch="true" data-bs-interval="3000">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imageEbook/BookHoarding_2.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="imageEbook/ManWhitBook.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="imageEbook/Books-and-cover.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="imageEbook/BookHoarding_3.jpg" class="d-block w-100"
					alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="bodyContainer">
		<div class="container-fluid pt-5">
			<div class="TitleContainer">
				<div class="section-title-container">
					<div class="section-title">New Arrivals</div>
				</div>
			</div>
			<div class="row ">
				<%
				User u = (User) session.getAttribute("userObj");
				%>
				<%
				BookCurdImp dao2 = new BookCurdImp(DBconnect.getConn());
				List<BookDetails> list1 = dao2.getAllRecentBook();
				for (BookDetails b : list1) {
				%>
				<div class="col-md-3">
					<div class="card mt-4 bookcontainer">
						<div class="card-body text-center cbody">
							<img src="bookImg/<%=b.getPhotoName()%>" alt="Java Programming"
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
								class="fa-solid fa-basket-shopping"></i>&nbsp;Details</a> <a
								href="#" class="btn btn-warning mt-2">&#8377; <%=b.getPrice()%></a>
							<%
							} else {
							%>
							<p>
								<strong>Category:</strong>
								<%=b.getBookCategory()%>
							</p>
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

	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>