<%@page import="Ebook.Entity.User"%>
<style>

/* ------------TopNavBar CSS--------------- */

/* ------------NavBar CSS--------------- */
.bg-custom {
	background:  #e57373;
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

@media only screen and ( max-width : 575px) {
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
					aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a></li>
				<li class="nav-item"><a class="nav-link active" href="allRecentBook.jsp"><i
						class="fa-solid fa-book-open"></i>Recent Book</a></li>
				<li class="nav-item"><a class="nav-link active" href="allNewBook.jsp"><i
						class="fa-solid fa-book-open"></i>New Book</a></li>
				<li class="nav-item"><a class="nav-link active" href="allOldBook.jsp"><i
						class="fa-solid fa-book-open"></i>Old Book</a></li>

			</ul>
			<%
			User user = (User) session.getAttribute("userObj");
			if (user != null) {
			%>
			<form class="d-flex" action="UserLogout" method="post">
				<a href="userSetting.jsp" class="btn btn-light navbtn">
					<i class="fa-solid fa-address-card"></i>&nbsp;${userObj.username}</a>
				<a href="allCart.jsp" class="btn btn-light navbtn">
				<i class="fa-solid fa-cart-shopping"></i>&nbsp;Cart</a>	
				<button class="btn btn-light navbtn" type="submit">
					<i class="fa-solid fa-right-from-bracket"></i>&nbsp;LogOut
				</button>
			</form>
			<%
			}else{
			%>
			<form class="d-flex">
				
					
				<a href="register.jsp" class="btn btn-light navbtn"><i
					class="fa-solid fa-right-to-bracket"></i>&nbsp;Login</a>

				<button class="btn btn-light navbtn" type="submit">
					<i class="fa-solid fa-square-phone"></i>&nbsp;Contact Us
				</button>

			</form>
			<%	
			}
			%>
		</div>
	</div>
</nav>