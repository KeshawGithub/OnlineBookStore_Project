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
<%@include file="all_component/All_css.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payments</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    background-image: linear-gradient(to right top, #f39b9b, #f19295, #ef8990, #ed808b, #eb7687);
    height: 100vh;
    
    margin: 0;
    padding: 0;
}

@keyframes fadeInBody {
    from { opacity: 0; }
    to { opacity: 1; }
}

.card-body {
animation: fadeInBody 1s ease-in-out;
    background-image: url('imageEbook/Online-payment-methods.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    margin-top: 60px;
    height: 65vh;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
    animation: slideIn 1.5s ease-out;
    color: black;
    backdrop-filter: blur(4px);
    background-color: rgba(0, 0, 0, 0.3);
}

@keyframes slideIn {
    from {
        transform: translateY(40px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

.h3 {
    margin-bottom: 30px;
    background-color: rgba(239, 154, 154, 0.8);
    padding: 10px;
    border-radius: 8px;
    animation: fadeInText 2s ease-in-out;
    font-weight: 600;
    color:black;
}
p{
 	font-weight: 600;
 	animation: fadeInText 2s ease-in-out;
}
span{
	font-weight: 600;
	color:#ef5350;
}
#span{
	color:blue;
}

@keyframes fadeInText {
    0% {
        transform: translateX(-20px);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}
@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}
.select {
    width: 50%;
    padding: 8px;
    margin-top: 15px;
    border-radius: 6px;
    border: none;
    outline: none;
    transition: all 0.3s ease;
}

.select:hover {
    transform: scale(1.02);
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.yellow-btn {
    background-color: #ffdd57;
    color: #000;
    font-weight: 600;
    padding: 10px 20px;
    border-radius: 25px;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
}

.yellow-btn:hover {
    background-color: #ffd233;
    transform: scale(1.05);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
}
</style>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userObj}">
		<c:redirect url="register.jsp" />
	</c:if>
	<div class="container">
		<div class="row">

			<div class="col-md-5">
				<!-- Order Success Message -->
				<div id="successMsg"
					style="display: none; text-align: center; margin-top: 20px;">
					<!-- Display success or error messages with the help of jstl -->
						
						<c:if test="${not empty orderFailed }">
							<p class="text-center text-danger ">${orderFailed}</p>
							<c:remove var="orderFailed" scope="session" />
						</c:if>
				</div>
				<!-- QR Code Display -->
				<div id="qrSection"
					style="display: none; text-align: center; margin-top: 20px; animation: slideIn 1.5s ease-out; ">
					<img src="imageEbook/QR_Code.png" alt="Scan to Pay"
						style="width: 250px; height: 350px; margin-top: 60px;box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;">
					<p style="color: white; font-weight: bold; margin-top: 40px;">Scan this QR Code
						to make payment</p>
				</div>

			</div>
			<%
				User u = (User) session.getAttribute("userObj");
			CartCurdImp dao = new CartCurdImp(DBconnect.getConn());
			List<BookCart> bookList = dao.getBookByUser(u.getEmail());
			Double totalPrice = 0.0;
			StringBuilder bookIds = new StringBuilder();
			int count = 0;
			for (BookCart c : bookList) {
				if (bookIds.length() > 0) {
		            bookIds.append(",");
		        }
				bookIds.append(c.getBookId());
				totalPrice = c.getTotalPrice();
				count++;
			}
			%>
			<!-- Payment details -->
			<div class="col-md-7">
				<div class="card-body">
					<h3 class="text-center h3">Payment details</h3>
					<p><%=u.getUsername() %>,<span id="span"> <%=u.getEmail() %>,
							<%=u.getMobileNo() %></span>
					</p>
					<p><%=u.getAddress() %>, <%=u.getLandmark() %>, <%=u.getCity() %>, <%=u.getState() %>-<%=u.getPincode() %></p>
					<div>
						<p>
							Count of books : <span><%=count%></span>
						</p>
						<p><%
							int dc=0;
							if(count<=2){
								dc=50;
							}
							%>
							Delivery Charge : <span><%=dc%></span>
						</p>
							<%
								totalPrice=totalPrice+dc;
							%>
						<p>
							Total Price : <span><%=totalPrice%></span>
						</p>
						
					</div>
					<form action="orderServlet" method="post">
						<input type="hidden" name="email" value="<%=u.getEmail()%>"> 
						<input type="hidden" name="bookid" value="<%=bookIds.toString()%>"> 
						<input type="hidden" name="countOfBook" value="<%=count%>"> 
						<input type="hidden" name="totalAmount" value="<%=totalPrice%>">
						<select name="modeOfPayment" class="select" id="paymentMode" onchange="handlePaymentMode()">
							<option value="">Mode of payment</option>
							<option value="UPI">Pay by UPI/QR_Code</option>
							<option value="CashOnDelivery">Cash on Delivery</option>
						</select>
						<div class="text-end">
							<button type="submit"
								class="btn mt-2 yellow-btn">
								Order&nbsp;<i class="fa-solid fa-thumbs-up"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
function handlePaymentMode() {
    const mode = document.getElementById("paymentMode").value;
    const qrSection = document.getElementById("qrSection");

    if (mode === "UPI") {
        qrSection.style.display = "block";
    } else {
        qrSection.style.display = "none";
    }
}

</script>
</body>
</html>


