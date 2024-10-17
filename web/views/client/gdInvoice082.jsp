<%-- 
    Document   : gdInvoice082
    Created on : Oct 6, 2024, 9:41:52 AM
    Author     : maichu
--%>

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

    <nav>
        <a id="name">Client</a>
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
              <td>Nguyễn Văn A</td>
              <td></td>
            </tr>
            <tr>
              <th scope="row">Thời gian đặt hàng </th>
              <td>08/09/2024</td>
              <td>14:29:20</td>
            </tr>
            <tr>
              <th scope="row">Địa chỉ </th>
              <td>Số 1, phố A, TP B, tỉnh C, Việt Nam</td>
            </tr>
            <tr>
              <th scope="row">Mã đơn hàng </th>
              <td>DH5285965</td>
              <td></td>
            </tr>
          </tbody>
        </table>
        <table class="table text-start">
          <h4>Danh sách mặt hàng</h4>
          <thead>
            <tr>
              <th scope="col">STT</th>
              <th scope="col">Tên mặt hàng</th>
              <th scope="col">Số lượng</th>
              <th scope="col">Đơn giá</th>
              <th scope="col">Thành tiền</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Hộp 4 bánh trung thu Kinh Đô Thu Đoàn Viên 560g</td>
              <td>1</td>
              <td>199.000 VND</td>
              <td>199.000 VND</td>
            </tr>
            <tr>
              <th scope="row">Tổng tiền</th>
              <td colspan="4">199.000 VND</td>
            </tr>
          </tbody>
        </table>
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-dark btn-lg mx-1">Lưu</button>
            <button type="submit" class="btn btn-outline-secondary btn-lg mx-1">Hủy</button>
        </div>
    </div>

</body>
</html>