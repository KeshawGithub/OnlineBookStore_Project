<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="Ebook.Entity.User"%>
<style>

/* ------------TopNavBar CSS--------------- */

/* ------------NavBar CSS--------------- */
.bg-custom {
	background: #e57373;
}

.navbar-brand {
	margin-left: 20px;
	margin-right: 40px;
}

.navbar .nav-item {
	margin-right: 1px;
}

.navbar .nav-item .nav-link {
	display: inline-block;
	position: relative;
	padding-left: 10px;
	padding-right: 10px;
}

.navbar .nav-item .nav-link::after {
	content: '';
	width: 0;
	height: 3px;
	background: #ef5350;
	position: absolute;
	left: 0;
	bottom: 8px;
	border-radius: 15px;
	transition: 0.5s;
}

.navbar .nav-item .nav-link:hover::after {
	width: 100%;
}

.navbar .nav-item:hover .nav-link {
	background-color: white;
	color: #ef5350;
	border-radius: 10px;
}

.navbtn {
	margin-left: 5px
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
</style>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><b><i
				class="fa-solid fa-book"></i>Bookly</b></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="AdminHome.jsp"><i
						class="fa-solid fa-house"></i>Home</a></li>
			</ul>
			<%
			User u = (User) session.getAttribute("AdminObj");
			if (u != null) {
			%>


			<a href="#" class="btn btn-light navbtn"><i
				class="fa-solid fa-user"></i>&nbsp;<%=u.getUsername()%> </a>

			<button class="btn btn-light navbtn" type="button"
				data-bs-toggle="modal" data-bs-target="#logoutModal">
				<i class="fa-solid fa-right-from-bracket"></i>&nbsp;LogOut
			</button>

			<%
			}
			%>


		</div>
	</div>
</nav>
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
