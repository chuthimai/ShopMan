<%-- 
    Document   : gdOrdering082
    Created on : Oct 6, 2024, 9:41:14 AM
    Author     : maichu
--%>

<%@page import="model.item.ImageItem082"%>
<%@page import="model.item.Item082"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.user.Client082"%>
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

    <%
        Client082 user = (Client082) session.getAttribute("user");
    %>

    <nav>
        <a id="name"><%=user.getFullName()%></a>
        <a href="" class="select">Đặt hàng</a>
        <a href="">Tra cứu</a>
        <a href="">Theo dõi hoá đơn</a>
        <a href="">Đăng ký thành viên</a>
        <a href="${pageContext.request.contextPath}/views/client/gdShoppingCart082.jsp">Giỏ hàng</a>
    </nav>

    <div class="container text-right my-3">
        <form action="${pageContext.request.contextPath}/searchItems" method="GET">
            <div class="row">
                <div class="col-10">
                    <input type="search" class="form-control" id="tenMatHang" name="search">
                </div>
                <div class="col-2">
                    <button type="submit" class="btn btn-secondary">Tìm kiếm</button>
                </div>
            </div>
        </form>

    </div>
    
        <%
        try {
            ArrayList<Item082> items = (ArrayList<Item082>) request.getAttribute("items");
            ArrayList<ImageItem082> images = (ArrayList<ImageItem082>) request.getAttribute("images");
            if (items.isEmpty()) {
        %>
        <div class="container">Không có kết quả nào cho từ khóa trên</div>
        <%
            } else {
            int numItem = items.size();
        %>

    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <%
                for (int i=0; i<numItem; i++) {
                Item082 item = items.get(i);
                ImageItem082 image = images.get(i);
            %>
            <div class="col">
              <div class="card shadow-sm">
                <img class="card-img-top" src="<%=image.getLink()%>" style="width: 100%; height: 225">
                <div class="card-body">
                  <h5 class="card-title"><%=item.getNameItem()%></h5>
                  <h6>Giá: <%=item.getExportedPrice()%>VND</h6>
                  <form class="row">
                      <div class="col-6">
                          <label class="form-label" for="demo1">Số lượng:</label>
                          <input class="form-control" type="number" id="demo1" name="quanity">
                      </div>
                      <div class="col-6">
                           <button type="submit" class="btn btn-dark btn-lg">Thêm vào giỏ hàng</button>
                      </div>
                  </form>
                </div>
              </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
       <%
            }
        } catch (Exception e){
            System.out.println(e);
        }
        %>
</body>
</html>
