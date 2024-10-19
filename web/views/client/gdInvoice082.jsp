<%-- 
    Document   : gdInvoice082
    Created on : Oct 6, 2024, 9:41:52 AM
    Author     : maichu
--%>

<%@page import="java.util.Map"%>
<%@page import="model.ordering.OrderedItem082"%>
<%@page import="model.ordering.OrderedItem082"%>
<%@page import="model.item.ImageItem082"%>
<%@page import="model.ordering.ShoppingCart082"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.user.Client082"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hóa đơn</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <%
        Client082 user = (Client082) session.getAttribute("user");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String date = simpleDateFormat.format(new Date());
    %>

    <nav>
        <a id="name"><%=user.getFullName()%></a>
        <a href="${pageContext.request.contextPath}/views/client/gdOrdering082.jsp">Đặt hàng</a>
        <a href="">Tra cứu</a>
        <a href="">Theo dõi hoá đơn</a>
        <a href="">Đăng ký thành viên</a>
        <a href="${pageContext.request.contextPath}/views/client/gdShoppingCart082.jsp" class="select">Giỏ hàng</a>
    </nav>

    <div class="container my-3" style="max-width: 100%; max-height: 5%; padding-inline: 10%; padding-top: 2rem;">
        <div class="justify-content-center d-flex">
            <h3>Hóa đơn</h3>
        </div>
        <table class="table text-start">
          <tbody>
            <tr>
              <th scope="row">Tên khách hàng</th>
              <td><%=user.getFullName()%></td>
              <td></td>
            </tr>
            <tr>
              <th scope="row">Thời gian đặt hàng </th>
              <td><%=date%></td>
              
            </tr>
            <tr>
              <th scope="row">Địa chỉ </th>
              <td><%=user.getAddress()%></td>
            </tr>
            
          </tbody>
        </table>
        <table class="table text-start">
          <h4>Danh sách mặt hàng</h4>
          <thead>
            <tr>
              <th scope="col">STT</th>
              <th scope="col">Tên mặt hàng</th>
              <th scope="col" class="text-center">Số lượng</th>
              <th scope="col" class="text-center">Đơn giá</th>
              <th scope="col" class="text-center">Thành tiền</th>
            </tr>
          </thead>
          <tbody>
              <%
                    ShoppingCart082 shoppingCart = ShoppingCart082.getShoppingCart();
                    Map<OrderedItem082, ImageItem082> items = shoppingCart.getItems();
                    double total = 0.0;
                    int stt = 1;

                    for (Map.Entry<OrderedItem082, ImageItem082> item : items.entrySet()) {
                            OrderedItem082 orderedItem = item.getKey();
                            
                %>
            <tr>
                <th scope="row"><%=stt%></th>
                <td><%=orderedItem.getNameItem()%></td>
              <td class="text-center"><%=orderedItem.getOrderedQuantity()%></td>
              <td class="text-center"><%=orderedItem.getExportedPrice()%> VND</td>
              <td class="text-center"><%=orderedItem.getTotalPrice()%> VND</td>
            </tr>
            <%
                total += orderedItem.getTotalPrice();
                stt++;
                }
            %>
            <tr>
              <th scope="row">Tổng tiền</th>
              <td colspan="4"><%=total%> VND</td>
            </tr>
          </tbody>
        </table>
            
        <form action="${pageContext.request.contextPath}/saveInvoiceServlet" method="POST">
        <div class="d-flex justify-content-center py-3">
            <button type="submit" class="btn btn-dark btn-lg mx-1" >Lưu</button>
            <button type="button" class="btn btn-outline-secondary btn-lg mx-1" onclick="openPage('<%=request.getContextPath()%>/views/client/gdShoppingCart082.jsp')">Hủy</button>
        </div>
        </form>
    </div>

</body>
</html>
<script>
    function openPage(url) {
            window.location.href = url; // Chuyển hướng đến URL
        }
</script>
    