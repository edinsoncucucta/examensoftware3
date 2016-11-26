<%-- 
    Document   : registradoempleado
    Created on : 24/05/2016, 08:26:36 PM
    Author     : EDINSON
--%>

<jsp:useBean id="emp" class="co.ufps.edu.dao.empleadoDAO" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.empleado" scope="session"></jsp:useBean> 
<%
    
    
   String name= request.getParameter("name").toString();
   
   String apell=request.getParameter("apell").toString();
   int cedula= Integer.parseInt(request.getParameter("cedula").toString());
   String contr= request.getParameter("cont").toString();
   String email= request.getParameter("email").toString();
   int tel=Integer.parseInt(request.getParameter("tel").toString());
   int cargo=Integer.parseInt(request.getParameter("cargo").toString());             
   System.out.println(name+"-"+apell+"-"+cedula+"-"+contr+"-"+email+"-"+tel+"-"+cargo);
 String msg="";
  //  if(cargo !=0){
   datos.setCedula(cedula);
   datos.setApellidos(apell);
   datos.setNombre(name);
   datos.setEmail(email);
   datos.setContraseña(contr);
   datos.setTelefono(tel);
   datos.setCargo(cargo);
   
    
   msg= emp.insertar(datos);
   
    
   // response.sendRedirect("Datos_empleado.jsp");
 //   }//else{
       //response.sendRedirect("erroremp.jsp"); 
    //}
     out.print(msg);
    
%>