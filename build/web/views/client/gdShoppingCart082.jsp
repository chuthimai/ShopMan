<%-- 
    Document   : gdShoppingCart082
    Created on : Oct 6, 2024, 9:41:36 AM
    Author     : maichu
--%>

<%@page import="java.util.Map"%>
<%@page import="model.ordering.OrderedItem082"%>
<%@page import="model.item.ImageItem082"%>
<%@page import="model.ordering.ShoppingCart082"%>
<%@page import="model.user.Client082"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đặt hàng</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <%
    String error = (String) session.getAttribute("error");
    if (error != null) {
    %>
    <div id="myNotification" class="notification-error">
            <%= error %>      
    </div>
    <%
        session.setAttribute("error", null);
        }
    %>
    <%
    String success = (String) session.getAttribute("success");
    if (success != null) {
    %>
    <div id="myNotification" class="notification-success">
            <%= success %>      
    </div>
    <%
        session.setAttribute("success", null);
        }
    %>
    <%
        Client082 user = (Client082) session.getAttribute("user");
    %>

    <nav>
        <a id="name"><%=user.getFullName()%></a>
        <a href="${pageContext.request.contextPath}/views/client/gdOrdering082.jsp">Đặt hàng</a>
        <a href="">Tra cứu</a>
        <a href="">Theo dõi hoá đơn</a>
        <a href="">Đăng ký thành viên</a>
        <a href="" class="select">Giỏ hàng</a>
    </nav>
        <%
            ShoppingCart082 shoppingCart = (ShoppingCart082) session.getAttribute("shoppingCart");
            Map<OrderedItem082, ImageItem082> items = shoppingCart.getItems();
            double total = 0.0;
            
            if (items.isEmpty()) {
        %>
        <div>Chưa có mặt hàng nào được thêm vào giỏ hàng</div>
        <%
            } else {
        %>
    <div class="container my-3" style="max-width: 100%; max-height: 5%; padding-inline: 10%; padding-top: 2rem;">
        <%
            for (Map.Entry<OrderedItem082, ImageItem082> item : items.entrySet()) {
                    OrderedItem082 orderedItem = item.getKey();
                    ImageItem082 imageItem = item.getValue();
                    
                
        %>
        <div class="row">
            <div class="card mb-3" style="padding: 0;">
              <div class="row g-0 ">
                <div class="col-md-2">
                    <img src="<%=imageItem.getLink()%>" class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-4">
                  <div class="card-body">
                    <h5 class="card-title"><%=orderedItem.getNameItem()%></h5>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="card-body">
                    <h5 class="card-title">Đơn giá</h5>
                    <h6 class="card-title text-body-secondary"><%=orderedItem.getExportedPrice()%> VND</h6>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="card-body">
                    <h5 class="card-title">Số lượng</h5>
                    <h6 class="card-title text-body-secondary"><%=orderedItem.getOrderedQuantity()%></h6>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="card-body">
                    <h5 class="card-title">Thành tiền</h5>
                    <h6 class="card-title text-body-secondary"><%=orderedItem.getTotalPrice()%> VND</h6>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <%
            }
        %>
        <div class="d-flex justify-content-center py-3">
            <button type="submit" class="btn btn-dark btn-lg" onclick="openPage('<%=request.getContextPath()%>/views/client/gdInvoice082.jsp')">Lưu đơn</button>
        </div>
    </div>
        <%
            }
        %>
</body>
</html>
<script>
function openPage(url) {
    window.location.href = url; // Chuyển hướng đến URL
}
</script>

<script>
        // Hiển thị thông báo khi tải trang
        window.onload = function() {
            var notification = document.getElementById('myNotification');
            notification.style.display = 'block';

            // Tắt thông báo sau 3 giây (3000 milliseconds)
            setTimeout(function() {
                notification.style.display = 'none';
            }, 3000);
        };
    </script>