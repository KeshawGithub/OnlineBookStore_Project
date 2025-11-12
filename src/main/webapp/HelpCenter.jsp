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
<title>Help Center</title>
<style>
body {
    
    
    margin: 0;
   
}
.bodyDiv{
background-image: url('imageEbook/bguser.jpg');
    background-repeat: no-repeat;
    background-size: cover;
     height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.div {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 20px;
    text-align: center;
}

.btn-custom1 {
	font-size: 18px;
	font-weight: bold;
	width: 150px;
	height: 40px;
	background: white;
	border: 2px solid #e57373;
	color: #e57373;
	border-radius: 10px;
	box-shadow: -2px 2px 5px rga(0, 0, 0, .5);
	cursor: pointer;
	position: relative;
	z-index: 1;
	overflow: hidden;
	transition: 1s all ease;
}

.btn-custom1::before {
	content: '';
	width: 50%;
	height: 100%;
	background: #ef5350;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	transform: translateX(-100%);
	transition: 1s all ease;
}

.btn-custom1:hover::before {
	transform: translateX(0%) rotate(180deg);
}

.btn-custom1::after {
	content: '';
	width: 50%;
	height: 100%;
	background: #ef5350;
	position: absolute;
	top: 0;
	left: 50%;
	z-index: -1;
	transform: translateX(100%);
	transition: 1s all ease;
}

.btn-custom1:hover::after {
	transform: translateX(-2%) rotate(180deg);
}

.btn-custom1:hover {
	color: white;
	border-color: white;
}
.icon{
	font-size:60px;
	margin-bottom:20px;
	color:#f06292;
}
h1{
color:white;
font-family: ' Serif(red serifs)';
font-size: 65px;
margin-bottom:20px

}
h2{
	color:light-gray;
	background:white;
}
h3{
	color:gray;
	background:white;
}
.glowing-div {
	width:450px;
	height:350px;
    border: 2px solid;
    padding: 30px;
    border-radius: 20px;
    position: relative;
    background:white;
    background-image: url('imageEbook/pngtree-contact.png');
    background-repeat:no-repeat;
    background-position:center;
    animation: glow 5s infinite;
    overflow: hidden;
    box-shadow: 0 0 15px rgba(255, 0, 0, 0.7), 
                0 0 30px rgba(0, 255, 0, 0.7), 
                0 0 45px rgba(0, 0, 255, 0.7);
}

/* Glowing RGB Border Animation */
@keyframes glow {
    0% { 
        border-color: red;
        box-shadow: 0 0 10px red, 0 0 20px red, 0 0 25px red;
    }
    25% { 
        border-color: yellow;
        box-shadow: 0 0 10px yellow, 0 0 20px yellow, 0 0 25px yellow;
    }
    50% { 
        border-color: lime;
        box-shadow: 0 0 10px lime, 0 0 20px lime, 0 0 25px lime;
    }
    75% { 
        border-color: cyan;
        box-shadow: 0 0 10px cyan, 0 0 20px cyan, 0 0 25px cyan;
    }
    100% { 
        border-color: red;
        box-shadow: 0 0 10px red, 0 0 20px red, 0 0 25px red;
    }
}

/* Moving Light Effect */
.glowing-div::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(45deg, rgba(255, 0, 0, 0.3), rgba(0, 255, 0, 0.3), rgba(0, 0, 255, 0.3));
    animation: lightMove 5s linear infinite;
    z-index: -1;
}

@keyframes lightMove {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="bodyDiv">
<div class="div">
 <h1>24/7 Service</h1>
    <div class="glowing-div p-4">
        <i class="fa-solid fa-phone-volume icon"></i>
        
        <h3 class="mt-5">Helpline Number</h3>
        <h2>+91 7808506542</h2>
        <a href="index.jsp" class="btn btn-custom1 mt-5">Home</a>
    </div>
</div>
</div>
</body>

</html>