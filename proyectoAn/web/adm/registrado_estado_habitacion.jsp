<%-- 
    Document   : registrado_estado_habitacion
    Created on : 24/05/2016, 10:31:34 AM
    Author     : EDINSON
--%>

<jsp:useBean id="hotel" class="co.ufps.edu.dao.estado_habDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.estadohab" scope="session"></jsp:useBean>   
<%
    String nombre = request.getParameter("name").toString();
   
    
    
   datos.setDescripcion(nombre);
    
   String m= hotel.insertar(datos);
    
    /*System.out.println(msg);
    session.setAttribute("mensaje", msg);*/
    out.println(m);
    //response.sendRedirect("Estado_habitacion.jsp");
%>
