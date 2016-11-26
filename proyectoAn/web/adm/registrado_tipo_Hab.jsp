<%-- 
    Document   : registrado_tipo_Hab
    Created on : 17/05/2016, 06:07:29 PM
    Author     : EDINSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="tipohab" class="co.ufps.edu.dao.tipohabitaciondao" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.tipo_habitacion" scope="session"></jsp:useBean> 
<%
    int precio = Integer.parseInt(request.getParameter("precio"));
    String name=request.getParameter("name");
    System.out.println(precio+" **** "+name);
    datos.setNombre(name);
    datos.setPreciobase(precio);
    
    String msm= tipohab.insertar(datos);
    out.println(msm);
  // response.sendRedirect("Datos_tipo_habitacion.jsp");
%>