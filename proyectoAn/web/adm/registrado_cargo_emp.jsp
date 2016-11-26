<%-- 
    Document   : registrado_cargo_emp
    Created on : 25/05/2016, 07:22:13 AM
    Author     : EDINSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cargo" class="co.ufps.edu.dao.cargo_emp_DAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.cargo_empleado" scope="session"></jsp:useBean> 
<%
    
    String name=request.getParameter("name").toString();
    System.out.println(" **** "+name);
    datos.setNombre(name);
   String msm= cargo.insertar(datos);
 //  response.sendRedirect("datos_cargo.jsp");
 out.println(msm);
%>
