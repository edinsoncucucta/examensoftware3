<%-- 
    Document   : eliminarprophab
    Created on : 25/05/2016, 11:17:04 PM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dao.tipohabpropiedades"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    int idp= Integer.parseInt(request.getParameter("idprop"));
    
tipohabpropiedades t=new tipohabpropiedades();
t.eliminar(id,idp);
response.sendRedirect("Datos_propiedadesTipoHab.jsp");
%>