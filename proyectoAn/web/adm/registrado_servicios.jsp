<%-- 
    Document   : registrado_estado_habitacion
    Created on : 24/05/2016, 10:31:34 AM
    Author     : EDINSON
--%>

<jsp:useBean id="serhotel" class="co.ufps.edu.dao.servicioDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.Servicios" scope="session"></jsp:useBean>    
<%
    String nombre = request.getParameter("name");
   int precio = Integer.parseInt(request.getParameter("precio"));
    
    
   datos.setNombre(nombre);
   datos.setPrecio(precio);
    
    String m= serhotel.insertar(datos);
    
    /*System.out.println(msg);
    session.setAttribute("mensaje", msg);*/
    out.println(m);
    /*response.sendRedirect("Datos_servicios.jsp");*/
%>
