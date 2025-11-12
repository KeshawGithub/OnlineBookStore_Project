<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home</title>
<%@include file="../all_component/All_css.jsp"%>
<link rel="stylesheet" href="AdminStyle.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Inter", sans-serif;
}
/* ------------NavBar CSS--------------- */
.bg-custom {
	background: #e57373 !important;
}

body {
	background: #ffcdd2;
}

.body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 475px;
}

body h2 {
	margin-top: 67px;
	font-size: 39px;
}

body p {
	font-size: 27px;
	margin-bottom: 0;
}

.swiper-button-prev {
	color: #894195;
}

.swiper-button-next {
	color: #894195;
}

.container {
	padding: 40px 42px;
	max-width: 1200px;
	overflow: hidden;
	background: transparent;
}

.card-list {
	display: flex;
	flex-direction: column;
	align-items: center;
	background: #fff;
	border-radius: 12px;
	box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.5);
	transition: 0.5s ease;
}

.card-list:hover {
	box-shadow: 2px 10px 20px rgba(0, 0, 0, 0.8);
	transform: translateY(-20px);
}

.card-item {
	width: 100%;
	height: 200px;
}

.text {
	margin-bottom: 5px;
	font-size: 25px;
}

#addbook {
	color: #2e7d32;
}

#allbook {
	color: #9e9d24;
}

#order {
	color: #ffc400;
}

#alluser {
	color: #7c4dff;
}

#logout {
	color: #dd2c00;
}

#addbook:hover {
	color: #ef5350;
}

#allbook:hover {
	color: #ef5350;
}

#order:hover {
	color: #ef5350;
}

#alluser:hover {
	color: #ef5350;
}

#logout:hover {
	color: #ef5350;
}

.card-wrapper .swiper-pagination-bullet {
	height: 20px;
	width: 20px;
	opacity: 0.2;
	background: #5372f0;
	transform: translateY(-100%);
}

.card-wrapper .swiper-pagination-bullet-active {
	opacity: 1.0;
}
.modal-footer {
	justify-content: center;
}

.modal-content {
	background-image: linear-gradient(to right bottom, #fc4e4e, #fd6568, #fc7a7f, #f98e96, #f4a2aa);
	color:white;
	border-radius: 1.3rem;
	background-color: transparent;
	box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
}
.modal-header{
	    justify-content: center;
}
@media screen and (max-width: 1024px) {
	.body {
		height: 377px;
	}
}

@media screen and (max-width: 769px) {
	.body {
		height: 374px;
	}
	body h2 {
		padding-top: 10px;
		font-size: 35px;
	}
	body p {
		font-size: 22px;
	}
	.container {
		padding: 40px 39px;
		width: 608px;
	}
	.card-list {
		height: 280px;
	}
	.text {
		font-size: 16px;
	}
}

/* Fixed the incorrect min-width media query */
@media screen and (max-width: 427px) {
	.swiper-button-prev, .swiper-button-next {
		display: none;
	}
	.body {
		height: 372px;
	}
}
</style>
</head>
<body>
	<%@include file="AdminNavbar.jsp"%>
	<c:if test ="${empty AdminObj}">
	<c:redirect url="../register.jsp"/>
	</c:if>
	<h2 class="text-center">
		Welcome, <b>Admin!</b>
	</h2>
	<p class="text-center">Your control center is ready to help you</p>
	<div class="body">

		<div class="container swiper">
			<div class="card-wrapper swiper-wrapper">
				<div class="swiper-slide">
					<div class="card-list ">
						<div class="card-item">
							<img src="AdminImg/b1.png" alt="bookImg" width="100%"
								height="100%">
						</div>
						<p class="text">Add Books</p>
						<a href="addBook.jsp"><i id="addbook"
							class="fa-solid fa-square-plus fs-1 "></i></a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card-list">
						<div class="card-item">
							<img src="AdminImg/b2.png" alt="bookImg" width="100%"
								height="100%">
						</div>
						<p class="text">All Books</p>
						<a href="allBooks.jsp"><i id="allbook"
							class="fa-solid fa-book-open fs-1 "></i></a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card-list">
						<div class="card-item">
							<img src="AdminImg/b3.png" alt="bookImg" width="100%"
								height="100%">
						</div>
						<p class="text">Order</p>
						<a href="allOrder.jsp"><i id="order" class="fa-solid fa-box-open fs-1 "></i></a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card-list ">
						<div class="card-item">
							<img src="AdminImg/p5.png" alt="bookImg" width="100%"
								height="100%">
						</div>
						<p class="text">All User</p>
						<a href="allUser.jsp"><i id="alluser" class="fa-solid fa-users fs-1 "></i></a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card-list swiper-slide">
						<div class="card-item">
							<img src="AdminImg/u2.png" alt="bookImg" width="100%"
								height="100%">
						</div>
						<p class="text">LogOut</p>
						
							
							<button type="submit" id="logout" style="background:transparent; border:none" data-bs-toggle="modal" data-bs-target="#logoutModal">
								<i class="fa-solid fa-right-from-bracket fs-1"></i>
							</button>
						
<!-- 
						<a href="#"><i id="logout"
							class="fa-solid fa-right-from-bracket fs-1 "></i></a> -->
					</div>
				</div>
			</div>
			<!-- If we need pagination -->
			<div class="swiper-pagination"></div>

			<!-- If we need navigation buttons -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>

		</div>

	</div>


<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1"
	aria-labelledby="logoutModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
			</div>
			<div class="modal-body">
				
					<h4>Do you want to Logout...</h4>
	
			</div>
			<div class="modal-footer text-center">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
				<form action="../logoutAdmin" method="post">
					<button type="submit" class="btn btn-primary" id="confirmLogout">LogOut</button>
				</form>
			</div>
		</div>
	</div>
</div>





	<script>
		new Swiper('.swiper', {

			loop : true,
			spaceBetween : 50,

			// If we need pagination
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
				dynamicBullets : true
			},

			// Navigation arrows
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},

			breakpoints : {
				0 : {
					slidesPerView : 1
				},
				425 : {
					slidesPerView : 1
				},
				650 : {
					sliderperview : 2
				},
				768 : {
					slidesPerView : 2
				},
				1024 : {
					slidesPerView : 4
				}
			}

		});
	</script>
</body>
</html>