<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="Ebook.DB.DBconnect"%>
<%@page import="Ebook.Curd.CartCurdImp"%>
<%@page import="Ebook.Entity.BookCart"%>
<%@page import="Ebook.Entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Details</title>
<%@include file="all_component/All_css.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
* {
	padding: 0;
	margin: 0;
}

body {
	background-color: #ffcdd2;
}

.body {
	padding-top: 60px;
}

.leftDiv, .rightDiv {
	padding: 10px;
}

.card {
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	animation: fadeInUp 0.8s ease;
}

.card-body {
	padding: 30px;
	background: #C4BABD;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	border-radius: 15px;
}
.c{
	background-image: linear-gradient(to bottom, #faf3f3, #ffd6d6, #ffb9b8, #fe9b9a, #fa7d7c);
}
h3 {
	font-family: 'Playball', cursive; /* Stylish Font */
	font-size: 2rem;
	font-weight: bold;
	color: black;
	text-shadow: 1px 1px 2px red, 0 0 1em red, 0 0 0.2em red;
}
.h3{
	color: white;
	text-shadow: 1px 1px 2px red, 0 0 1em black, 0 0 0.2em black;
	font-size: 3rem;
}
.table th, .table td {
	vertical-align: middle;
}

.textHead {
	margin-bottom: 20px;
	font-weight: bold;
}

.Contant h5 {
	margin-bottom: 15px;
	color: #212121;
	padding-left: 50px;
}

.Contant span {
	font-weight: 500;
	color: #263238 ;
}
.yellow-btn{
	background:#ffa000;
	color:white;
}
 @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
@media ( max-width : 768px) {
	.leftDiv, .rightDiv {
		margin-bottom: 20px;
	}
	.card-body {
		padding: 20px;
	}
	   .container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="body">
		<c:if test="${empty userObj}">
			<c:redirect url="register.jsp" />
		</c:if>
		<!-- Display success or error messages with the help of jstl -->
		
		<c:if test="${not empty orderSuccess }">
			<p class="text-center text-success">${orderSuccess}</p>
			<c:remove var="orderSuccess" scope="session" />
		</c:if>
		
		<c:if test="${not empty RemoveSucc }">
			<div class="alert alert-success text-center fs-3" role="alert">${RemoveSucc}</div>
			<c:remove var="RemoveSucc" scope="session" />
		</c:if>
		<c:if test="${not empty RemoveFaield}">
			<div class="alert alert-danger text-center fs-3" role="alert">${RemoveFaield}</div>
			<c:remove var="RemoveFaield" scope="session" />
		</c:if>

		<div class="container">
			<div class="row p-2">
				<div class="col-md-6 leftDiv">
					<div class="card bg-white">
						<div class="card-body">
							<h3 class="text-center h3">Your Selected Items</h3>
							<table class="table table-striped">
								<thead>
									<tr>
										<td scope="col">Book Name</td>
										<td scope="col">Author</td>
										<td scope="col">Price</td>
										<td scope="col">Action</td>
									</tr>
								</thead>
								<tbody>
									<%
									User u = (User) session.getAttribute("userObj");
									CartCurdImp dao = new CartCurdImp(DBconnect.getConn());
									List<BookCart> bookList = dao.getBookByUser(u.getEmail());
									Double totalPrice = 0.0;
									for (BookCart c : bookList) {
										totalPrice = c.getTotalPrice();
									%>
									<tr>
										<th scope="row"><%=c.getBookName()%></th>
										<td><%=c.getAuthor()%></td>
										<td><%=c.getPrice()%></td>
										<td><a
											href="removeBook?cartId=<%=c.getCartId()%>&&userEmail=<%=c.getUserEmail()%>"
											class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>&nbsp;Remove</a></td>
									</tr>
									<%
									}
									%>
									<tr>
										<td></td>
										<td class="fs-1">Total Price</td>
										<td></td>
										<td><a href="#" class="btn btn-sm mt-2 yellow-btn">&#8377;
												<%=totalPrice%>&nbsp;<i class="fa-solid fa-face-smile"></i></a></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
				<div class="col-md-6 rightDiv">
					<div class="card ">
						<div class="card-body c">
							<h3 class="text-center textHead">Your Details For Order</h3>
							<div class="Contant">
								<h5>
									<i class="fa-solid fa-user-secret"></i>&nbsp;Name : <span><%=u.getUsername()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-envelope-open-text"></i>&nbsp;Email : <span><%=u.getEmail()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-phone-volume"></i>&nbsp;Contact No. : <span><%=u.getMobileNo()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-address-card"></i>&nbsp;Address : <span><%=u.getAddress()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-landmark"></i>&nbsp;Landmark : <span><%=u.getLandmark()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-city"></i>&nbsp;City : <span><%=u.getCity()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-route"></i>&nbsp;State : <span><%=u.getState()%></span>
								</h5>
								<h5>
									<i class="fa-solid fa-map-location-dot"></i>&nbsp;Pin-code : <span><%=u.getPincode()%></span>
								</h5>

							</div>
							<div class="text-end">
								<a href="Payments.jsp" class="btn  mt-2 yellow-btn">Place Order&nbsp;<i class="fa-solid fa-thumbs-up"></i></a>&nbsp; <a
									href="index.jsp" class="btn  btn-success mt-2">Continue Shopping&nbsp;<i class="fa-solid fa-cart-plus"></i></a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>