<%-- 
    Document   : actualizar_cargo
    Created on : 25/05/2016, 08:05:47 AM
    Author     : EDINSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cargo" class="co.ufps.edu.dao.cargo_emp_DAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.cargo_empleado" scope="session"></jsp:useBean> 
<%
    
    String name=request.getParameter("name");
  
    datos.setNombre(name);
    cargo.actualizar(datos);
   response.sendRedirect("datos_cargo.jsp");
%>
