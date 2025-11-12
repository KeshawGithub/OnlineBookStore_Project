<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="Ebook.Entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_component/All_css.jsp"%>
<title>Edit Address</title>
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

.bgimg {
	margin: 0px 50px 0px 20px;
}
.addressBG{
	background-image:url('imageEbook/AddressBG.png');
	background-postion:cover;
	background-repeat:no-repeat;
	margin-right:50px;
	
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
	background: blue;
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
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userObj}">
			<c:redirect url="register.jsp" />
	</c:if>
	<div class="container mt-3">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<form action="UploadAddress" method="post">
						<div class="row ">
							<div class="col-md-6 addressBG bb">
							<div class="massage">
								<c:if test="${not empty Msg }">
									<h1 class="text-center text-danger mt-5">${Msg}</h1>
									<c:remove var="Msg" scope="session" />
								</c:if>
							</div>
							</div>

							<div class="col-md-5 bb ">

								<h3 class="text-center">Add Address</h3>
								<!-- Display success or error messages with the help of jstl -->
								<div class="massege">
									<c:if test="${not empty succMsg }">
										<p class="text-center text-success fs-4 ">${succMsg}</p>
										<c:remove var="succMsg" scope="session" />
									</c:if>
									<c:if test="${not empty FailedMsgMsg}">
										<p class="text-center text-danger fs-4 ">${FailedMsgMsg}</p>
										<c:remove var="FailedMsgMsg" scope="session" />
									</c:if>
								</div>
								 
								<input type="hidden" value="${userObj.email}" name="email">
								<div class="mb-2">
									<label for="exampleInputEmail1" class="form-label fs-5">Address
									</label> <input type="text" class="form-control" name="Address" value="${userObj.address}"
										id="exampleInputEmail1" aria-describedby="emailHelp" required>
								</div>
								<div class="mb-2">
									<label for="exampleInputEmail1" class="form-label fs-5">Landmark
									</label> <input type="text" class="form-control" name="Landmark" value="${userObj.landmark}"
										id="exampleInputPassword1" required>
								</div>
								<div class="mb-2">
									<label for="exampleInputEmail" class="form-label fs-5">City</label>
									<input type="text" class="form-control" name="city" value="${userObj.city}"
										id="exampleInputPassword1" required>
								</div>
								<div class="mb-2">
									<label for="exampleInputEmail1" class="form-label fs-5">State
									</label> <input type="text" class="form-control" name="state" value="${userObj.state}"
										id="exampleInputEmail1" aria-describedby="emailHelp" required>

								</div>
								<div class="mb-2">
									<label for="exampleInputEmail1" class="form-label fs-5">PinCode
									</label> <input type="number" class="form-control" name="pincode" value="${userObj.pincode}"
										id="exampleInputEmail1" aria-describedby="emailHelp" required>

								</div>
								<div class="mb-2 mt-3 text-end">
									<button type="submit" class="btn btn6 col-md-5 btnn">Save
										Address</button>

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