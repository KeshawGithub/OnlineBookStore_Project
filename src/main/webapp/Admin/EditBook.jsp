<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="Ebook.DB.DBconnect"%>
<%@page import="Ebook.Curd.BookCurdImp"%>
<%@page import="Ebook.Entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Edit Book</title>
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
	background-image: linear-gradient(to right, #712f70, #8f4e8f, #ae6eaf, #ce8ed1, #efb0f3);
	margin-top: 82px;
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
	margin: 45px 16px 23px 0px;
	background: #f3e5f5;
	border-radius: 132px 0 0 132px;
	height: 90%;
	width: auto;
	padding-top: 20px;
}

.formBody {
	margin-top: 10px;
	padding-left: 43px;
}

.txc {
	padding: 5px;
}

.bb {
	height: 55vh;
	padding: 25px 10px;
}

.row {
	--bs-gutter-x: 0;
}

.btnn {
	margin-top: 132px;
}
	.btnns {
		margin-top: 132px;
	}

.bbb {
	height: 67vh;
}
.fs{
font-size:20px;
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
		background:transparent;
		
	}
	.mainContainer {
		width: 92% !important;
	}
	.bbb{
	width:100%;
	}
	.bb {
	
		height: 47vh;
		padding: 25px 10px;
	}
	.backgroundContainer h1 {
		font-size: 45px;
	}
	.btnn {
		margin-top: 147px;
		margin-bottom: 100px;
	}
	.btnns {
		margin-top: 147px;
		margin-bottom: 100px;
		display: block;
	}
	.fs{
	font-size:25px;
	}
	.bbb h3{
	margin-top:100px;
	margin-bottom:20px;
	font-size:40px;
	}

	
}

@media screen and (max-width: 426px) {
    .btnn {
        margin-top: 10px ;
        margin-bottom: 10px ;
    }
    .btnns {
        margin-top: 10px ;
        margin-bottom: 89px ;
        display: block ;
    }
}


</Style>
</head>
<body>
	<c:if test ="${empty AdminObj}">
	<c:redirect url="../register.jsp"/>
	</c:if>
	<div class="body">
	
		<div class="mainContainer">

			<div class="row ">

				<div class="col-md-4 bbb">
					<div class="backgroundContainer">
						<h1 class="text-center">Edit Book Details</h1>
						
						<%
						int id = Integer.parseInt(request.getParameter("bookId"));
						BookCurdImp dao = new BookCurdImp(DBconnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>
					
				</div>
				</div>

				<div class="col-md-8 bbb">
					<div class="containers">
						<h3 class="text-center ">Edit Book Details</h3>
						<div class="formBody ">
							<form action="../editBook" method="post">
							<input type="hidden"name="bookid" value="<%=b.getBookId() %>">
								<div class="row ">
									<div class="col-md-6 bb">
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label fs">Book
												Name</label> <input type="text" class="form-control" name="bookName"
												value="<%=b.getBookname()%>" id="exampleInputEmail1"
												aria-describedby="emailHelp">
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label fs">Author
												Name</label> <input type="text" class="form-control"
												value="<%=b.getAuthor()%>" name="authorName"
												id="exampleInputPassword1">
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail" class="form-label fs">Price</label>
											<input type="text" class="form-control" name="price"
												value="<%=b.getPrice()%>" id="exampleInputPassword1">
										</div>
									</div>
									<div class="col-md-6 bb">
										<div class="mb-3">
											<label for="inputState" class="form-label fs">Book
												Status</label> <select id="inputState" name="bookStatus"
												class="form-control">
												<%
												if ("Active".equals(b.getBookStatus())) {
												%>
												<option value="Active">Active</option>
												<option value="Inactive">Inactive</option>
												<%
												} else {
												%>
												<option value="Inactive">Inactive</option>
												<option value="Active">Active</option>
												<%
												}
												%>
												
												
											</select>
										</div>
										<div class="mb-3 text-center">

											<div class="row ">
												<div class="col-md-6 ">
													<button type="submit"
														class="btn btn-primary col-md-11 btnn">Update</button>
												</div>
												<div class="col-md-6 pl-1">
													<a href="allBooks.jsp"
														class="btn btn-danger col-md-11 btnns">Exit</a>
												</div>
											</div>
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
