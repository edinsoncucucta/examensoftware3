<%-- 
    Document   : actualizar_tipo_habitacion
    Created on : 17/05/2016, 09:20:30 PM
    Author     : EDINSON
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="tipohab" class="co.ufps.edu.dao.tipohabitaciondao" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.tipo_habitacion" scope="session"></jsp:useBean>

<%
    int id=Integer.parseInt(request.getParameter("idh"));
    String nombre = request.getParameter("name");
    int precio = Integer.parseInt(request.getParameter("precio"));
   datos.setId(id);
   datos.setNombre(nombre);
   datos.setPreciobase(precio);
    tipohab.actualizar(datos);
    
 response.sendRedirect("Datos_tipo_habitacion.jsp");

%>