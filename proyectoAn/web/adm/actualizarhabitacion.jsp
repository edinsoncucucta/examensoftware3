<%-- 
    Document   : actualizarhabitacion
    Created on : 17/05/2016, 01:50:16 PM
    Author     : EDINSON
--%>

<jsp:useBean id="hab" class="co.ufps.edu.dao.daohabitaciones" scope="session"></jsp:useBean>>
<jsp:useBean id="datos" class="co.ufps.edu.dto.habitaciones" scope="session"></jsp:useBean>>  

<%
int id=Integer.parseInt(request.getParameter("idh"));
    int tipo = Integer.parseInt(request.getParameter("tipo"));
    int estado = Integer.parseInt(request.getParameter("estado"));
    String foto=request.getParameter("foto");
        String obs= request.getParameter("obs").toString();
datos.setId(id);
    datos.setTipo(tipo);
    datos.setEstado(estado);
    datos.setFoto(foto);
    datos.setObservacion(obs);
    hab.actualizar(datos);
    
    response.sendRedirect("Datos_habitacion.jsp");
%>
