<%-- 
    Document   : gdMainCustomer082
    Created on : Oct 6, 2024, 9:40:51 AM
    Author     : maichu
--%>

<%@page import="model.ordering.ShoppingCart082"%>
<%@page import="model.user.Customer082"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý mặt hàng</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    
    <%
        Customer082 user = (Customer082) session.getAttribute("user");
        ShoppingCart082 shoppingCart082 = new ShoppingCart082();
        session.setAttribute("shoppingCart", shoppingCart082);
    %>

    <nav>
        <a id="name"><%=user.getFullName()%></a>
        <a href="${pageContext.request.contextPath}/views/client/gdOrdering082.jsp">Đặt hàng</a>
        <a href="">Tra cứu</a>
        <a href="">Theo dõi hoá đơn</a>
        <a href="">Đăng ký thành viên</a>
        <a href="${pageContext.request.contextPath}/views/client/gdShoppingCart082.jsp">Giỏ hàng</a>
    </nav>

</body>