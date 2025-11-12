<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_component/All_css.jsp"%>
<title>User Setting</title>
<style>
body {
	background-image: linear-gradient(to top, #f7aabc, #f5a0b2, #f397a7, #f08d9c, #ed8491, #e97d88, #e5757f, #e06e76, #d9676d, #d26064, #cb5a5c, #c45353);

}
h2{
font-size:50px;
color:#fff;
font-style:italic;
}
@keyframes heartbeat {
    0% {
        transform: scale(1);
    }
    30% {
        transform: scale(1.2);
    }
    50% {
        transform: scale(1);
    }
    70% {
        transform: scale(1.2);
    }
    100% {
        transform: scale(1);
    }
}
.heartbeat {
	font-weight: bold;
	animation: heartbeat 1.5s 3 ease-in-out; /* Apply animation */
}
.cc{
height:64vh;
}
.rr{
display:flex;
justify-content:center;
align-items:center;
padding:25px 25px 15px 25px;
}
.card{
height:170px;
display:flex;
justify-content:center;
align-items:center;
box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
border-radius:5px;
margin-top:20px;
transition: transform 0.6s, box-shadow 1.0s, background-color 0.6s, color 0.7s;
}
.card:hover{
 transform: translateY(-15px);
 
 background:#ffebee;
}
a {
	text-decoration: none;
	color: #37474f ;
}

a:hover {
	text-decoration: none;
	color: #000;
}

.rowpadding {
	padding: 0px 25px 25px 25px;
}
.fa-book-open-reader{
color:#33691e;
}
.fa-user-gear{
color:orange;
}
.fa-location-dot{
color:#2196f3;
}
.fa-box-open{
color:#ffd600;
}
.fa-pen-to-square{
color:blue;
}
@media (max-width: 768px) {
	.card {
		height: 220px; /* Increase card height */
		width: 100%; /* Make the card fill the width */
	}
	.container{
	height:100%;
	}
}
</style>
</head>
<body>
<c:if test="${empty userObj }">
<c:redirect url="register.jsp"/>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	
	<h2 class="text-center mt-5 heartbeat">Hello, ${userObj.username}</h2>
	
	<div class="container cc">
		<div class="row rr">
			<div class="col-md-5">
				<a href="SellOldBook.jsp">
					<div class="card p-3">
						<div class="card-Body text-center">
							<i class="fa-solid fa-book-open-reader fs-1"></i>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-5">
				<a href="EditProfile.jsp">
					<div class="card p-3">
						<div class="card-Body text-center">
							<i class="fa-solid fa-pen-to-square fs-1"></i>
							<h3>Login Security<br>(Edit Profile)</h3>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="row rowpadding">
			<div class="col-md-4">
				<a href="AddAddress.jsp">
					<div class="card p-3">
						<div class="card-Body text-center">
							<i class="fa-solid fa-location-dot fs-1"></i>
							<h3>Your Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="MyOrder.jsp">
					<div class="card p-3">
						<div class="card-Body text-center">
							<i class="fa-solid fa-box-open fs-1"></i>
							<h3>My Order</h3>
							<p>Track your order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="HelpCenter.jsp">
					<div class="card p-3">
						<div class="card-Body text-center">
							<i class="fa-solid fa-user-gear fs-1"></i>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>