<%-- 
    Document   : registrado_prop_por_tipo
    Created on : 25/05/2016, 09:39:57 PM
    Author     : EDINSON
--%>
<jsp:useBean id="obj" class="co.ufps.edu.dao.tipohabpropiedades" scope="session"></jsp:useBean>


<%
  int id=Integer.parseInt(request.getParameter("tipo"));
   String [] prop= request.getParameterValues("propiedad");
if(prop!=null && prop.length>0){
    for(int i=0;i<prop.length;i++){
        obj.insertar(id, Integer.parseInt(prop[i]));
       
    }
}
   response.sendRedirect("Datos_propiedadesTipoHab.jsp");
    %>