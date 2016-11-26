<%-- 
    Document   : registrado
    Created on : 09-may-2016, 19:52:17
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.Huesped"%>
<%@page import="facade.ControladorNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="huesped" scope="page" class="co.ufps.edu.dto.Huesped"></jsp:useBean>
<jsp:setProperty property="*" name="huesped"/>

<%ControladorNegocio c = new ControladorNegocio();

Huesped h = c.registrarH(huesped);
if(h!=null){

%>
<p>se registro exitosamente</p>
        <%
response.sendRedirect("buscar.jsp"); 
}%>
    </body>
</html>
