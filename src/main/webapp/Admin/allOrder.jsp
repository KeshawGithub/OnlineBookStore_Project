<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.*"%>
<%@page import="Ebook.Entity.Order"%>
<%@page import="Ebook.Entity.BookDetails"%>
<%@page import="Ebook.Curd.OrderCurdImp"%>
<%@page import="Ebook.Curd.BookCurdImp"%>
<%@page import="Ebook.DB.DBconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../all_component/All_css.jsp"%>
<title>All Order Book</title>
</head>
<body>
    <%@include file="AdminNavbar.jsp"%>
    <c:if test="${empty AdminObj}">
        <c:redirect url="../register.jsp" />
    </c:if>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">All Order Details</p>

                        <%
                            OrderCurdImp dao = new OrderCurdImp(DBconnect.getConn());
                            List<Order> list = dao.getAllOrders();
                            BookCurdImp bc = new BookCurdImp(DBconnect.getConn());
                        %>

                        <table class="table table-bordered table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Order Id</th>
                                    <th scope="col">User Email</th>
                                    <th scope="col">Book Name(s)</th>
                                    <th scope="col">Author(s)</th>
                                    <th scope="col">Total Price (₹)</th>
                                    <th scope="col">Payment Type</th>
                                    <th scope="col">Order Date</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                for (Order o : list) {
                                    String bookIds = o.getBookId(); // e.g. "2,5,7"
                                    String[] ids = bookIds.split(",");
                                    
                                    StringBuilder names = new StringBuilder();
                                    StringBuilder authors = new StringBuilder();

                                    for (String id : ids) {
                                        try {
                                            int bookId = Integer.parseInt(id.trim());
                                            BookDetails bd = bc.getBookById(bookId);
                                            if (bd != null) {
                                                if (names.length() > 0) names.append(", ");
                                                if (authors.length() > 0) authors.append(", ");
                                                names.append(bd.getBookname());
                                                authors.append(bd.getAuthor());
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }
                                    }
                                %>
                                <tr>
                                    <td><%=o.getOrderId()%></td>
                                    <td><%=o.getUseremail()%></td>
                                    <td><%=names.toString()%></td>
                                    <td><%=authors.toString()%></td>
                                    <td><%=o.getTotalPrice()%></td>
                                    <td><%=o.getModeOfPayment()%></td>
                                    <td><%=o.getOrderDate()%></td>
                                </tr>
                                <%
                                }
                                if (list.isEmpty()) {
                                %>
                                <tr>
                                    <td colspan="8" class="text-center text-danger">No Orders Found!</td>
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
