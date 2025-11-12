<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<%@ page import="Ebook.Entity.User" %>
<%@ page import="Ebook.Curd.UserCurdImpl" %>
<%@ page import="Ebook.DB.DBconnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../all_component/All_css.jsp" %>
<title>All Users</title>
</head>
<body>

<%@ include file="AdminNavbar.jsp" %>

<!-- Redirect if admin not logged in -->
<c:if test="${empty AdminObj}">
    <c:redirect url="../register.jsp"/>
</c:if>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">All Registered User Details</p>

                    <!-- Backend: Fetch all users -->
                    <%
                        UserCurdImpl dao = new UserCurdImpl(DBconnect.getConn());
                        List<User> list = dao.getAllUsers();
                    %>

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Username</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mobile No</th>
                                <th scope="col">Address</th>
                                <th scope="col">Landmark</th>
                                <th scope="col">City</th>
                                <th scope="col">State</th>
                                <th scope="col">Pincode</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                if (list != null && !list.isEmpty()) {
                                    for (User us : list) {
                            %>
                                <tr>
                                    <td><%= us.getUsername() %></td>
                                    <td><%= us.getEmail() %></td>
                                    <td><%= us.getMobileNo() %></td>
                                    <td><%= us.getAddress() %></td>
                                    <td><%= us.getLandmark() %></td>
                                    <td><%= us.getCity() %></td>
                                    <td><%= us.getState() %></td>
                                    <td><%= us.getPincode() %></td>
                                    <td>
                                        <form action="deleteUser" method="post" style="display:inline;">
                                            <input type="hidden" name="email" value="<%= us.getEmail() %>">
                                            <a href="editUser?email=<%= us.getEmail() %>" class="btn btn-sm btn-primary">
                                                <i class="fa-solid fa-user-pen"></i>&nbsp;Edit
                                            </a>
                                            <button type="submit" class="btn btn-sm btn-danger">
                                                <i class="fa-solid fa-trash"></i>&nbsp;Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                                    }
                                } else {
                            %>
                                <tr>
                                    <td colspan="9" class="text-center text-muted">No users found</td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
