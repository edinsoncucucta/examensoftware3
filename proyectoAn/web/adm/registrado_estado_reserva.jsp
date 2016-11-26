<%-- 
    Document   : registrado_estado_reserva
    Created on : 24/05/2016, 08:23:48 PM
    Author     : EDINSON
--%>

<jsp:useBean id="ereserva" class="co.ufps.edu.dao.estado_reservaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.estadoreserva" scope="session"></jsp:useBean>  
<%
    String nombre = request.getParameter("name");
   datos.setDescripcion(nombre);
   String m=ereserva.insertar(datos);
    
    /*System.out.println(msg);
    session.setAttribute("mensaje", msg);
    
    response.sendRedirect("Estado_habitacion.jsp");*/
    out.println(m);
%>
