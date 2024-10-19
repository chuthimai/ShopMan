<%-- 
    Document   : gdShoppingCart082
    Created on : Oct 6, 2024, 9:41:36 AM
    Author     : maichu
--%>

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
    <nav>
        <a id="name">Client</a>
        <a href="${pageContext.request.contextPath}/views/client/gdOrdering082.jsp">Đặt hàng</a>
        <a href="">Tra cứu</a>
        <a href="">Theo dõi hoá đơn</a>
        <a href="">Đăng ký thành viên</a>
        <a href="" class="select">Giỏ hàng</a>
    </nav>

    <div class="container my-3" style="max-width: 100%; max-height: 5%; padding-inline: 10%; padding-top: 2rem;">
        <div class="row">
            <div class="card mb-3" style="padding: 0;">
              <div class="row g-0 ">
                <div class="col-md-2">
                  <img src="https://cdn.tgdd.vn/Products/Images/7718/328065/bhx/hop-4-banh-trung-thu-bach-hoa-xanh-thu-doan-vien-560g-202407221027274730.jpg" class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-4">
                  <div class="card-body">
                    <h5 class="card-title">Hộp 4 bánh trung thu Kinh Đô Thu Đoàn Viên 560g</h5>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="card-body">
                    <h5 class="card-title">Đơn giá</h5>
                    <h6 class="card-title text-body-secondary">199.000 VND</h6>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="card-body">
                    <h5 class="card-title">Số lượng</h5>
                    <h6 class="card-title text-body-secondary">1</h6>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="card-body">
                    <h5 class="card-title">Thành tiền</h5>
                    <h6 class="card-title text-body-secondary">199.000 VND</h6>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-dark btn-lg" onclick="openPage('<%=request.getContextPath()%>/views/client/gdInvoice082.jsp')">Lưu đơn</button>
        </div>
    </div>

</body>
</html>
<script>
function openPage(url) {
    window.location.href = url; // Chuyển hướng đến URL
}
</script>