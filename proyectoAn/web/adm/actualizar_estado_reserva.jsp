<%-- 
    Document   : actualizar_estado_reserva
    Created on : 24/05/2016, 11:27:44 AM
    Author     : EDINSON
--%>

<jsp:useBean id="tipohab" class="co.ufps.edu.dao.estado_reservaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.estadoreserva" scope="session"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id=Integer.parseInt(request.getParameter("idh"));
    String nombre = request.getParameter("name");
  
   datos.setId(id);
   datos.setDescripcion(nombre);
    tipohab.actualizar(datos);
    
 response.sendRedirect("Estado_reserva.jsp");

%>