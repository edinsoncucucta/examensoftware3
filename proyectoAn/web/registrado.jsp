<%-- 
    Document   : registrado
    Created on : 09-may-2016, 19:52:17
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.Cliente"%>
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
         <jsp:useBean id="cliente" scope="page" class="co.ufps.edu.dto.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="cliente"/>

<%ControladorNegocio c = new ControladorNegocio();

Cliente h = c.crearCliente(cliente); 


if(h!=null){
//crear alerta inserta mensaje para mostrar por post
%>

        <%
    
    
    session.setAttribute("huesped", h);
response.sendRedirect("buscar.jsp"); 
}%>
    </body>
</html>
