<%-- 
    Document   : gdOrdering082
    Created on : Oct 6, 2024, 9:41:14 AM
    Author     : maichu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giỏ hàng</title>
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
        <a href="" class="select">Đặt hàng</a>
        <a href="">Tra cứu</a>
        <a href="">Theo dõi hoá đơn</a>
        <a href="">Đăng ký thành viên</a>
        <a href="${pageContext.request.contextPath}/views/client/gdShoppingCart082.jsp">Giỏ hàng</a>
    </nav>

    <div class="container text-right my-3">
        <form action="">
            <div class="row">
                <div class="col-10">
                    <input type="search" class="form-control" id="tenMatHang">
                </div>
                <div class="col-2">
                    <button type="submit" class="btn btn-secondary">Tìm kiếm</button>
                </div>
            </div>
        </form>

    </div>

    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col">
              <div class="card shadow-sm">
                <img class="card-img-top" src="https://cdn.tgdd.vn/Products/Images/7718/328065/bhx/hop-4-banh-trung-thu-bach-hoa-xanh-thu-doan-vien-560g-202407221027274730.jpg" style="width: 100%; height: 225">
                <div class="card-body">
                  <h5 class="card-title">Hộp 4 bánh trung thu Kinh Đô Thu Đoàn Viên 560g</h5>
                  <h6>Giá: 199.000VND</h6>
                  <form class="row">
                      <div class="col-6">
                          <label class="form-label" for="demo1">Số lượng:</label>
                          <input class="form-control" type="number" id="demo1">
                      </div>
                      <div class="col-6">
                           <button type="submit" class="btn btn-dark btn-lg">Thêm vào giỏ hàng</button>
                      </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card shadow-sm">
                <img class="card-img-top" src="https://cdn.tgdd.vn/Products/Images/7718/328119/bhx/hop-4-banh-trung-thu-kidos-bakery-my-vi-an-khang-xanh-600g-202407191047498839.jpg" style="width: 100%; height: 225">
                <div class="card-body">
                  <h5 class="card-title">Hộp 4 bánh trung thu Kido's Bakery Mỹ Vị An Khang xanh 600g</h5>
                  <h6>Giá: 490.000VND</h6>
                  <form class="row">
                      <div class="col-6">
                          <label class="form-label" for="demo2">Số lượng:</label>
                          <input class="form-control" type="number" id="demo2">
                      </div>
                      <div class="col-6">
                           <button type="submit" class="btn btn-dark btn-lg">Thêm vào giỏ hàng</button>
                      </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card shadow-sm">
                <img class="card-img-top" src="https://cdn.tgdd.vn/Products/Images/7718/328075/bhx/hop-4-banh-trung-thu-huu-nghi-food-momji-tu-quy-320g-202407181624464733.jpg" style="width: 100%; height: 225">
                <div class="card-body">
                  <h5 class="card-title">Hộp 4 bánh trung thu Hữu Nghị Momji Tứ Quý 320g</h5>
                  <h6>Giá: 390.000VND</h6>
                  <form class="row">
                      <div class="col-6">
                          <label class="form-label" for="demo3">Số lượng:</label>
                          <input class="form-control" type="number" id="demo3">
                      </div>
                      <div class="col-6">
                          <button type="submit" class="btn btn-dark btn-lg">Thêm vào giỏ hàng</button>
                      </div>
                  </form>
                </div>
              </div>
            </div>
        </div>
    </div>

</body>
</html>
