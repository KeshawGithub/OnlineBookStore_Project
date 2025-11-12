<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserHome</title>
</head>
<body>
<h1>User:Home</h1>
<c:if test="${not empty userObj}">
    <h1>Name: <c:out value="${userObj.username}"/></h1>
    <h1>Email: <c:out value="${userObj.email}"/></h1>
</c:if>

</body>
</html>