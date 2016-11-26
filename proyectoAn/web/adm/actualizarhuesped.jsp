<%-- 
    Document   : actualizarhuesped
    Created on : 31/05/2016, 02:31:09 PM
    Author     : EDINSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="emp" class="co.ufps.edu.dao.HuespedDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.Huesped" scope="session"></jsp:useBean>  
<%
    int idh=Integer.parseInt(request.getParameter("idh"));
   String name= request.getParameter("name");
   String apell=request.getParameter("apell");
   int cedula= Integer.parseInt(request.getParameter("cedula"));
   String dir= request.getParameter("cont");
  String nac= request.getParameter("nac");
    String pro= request.getParameter("pro");
      String pass= request.getParameter("pass");
   int tel=Integer.parseInt(request.getParameter("tel"));
              
   System.out.println();
   datos.setIdcliente(idh);
   datos.setCc(cedula);
   datos.setApellidos(apell);
   datos.setNombre(name);
   datos.setDir(dir);
   datos.setPasaporte(pass);
   datos.setProcedencia(pro);
   datos.setNacionalidad(nac);
   datos.setTele(tel);
  
   
    
    emp.actualizar(datos);
    
    response.sendRedirect("Datos_Huesped.jsp");
    
%>
