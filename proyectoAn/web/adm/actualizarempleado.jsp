<%-- 
    Document   : actualizarempleado
    Created on : 25/05/2016, 06:21:34 AM
    Author     : EDINSON
--%>


<jsp:useBean id="emp" class="co.ufps.edu.dao.empleadoDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.empleado" scope="session"></jsp:useBean>  
<%
    int idh=Integer.parseInt(request.getParameter("idh"));
   String name= request.getParameter("name");
   String apell=request.getParameter("apell");
   int cedula= Integer.parseInt(request.getParameter("cedula"));
   String contr= request.getParameter("contr");
   String email= request.getParameter("email");
   int tel=Integer.parseInt(request.getParameter("tel"));
   int cargo=Integer.parseInt(request.getParameter("tipo"));             
   System.out.println();
   datos.setId(idh);
   datos.setCedula(cedula);
   datos.setApellidos(apell);
   datos.setNombre(name);
   datos.setEmail(email);
   datos.setContraseña(contr);
   datos.setTelefono(tel);
   datos.setCargo(cargo);
   
    
    emp.actualizar(datos);
    
    response.sendRedirect("Datos_empleado.jsp");
    
%>
