<%-- 
    Document   : logut
    Created on : 01-jun-2016, 9:29:34
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%session.setAttribute("EmpleadoLogin", null);
        
        response.sendRedirect("login.jsp");
        
        %>
    </body>
</html>
