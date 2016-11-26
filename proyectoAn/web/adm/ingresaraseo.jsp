<%-- 
    Document   : ingresaraseo
    Created on : 26/05/2016, 01:28:00 PM
    Author     : EDINSON
--%>

<jsp:useBean id="facade" class="co.ufps.edu.dao.limpiezaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="dato" class="co.ufps.edu.dto.limpieza" scope="session"></jsp:useBean>

<%
    
    String hab = request.getParameter("hab").toString();
    String emp = request.getParameter("emp").toString();
    System.out.println("esteee:::::" + emp+"----------"+hab);
    dato.setId_emp(Integer.parseInt(emp));
    dato.setId_hab(Integer.parseInt(hab));
    String msg = facade.insertar(dato);//esto le esta dando error al insertar porq?
    
    System.out.println("esteee22222:::::" + msg);
    
    
    out.print(msg);
%>