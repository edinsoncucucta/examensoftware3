<%-- 
    Document   : login
    Created on : 31-may-2016, 17:03:19
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forms</title>



 
    <link rel='stylesheet prefetch' href='http://daneden.github.io/animate.css/animate.min.css'>
<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,400italic,700italic,700'>

        <link rel="stylesheet" href="login/css/style.css">




 



<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
    <%
         empleado emplogin=null;
        
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    ControladorNegocio n= new ControladorNegocio();
    
    if(email!=null&&password!=null){
        empleado emp= new empleado();
        emp.setEmail(email);
        emp.setContraseña(password);
        
    emplogin =n.login(emp);
    
    }
      
     
          
      
        
        
    
    %>
	
	
                            
                          
                         
					
					
  <div class='form animated flipInX'>
  <h2>Ingrese sus Datos</h2>
  <form action="login.jsp" method="POST">
    <input  name="email" placeholder='Username' type='text'>
    <input  name="password" placeholder='Password' type='password'>
    <button class='animated infinite pulse'>Login</button>
  </form>


                        
                                    
                                    
                                    <% if(emplogin==null&&email!=null&&password!=null){
                                    
                                    %>
                                    <p>opps clave  o usario incorrectos</p>
                                    </div>
					<%}
                                        
                                        
                                        
                                        
                                    else if (emplogin!=null&&email!=null&&password!=null){
        
        session.setAttribute("EmpleadoLogin", emplogin);
        if(emplogin.getCargo()==2){
            //recepcinista
        response.sendRedirect("cuartos.jsp"); 
        }else{
             response.sendRedirect("./adm/Datos_hotel.jsp");  
        }
        
        
}
                                        %>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	
		

        
         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="login/js/index.js"></script>

</body>

</html>

