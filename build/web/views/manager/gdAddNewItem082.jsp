<%-- 
    Document   : gdAddNewItem082
    Created on : Oct 6, 2024, 9:39:53 AM
    Author     : maichu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm mặt hàng mới</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <nav>
        <a id="${pageContext.request.contextPath}/views/manager/gdMainManagement082.jsp">Manager</a>
        <a href="${pageContext.request.contextPath}/views/manager/gdItemManagement082.jsp" class="select">Quản lý mặt hàng</a>
        <a href="">Quản lý nhà cung cấp</a>
        <a href="">Nhập hàng</a>
        <a href="">Thống kê</a>
    </nav>

    <div class="container text-center my-3">
        <h3>Thông tin mặt hàng</h3>
    </div>
    <div class="container">
        <form>
            <div class="row">
                <div class="col-8">
                    <div class="mb-3">
                      <label for="tenMatHang" class="form-label">Tên mặt hàng</label>
                      <input type="text" class="form-control" id="tenMatHang">
                      <div class="row">
                            <div class="col-4">
                                <label for="donVi" class="form-label">Loại mặt hàng</label>
                                <select class="form-select" aria-label="Default select example" id="loai">
                                  <option selected>Select</option>
                                  <option value="1">Bánh trung thu</option>
                                  <option value="2">Mì tôm</option>
                                  <option value="3">Nước</option>
                                  <option value="4">Hoa quả</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <label for="nhanHieu" class="form-label">Nhãn hiệu</label>
                                <input type="text" class="form-control" id="nhanHieu">
                            </div>
                            <div class="col-4">
                                <label for="hsd" class="form-label">Hạn sử dụng</label>
                                <input type="text" class="form-control" id="hsd">
                            </div>

                        </div>
                      <div class="row">
                            <div class="col-4">
                                <label for="giaBan" class="form-label">Giá bán (VND)</label>
                                <input type="number" class="form-control" id="giaBan">
                            </div>
                            <div class="col-4">
                                <label for="donVi" class="form-label">Đơn vị mặt hàng</label>
                                <select class="form-select" aria-label="Default select example" id="donVi">
                                  <option selected>Select</option>
                                  <option value="1">Cái</option>
                                  <option value="2">Chiếc</option>
                                  <option value="3">Hộp</option>
                                  <option value="4">Gói</option>
                                </select>
                            </div>
                        </div>
                      <div class="row my-3">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Các thông tin khác của sản phẩm</h5>
                                    <table class="table table-striped table-bordered" id="tableThemThongTin">
                                        <thead>
                                            <tr>
                                              <th scope="col">STT</th>
                                              <th scope="col">Tên thông tin</th>
                                              <th scope="col">Mô tả </th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-group-divider">

                                        </tbody>
                                    </table>
                                    <div class="d-grid gap-2">
                                        <button type="button" class="add-row-btn" onclick="addRow()">+</button>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="text-center mb-3">
                        <button type="button" class="btn btn-secondary btn-lg" onclick="addImageInput()">+ Thêm ảnh</button>
                    </div>
                    <div id="imageContainer" class="d-flex flex-column align-items-center"></div>
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-dark btn-lg mx-1">Lưu mặt hàng</button>
                <button type="submit" class="btn btn-outline-secondary btn-lg mx-1">Hủy</button>
            </div>
        </form>
    </div>

    <script>
        function addRow() {
            // Lấy bảng và tbody
            var table = document.getElementById("tableThemThongTin").getElementsByTagName('tbody')[0];

            // Tạo một hàng mới
            var newRow = table.insertRow();

            // Tạo các ô mới cho hàng
            var cell1 = newRow.insertCell(0);
            var cell2 = newRow.insertCell(1);
            var cell3 = newRow.insertCell(2);

            // Lấy số thứ tự hiện tại của hàng mới
            var rowCount = table.rows.length;

            // Gán dữ liệu cho các ô
            cell1.innerHTML = rowCount;
            cell2.innerHTML = "<input type='text' class='form-control' placeholder='Nhập tên thông tin' id='tenThongTin" + rowCount +"'>";
            cell3.innerHTML = "<input type='text' class='form-control' placeholder='Nhập mô tả thông tin' id='moTaThongTin" + rowCount + "'>";
        }

        function addImageInput() {
            // Tạo một thẻ div để chứa ảnh và input
            var div = document.createElement("div");
            div.classList.add("mb-3");

            // Tạo một thẻ input loại file
            var input = document.createElement("input");
            input.type = "file";
            input.accept = "image/*";
            input.classList.add("form-control");

            // Khi người dùng chọn tệp, hiển thị ảnh đã chọn
            input.onchange = function(event) {
                var file = event.target.files[0];
                if (file) {
                    // Tạo thẻ img để hiển thị ảnh
                    var img = document.createElement("img");
                    img.src = URL.createObjectURL(file);
                    img.style.maxWidth = "200px";
                    img.style.marginTop = "10px";

                    // Thêm thẻ img vào div
                    div.appendChild(img);
                }
            };

            // Thêm input vào div
            div.appendChild(input);

            // Thêm div vào vùng chứa ảnh
            document.getElementById("imageContainer").appendChild(div);
        }
    </script>
</body>
