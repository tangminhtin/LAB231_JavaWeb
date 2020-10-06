<%-- 
    Document   : management
    Created on : Oct 4, 2020, 8:57:52 AM
    Author     : tangminhtin
--%>

<%@page import="DAO.RoleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-grid.css">
        <link rel="stylesheet" href="css/bootstrap-reboot.css">
        <title>User Management</title>
    </head>
    <body>
        
        <%
            User user = (User) request.getSession().getAttribute("user");
            if(user == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            UserDAO udao = new UserDAO();
            RoleDAO rdao = new RoleDAO();
            boolean isAdmin = user.getRoleID() == 1 ? true : false;
            ArrayList<User> users = (ArrayList<User>) request.getSession().getAttribute("users");
        %>
        <div class="container-fluid col-xl-8">
            <h1 class="alert alert-primary text-center">Show All User</h1>
            
            <form action="UserController" method="GET" class="form-inline">
                <p class="text-primary col-xl-4">Welcome, <%= user.getUserID()%> <a class="text-info" href="UserController?logout=ok">Logout</a></p>
                <div class="col-xl-4 mr-auto">
                    <input id="btnSearch" name="search" class="mb-6" type="text" id="search">
                    <button name="btnSearch" type="button" class="btn btn-primary mb-6">Search</button>
                </div>
                <% if(isAdmin) {%>
                    <button name="btnSearch" type="submit" class="btn btn-success mb-4"><a href="create_user.jsp" class="text-white ">Add New User</a></button>
                <% } %>
            <!--</form>-->
            
            <!--<form action="UserController" method="GET">-->
                <div class="form-inline">
                    <div class="btn-group mr-auto" role="group">
                        <button name="choice" value="all" type="submit" class="btn btn-primary">All (<%=udao.getSize()%>)</button>
                        <button name="choice" value="admin" type="submit" class="btn btn-info">Administrator (<%=udao.getAd() %>)</button>
                        <button name="choice" value="sub" type="submit" class="btn btn-secondary">Subscriber (<%=udao.getSub() %>)</button>
                    </div>

                    <% if(isAdmin) {%>
                        <div class="input-group mr-auto">
                            <select name="cbRole" class="custom-select" id="cbRole">
                              <option value="1">Change Role to Administrator</option>
                              <option value="2">Change Role to Subscriber</option>
                            </select>
                            <div class="input-group-append">
                                <button name="btnChange" value="change" class="btn btn-outline-secondary" type="submit">Change</button>
                            </div>
                        </div>
                    <% } %>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="text-center"><input id="checkAll" name="checkAllUser" type="checkbox"/> Username</th>
                                <th class="text-center">Name</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Role</th>
                            </tr>
                        </thead>
                        <tbody id="tableUser">
                            <%
                                for(User u: users) { %>
                                <tr>
                                    <th><input name="cbUsers" type="checkbox" value="<%=u.getUserID()%>"><%=u.getUserID()%></th>
                                    <td><%=u.getFirstname()%></td>
                                    <td><%=u.getEmail()%></td>
                                    <td><%=rdao.getRole(u.getRoleID())%></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </form>

            
        </div>
                        
                        
        

        
        <script src="js/jquery-slim.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        
        <script>
            $("#checkAll").click(function(){
                $('input:checkbox').not(this).prop('checked', this.checked);
            });
            
            $(document).ready(function(){
                $("#btnSearch").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#tableUser tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
    </body>
</html>
