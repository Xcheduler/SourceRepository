<%-- 
    Document   : logout
    Created on : 22 Nov, 2016, 10:06:23 AM
    Author     : My Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% //session.setAttribute("user_id", null);
         session.invalidate();
         response.sendRedirect("/scheduler/Welcome.do");
     %>
    </body>
</html>
