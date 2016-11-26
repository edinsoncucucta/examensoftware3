<%-- 
    Document   : registradoHotel
    Created on : 6/05/2016, 07:45:30 AM
    Author     : EDINSON
--%>

<jsp:useBean id="hab" class="co.ufps.edu.dao.daohabitaciones" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.habitaciones" scope="session"></jsp:useBean>   
<%
    int id_hab = Integer.parseInt(request.getParameter("idh").toString());
    int tipo = Integer.parseInt(request.getParameter("tipo").toString());
    int estado = Integer.parseInt(request.getParameter("estado").toString());
    String foto=request.getParameter("foto").toString();
   String m="error";
   
   datos.setId(id_hab);
    datos.setTipo(tipo);
    datos.setEstado(estado);
    datos.setFoto(foto);
    m=hab.insertar1(datos);
    
    System.out.println("esteee22222:::::" + m);
    out.println(m);
%>
