<%-- 
        Document   : actualizarpropiedadhab
    Created on : 18/05/2016, 07:18:21 AM
    Author     : EDINSON
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prophab" class="co.ufps.edu.dao.propiedadeshabDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.propiedadeshab" scope="session"></jsp:useBean>

<%
    int id=Integer.parseInt(request.getParameter("idh"));
    String nombre = request.getParameter("name");
    int inc = Integer.parseInt(request.getParameter("inc"));
   datos.setId(id);
   datos.setDescripcion(nombre);
   datos.setInc(inc);
    prophab.actualizar(datos);
    
 response.sendRedirect("Datos_propiedadesHab.jsp");

%>