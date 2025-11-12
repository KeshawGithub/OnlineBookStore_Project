<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Bookly</title>
<%@include file="all_component/All_css.jsp"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}



.containerBody {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100hv;
	background-image: linear-gradient(to right top, #e5adb7, #e4b0c1, #e2b3cc, #deb7d5,
		#d9bbde);
}

.containers {
	position: relative;
	width: 850px;
	height: 569px;
	background: #fff;
	border-radius: 30px;
	box-shadow: 0 0 30px rgb(0, 0, 0, .2);
	margin: 50px 20px 20px 20px;
	overflow: hidden;
}

.form-box {
	position: absolute;
	right: 0;
	width: 50%;
	height: 100%;
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #333;
	text-align: center;
	z-index: 1;
	transition: .5s ease-in-out 1.2s visibility 0s 1s;
}

.containers.active .form-box {
	right: 50%;
}

.form-box.register {
	visibility: hidden;
}

.containers.active .form-box.register {
	visibility: visible;
}

.form {
	width: 100%;
	padding: 40px;
}

.containers h1 {
	font-size: 36px;
	margin: -10px 0;
}

.input-box {
	display: flex;
	position: relative;
	margin: 30px 0;
}

.input-box input {
	width: 100%;
	padding: 10px 50px 10px 20px;
	background: #eee;
	border: none;
	outline: none;
	border-radius: 8px;
	font-weight: 500;
}

.input-box input::placeholder {
	color: #888;
	font-weight: 400;
}

.input-box i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 20px;
	color: #888;
}

.check-box {
	margin-top: -20px;
	display: flex;
	align-items: left;
	padding-bottom: 20px;
	padding-left: 5px;
}

.forget-link {
	margin: -15px 0 15px;
}

.forget-link a {
	font-size: 14.5px;
	color: #333;
	text-decoration: none;
}

.btnn-custom {
	width: 80%;
	height: 35px;
	background: #e57373;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, .1);
	border: none;
	cursor: pointer;
	font-size: 16px;
	color: #fff;
	font-weight: 600;
}

.btnn-custom:hover {
	background: #ef5350;
}

.containers p {
	font-size: 14.5px;
	margin: 15px 0;
}

.social-icon {
	display: flex;
	justify-content: center;
}

.social-icon a {
	display: inline-flex;
	padding: 7px;
	border: 2px solid #ccc;
	border-radius: 8px;
	font-size: 20px;
	color: #333;
	text-decoration: none;
	margin: 0 6px;
}

.toggle-box {
	position: absolute;
	width: 100%;
	height: 100%;
}

.toggle-box::before {
	content: '';
	position: absolute;
	left: -250%;
	width: 300%;
	height: 100%;
	background: #e57373;
	border-radius: 150px;
	z-index: 2;
	transition: 1s ease-in-out;
}

.containers.active .toggle-box::before {
	left: 50%;
}

.toggle-panel {
	position: absolute;
	width: 50%;
	height: 100%;
	/* background: seagreen; */
	color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 2;
	transition: .3s ease-in-out;
}

.toggle-panel.toggle-left {
	left: 0;
	transition-delay: .4s
}

.containers.active .toggle-panel.toggle-left {
	left: -50%;
	transition: .3s;
}

.toggle-panel.toggle-right {
	right: -50%;
	transition-delay: .3s;
}

.containers.active .toggle-panel.toggle-right {
	right: 0;
	transition-delay: .4s;
}

.toggle-panel-box {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
}

.toggle-panel-box p {
	margin-bottom: 20px;
}

.toggle-panel .btnn-customs {
	width: 160px;
	height: 40px;
	background: transparent;
	border-radius: 8px;
	color: #fff;
	border: 2px solid #fff;
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="body">
		<%@include file="all_component/navbar.jsp"%>

		<div class="containerBody">

			<div class="containers">
				<div class="form-box login">
					<form action="login" method="post">
						<!-- Display success or error messages with the help of jstl -->
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty duplicate }">
							<p class="text-center text-danger ">${duplicate}</p>
							<c:remove var="duplicate" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger ">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<c:if test="${not empty check }">
							<p class="text-center text-danger ">${check}</p>
							<c:remove var="check" scope="session" />
						</c:if>
						<h1>Login</h1>
						<!-- Display success or error messages with the help of jstl -->
						<c:if test="${not empty failedMssg }">
							<p class="text-center text-danger ">${failedMssg}</p>
							<c:remove var="failedMssg" scope="session" />
						</c:if>
						
						
						<div class="input-box">
							<input type="email" placeholder="Emaill" name="email" required> <i
								class="fa-solid fa-user"></i>
						</div>
						<div class="input-box">
							<input type="password" placeholder="Password" name="password" required> <i
								class="fa-solid fa-lock"></i>
						</div>
						<div class="forget-link">
							<a href="#">Forgot password</a>
						</div>
						<button type="submit" class="btnn-custom">Login</button>
						<p>or login with social platforms</p>
						<div class="social-icon">
							<a href=""><i class="fa-brands fa-google"></i></a> <a href=""><i
								class="fa-brands fa-linkedin"></i></a> <a href=""><i
								class="fa-brands fa-github"></i></a> <a href=""><i
								class="fa-brands fa-facebook"></i></a>
						</div>
					</form>
				</div>

				<div class="form-box register">
					<form class="form" action="register" method="post">
						<h1>Registration</h1>
						<div class="input-box">
							<input type="text" placeholder="Name" name="username"
								required> <i class="fa-solid fa-user"></i>
						</div>
						<div class="input-box">
							<input type="email" placeholder="Email" name="email" required>
							<i class="fa-solid fa-envelope"></i>
						</div>
						<div class="input-box">
							<input type="text" placeholder="Mobile No." name="mobileNo"
								required> <i class="fa-solid fa-phone"></i>
						</div>
						<div class="input-box">
							<input type="password" placeholder="Password" name="password"
								required> <i class="fa-solid fa-lock"></i>
						</div>
						<div class="check-box">
							<input type="checkbox" name="check"> <label>&nbsp;Agree
								terms &amp; Condition</label>
						</div>
						<button type="submit" class="btnn-custom">Register</button>
						<p>or register with social platforms</p>
						<div class="social-icon">
							<a href=""><i class="fa-brands fa-google"></i></a> <a href=""><i
								class="fa-brands fa-linkedin"></i></a> <a href=""><i
								class="fa-brands fa-github"></i></a> <a href=""><i
								class="fa-brands fa-facebook"></i></a>
						</div>
					</form>
				</div>

				<div class="toggle-box">
					<div class="toggle-panel toggle-left">
						<div class="toggle-panel-box">
							<h1>Hello, Welcome!</h1>
							<p>Don't have an account?</p>
							<button class="btnn-customs register-btn">Register</button>
						</div>
					</div>
					<div class="toggle-panel toggle-right">
						<div class="toggle-panel-box">
							<h1>Welcome Back!</h1>
							<p>Already have an account?</p>
							<button class="btnn-customs login-btn">Login</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
        const container=document.querySelector('.containers');
        const registerBtn = document.querySelector('.register-btn');
        const loginBtn = document.querySelector('.login-btn');

        registerBtn.addEventListener('click',()=>{
                container.classList.add('active');
        });
        loginBtn.addEventListener('click',()=>{
                container.classList.remove('active');
        });
    </script>
</body>
</html>