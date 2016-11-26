<%-- 
    Document   : confirmarpedido
    Created on : 28-may-2016, 16:43:39
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.Item"%>
<%@page import="co.ufps.edu.dto.Reserva"%>
<%@page import="co.ufps.edu.dto.Servicios"%>
<%@page import="facade.ControladorNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%String id=request.getParameter("idservicio");
       String cantidad=request.getParameter("cantidad");
       
       int canti=0;
       int id2=0;
       
       
       canti=Integer.parseInt(cantidad);
       id2=Integer.parseInt(id);
       
       
       ControladorNegocio n=new ControladorNegocio();
       
       
       
     Servicios servi=  n.listarserviciopor(id2);
     
    Reserva re= (Reserva)session.getAttribute("reserv1");
    
    Item item = new Item();
    
    item.setCantidad(canti);
    item.setId_cliente(re.getId_cliente());
    item.setId_reserva(re.getId());
    item.setIdser(servi.getId());
    item.setPrecio(servi.getPrecio());
    
    Item itemf=n.createItem(item);
    
    if(itemf!=null){
        request.getSession().setAttribute("registro", "se agrego el producto con nombre  "+servi.getNombre()+" al cuarto "+re.getId_hab());
       response.sendRedirect("addproducto.jsp"); 
    }
       
       %>
    </body>
</html>
