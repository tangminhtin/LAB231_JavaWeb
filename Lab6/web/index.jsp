<%-- 
    Document   : index
    Created on : Oct 4, 2020, 7:39:10 AM
    Author     : tangminhtin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-grid.css">
        <link rel="stylesheet" href="css/bootstrap-reboot.css">
        <title>Login</title>
    </head>
    <body>
        <div class="container-fluid col-xl-4">
            <h1 class="alert alert-primary text-center">Login</h1>
            <form action="UserController" method="POST">
                <div class="form-group row">
                    <label for="userID" class="col-sm-4 col-form-label">Username</label>
                    <div class="col-sm-8">
                        <input name="userID" type="text" class="form-control" id="userID" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-4 col-form-label">Password</label>
                    <div class="col-sm-8">
                        <input name="password" type="password" class="form-control" id="password" required>
                    </div>
                </div>
                <button name="btnLogin" value="login" type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>
        
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>
