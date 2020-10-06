<%-- 
    Document   : create_user
    Created on : Sep 30, 2020, 1:32:39 AM
    Author     : tangminhtin
--%>

<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-grid.css">
        <link rel="stylesheet" href="css/bootstrap-reboot.css">
        <title>Add New User</title>
    </head>
    <body>
        <% 
            User user = (User) request.getSession().getAttribute("user");
            if(user == null) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>
        <div class="container-fluid col-xl-4">
            <h1 class="alert alert-primary text-center">Add New User</h1>
            <p>Create a brand new user and add them to this site</p>

            <form action="UserController" method="POST">
                <div class="form-group row">
                    <label for="userID" class="col-sm-4 col-form-label">User ID</label>
                    <div class="col-sm-8">
                        <input name="userID" type="text" class="form-control" id="userID" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-4 col-form-label">Email address</label>
                    <div class="col-sm-8">
                        <input name="email" type="email" class="form-control" id="email" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="firstname" class="col-sm-4 col-form-label">First Name</label>
                    <div class="col-sm-8">
                        <input name="firstname" type="text" class="form-control" id="firstname" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lastname" class="col-sm-4 col-form-label">Last Name</label>
                    <div class="col-sm-8">
                        <input name="lastname" type="text" class="form-control" id="lastname" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="website" class="col-sm-4 col-form-label">Website</label>
                    <div class="col-sm-8">
                        <input name="website" type="text" class="form-control" id="website" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-4 col-form-label">Password</label>
                    <div class="col-sm-8">
                        <input name="password" type="password" class="form-control" id="password" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="confirm" class="col-sm-4 col-form-label">Confirm Password</label>
                    <div class="col-sm-8">
                        <input name="confirm" type="password" class="form-control" id="confirm" required>
                        <span class="text-danger " id="checkPass"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="noti" class="col-sm-4 col-form-label">Send User Notification</label>
                    <div class="col-sm-8">
                        <div class="form-check">
                            <input name="noti" value="1" type="checkbox" class="form-check-input" id="noti" checked>
                            <label class="form-check-label" for="noti">Send the new user an email about their account</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="role" class="col-sm-4 col-form-label">Role</label>
                    <div class="col-sm-8">
                        <select name="cbRole" class="form-control">
                            <option value="1">Administrator</option>
                            <option value="2">Subscriber</option>
                        </select>
                    </div>
                </div>
                <button name="btnCreate" value="add" type="submit" class="btn btn-primary btn-block">Add New User</button>
            </form>


        </div>

        <script src="js/jquery-slim.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        
        <script>
            function checkPasswordMatch() {
                var password = $("#password").val();
                var confirmPassword = $("#confirm").val();

                if (password != confirmPassword)
                    $("#checkPass").html("Passwords do not match!");
                else
                    $("#checkPass").html("");
            }

            $(document).ready(function () {
               $("#confirm").keyup(checkPasswordMatch);
            });

        </script>
    </body>
</html>
