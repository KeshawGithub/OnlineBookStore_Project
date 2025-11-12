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
<title>Edit Profile</title>
<style>
body {
	background:#ffcdd2;

}

.card {
	background: transparent;
	border:none;
	border-radius: 8px;
	margin-bottom:12px;

}

.bb {
	background: #fff;
	padding: 0px 50px;
	border-radius: 30px;
	box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px
		10px 10px;
}

.bgimg{

	margin:0px 50px 0px 20px;
}
h3 {
	font-size: 35px;
	color: #000;
	font-family: ' Serif(red serifs)';
	margin: 20px 0px;
}
.addressBG{
	background-image:url('imageEbook/AddressBG2.png');
	background-postion:cover;
	background-repeat:no-repeat;
	margin-right:50px;
	
}
.massage{
display:flex;
    justify-content: center;
    align-items: center;
    height:100%
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
	font-size: 35px;
	color: Red;
	font-family: ' Serif(red serifs)';
	font-weight: bold;
	animation: heartbeat 1.5s 3 ease-in-out; /* Apply animation */
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
    margin-top: 20px!important;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<c:if test="${empty userObj}">
			<c:redirect url="register.jsp" />
		</c:if>
	<div class="container mt-5">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<form action="EditUser" method="post">
						<div class="row ">
							<div class="col-md-6 addressBG bb">
							<div class="massage">
								<c:if test="${not empty Msg }">
									<h4 class="text-center heartbeat">${Msg}</h4>
									<c:remove var="Msg" scope="session" />
								</c:if>
							</div>
							</div>
							
							<div class="col-md-5 bb ">

								<h3 class="text-center">Edit Profile</h3>
								<c:if test="${empty userObj}">
									<c:redirect url="register.jsp" />
								</c:if>
								<!-- Display success or error messages with the help of jstl -->

								<c:if test="${not empty succMsg }">
									<div class="alert alert-success text-center fs-3" role="alert">${succMsg}</div>
									<c:remove var="succMsg" scope="session" />
								</c:if>
								<c:if test="${not empty FailedMsg}">
									<div class="alert alert-danger text-center fs-3" role="alert">${FailedMsg}</div>
									<c:remove var="FailedMsg" scope="session" />
								</c:if>
								<c:if test="${not empty FailedMsgMsg}">
									<div class="alert alert-danger text-center fs-3" role="alert">${FailedMsgMsg}</div>
									<c:remove var="FailedMsgMsg" scope="session" />
								</c:if>
								
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label fs-5">Name
										</label> <input type="text" class="form-control" name="userName" value="${userObj.username }"
										id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label fs-5">Email
									</label> <input type="email" class="form-control" name="email" value="${userObj.email} " readonly
										id="exampleInputPassword1">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail" class="form-label fs-5">Mobile No.</label>
									<input type="number" class="form-control" name="mobileNo" value="${userObj.mobileNo }"
										id="exampleInputPassword1">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label fs-5">Password
										</label> <input type="text" class="form-control" name="password"
										id="exampleInputEmail1" aria-describedby="emailHelp" required>
										<p>Enter the password for update your details..</p>
								</div>
								<div class="mb-3 mt-4 text-end">
									<button type="submit" class="btn btn6 col-md-5 btnn">Update Details
										</button>

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