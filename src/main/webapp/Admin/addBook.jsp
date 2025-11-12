<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Books</title>
<%@include file="../all_component/All_css.jsp"%>
<Style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-image: linear-gradient(to right, #712f70, #8f4e8f, #ae6eaf, #ce8ed1, #efb0f3);
}

.body {
	display: flex;
	justify-content: center;
}

.mainContainer {
	background-image: linear-gradient(to right, #ef5350, #f16663, #f27876, #f18988, #ef9a9a);
	margin-top: 45px;
	height: 74vh;
	width: 70%;
	border-radius: 7px;
	box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset,
		rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px
		-79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px,
		rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px,
		rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
}

 .containers {
	margin: 25px 16px 23px 0px;
	height: 90%;
	width: auto;
	padding-top: 20px;
} 

.formBody {
	margin-top: 10px;
	padding-left: 43px;
}

.bb {
	height: 55vh;
	padding: 25px 10px;
}

.row {
	--bs-gutter-x: 0;
}

.btnn {
	margin-top: 15px;
}

.bbb {
	height: 67vh;
}

.bbb p {
	margin-bottom: 0;
}

.backgroundContainer {
	position: relative;
	top: 0;
	left: 0;
	width: 100%; /* Ensure it covers the full div */
	height: 100%;
	background-image: url('AdminImg/addbokBG.png');
	background-size: contain; /* Ensures the image fits well */
	background-position: center;
	background-repeat: no-repeat;
	z-index: 1; /* Moves it behind other content */
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	flex-direction: column;
}

@media screen and (max-width: 1024px) {
	.containers {
		padding-top: 60px;
	}
	.formBody {
		margin-top: -14px;
	}
	.backgroundContainer h1 {
		font-size: 25px;
	}
	.btnn {
		margin-top: 130px;
	}
	.btnns {
		margin-top: 130px;
	}
}

@media screen and (max-width: 768px) {
	.containers {
		margin: 57px 0px 0px 0px;
		padding-top: 61px;
		background: transparent;
	}
	.mainContainer {
		width: 92% !important;
	}
	.bbb {
		width: 100%;
	}
	.bb {
		height: 47vh;
		padding: 25px 10px;
	}
	.backgroundContainer h1 {
		font-size: 45px;
	}
	.btnn {
		margin-top: 55px;
		margin-bottom: 100px;
	}
	.btnns {
		margin-top: 147px;
		margin-bottom: 100px;
		display: block;
	}
	.fs {
		font-size: 25px;
	}
	.bbb h3 {
		margin-top: 100px;
		margin-bottom: 20px;
		font-size: 40px;
	}
}

@media screen and (max-width: 426px) {
	.btnn {
		margin-top: 20px;
		margin-bottom: 30px;
		width:100%;
	}
	.btnns {
		margin-top: 10px;
		margin-bottom: 89px;
		display: block;
	}
	.formBody {
		margin-top: 0;
		padding-left: 0;
	}
	.bbb h3 {
		margin-top: 10px;
		margin-bottom: 0px;
		font-size: 35px;
	}
}
</Style>
</head>
<body>
	<%@include file="AdminNavbar.jsp"%>
	<c:if test ="${empty AdminObj}">
	<c:redirect url="../register.jsp"/>
	</c:if>
	<div class="body">

		<div class="mainContainer">

			<div class="row ">

				<div class="col-md-4 bbb">
					<div class="backgroundContainer">
						<h1>Book For Sale</h1>
						<!-- Display success or error messages with the help of jstl -->
						<div class="massege">
							<c:if test="${not empty bookSuccMsg }">
								<p class="text-center text-light fs-4 ">${bookSuccMsg}</p>
								<c:remove var="bookSuccMsg" scope="session" />
							</c:if>
							<c:if test="${not empty bookFailedMsg }">
								<p class="text-center text-warning fs-4 ">${bookFailedMsg}</p>
								<c:remove var="bookFailedMsg" scope="session" />
							</c:if>
						</div>
					</div>

				</div>


				<div class="col-md-8 bbb">
					<div class="containers">
						<h3 class="text-center">New Book Entry</h3>
						<div class="formBody ">
							<form action="../addBook" method="post"
								enctype="multipart/form-data">
								<div class="row ">
									<div class="col-md-6 bb">
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label fs-5">Book
												Name</label> <input type="text" class="form-control" name="bookName"
												id="exampleInputEmail1" aria-describedby="emailHelp">
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label fs-5">Author
												Name</label> <input type="text" class="form-control"
												name="authorName" id="exampleInputPassword1">
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail" class="form-label fs-5">Price</label>
											<input type="text" class="form-control" name="price"
												id="exampleInputPassword1">
										</div>
									</div>
									<div class="col-md-6 bb">
										<div class="mb-3">
											<label for="inputState" class="form-label fs-5">Book
												Status</label> <select id="inputState" name="bookStatus"
												class="form-control">
												<option selected>---Select---</option>
												<option value="Active">Active</option>
												<option value="Inactive">Inactive</option>

											</select>
										</div>
										<div class="mb-3">
											<label for="inputState" class="form-label fs-5">Book
												Categories</label> <select id="inputState" name="bookCategories"
												class="form-control">
												<option selected>---Select---</option>
												<option value="New">New Book</option>

											</select>
										</div>
										<div class="mb-3">
											<label for="exampleInputControlFile1" class="form-label fs-5">Upload
												Image</label> <input type="file" class="form-control"
												name="BookImage" id="exampleInputControlFile1">
											<button type="submit" class="btn btn-primary col-md-12 btnn">Add
												Book</button>
										</div>

									</div>
								</div>
							</form>

						</div>

					</div>

				</div>

			</div>


		</div>
	</div>

</body>
</html>

<!-- 
			
				 -->