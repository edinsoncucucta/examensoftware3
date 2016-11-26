<%-- 
    Document   : actualizar_estado_hab
    Created on : 24/05/2016, 11:27:44 AM
    Author     : EDINSON
--%>



  <jsp:useBean id="serhotel" class="co.ufps.edu.dao.servicioDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.Servicios" scope="session"></jsp:useBean>    
<%
    int id=Integer.parseInt(request.getParameter("idh").toString());
    
    String nombre = request.getParameter("name");
   int precio = Integer.parseInt(request.getParameter("precio"));
    
   datos.setId(id);
   datos.setNombre(nombre);
   datos.setPrecio(precio);
    
    serhotel.actualizar(datos);

    
    response.sendRedirect("Datos_servicios.jsp");
%>