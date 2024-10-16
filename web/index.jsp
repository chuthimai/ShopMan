<%-- 
    Document   : index
    Created on : Oct 5, 2024, 10:47:29 AM
    Author     : maichu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="./styles/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body style="background-color: #47bdec;">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <div class="position-absolute top-50 start-50 translate-middle px-5 py-4" style="background-color: white; border-radius: 10%;">
        <form action="login" method="POST">
            <label class="form-label" for="email">Email: </label>
            <input class="form-control" id="email" type="text" name="email">
            <label class="form-label" for="password">Password: </label>
            <input class="form-control" id="password" type="password" name="password">

            <div class="d-flex justify-content-center py-3">
                <button type="submit" class="btn btn-dark btn-lg">Login</button>
            </div>
        </form>
        
        <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
        %>
            <script type="text/javascript">
                alert("<%= message %>");
            </script>
        <%
            }
        %>
    </div>

</body>

