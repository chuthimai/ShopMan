<%-- 
    Document   : gdItemManagement082
    Created on : Oct 6, 2024, 9:39:34 AM
    Author     : maichu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý mặt hàng</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <nav>
        <a href="" id="name">Manager</a>
        <a href="${pageContext.request.contextPath}/views/manager/gdItemManagement082.jsp" class="select">Quản lý mặt hàng</a>
        <a href="">Quản lý nhà cung cấp</a>
        <a href="">Nhập hàng</a>
        <a href="">Thống kê</a>
    </nav>

    <div class="container text-right my-3">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="button" class="btn btn-secondary" onclick="openPage('<%=request.getContextPath()%>/views/manager/gdAddNewItem082.jsp')">+ Thêm mặt hàng</button>
        </div>
    </div>

    <div class="container">
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">STT</th>
              <th scope="col">Tên mặt hàng</th>
              <th scope="col">Loại</th>
              <th scope="col">Nhãn hiệu</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Bánh trung thu Kinh Đô Lava trứng chảy</td>
              <td>Bánh trung thu</td>
              <td>Kinh Đô</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Gạo thơm Vua Gạo ST25 túi 5kg</td>
              <td>Gạo</td>
              <td>Vua Gạo</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Ngũ cốc Nestlé Milo vị socola hộp 170g</td>
              <td>Ngũ cốc</td>
              <td>Nestlé</td>
            </tr>
          </tbody>
        </table>
    </div>

</body>
</html>

<script>
function openPage(url) {
    window.location.href = url; // Chuyển hướng đến URL
}
</script>
