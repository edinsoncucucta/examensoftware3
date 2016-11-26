<%-- 
    Document   : buscar
    Created on : 09-may-2016, 15:05:14
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="co.ufps.edu.dto.Reserva"%>
<%@page import="co.ufps.edu.dto.Cliente"%>
<%@page import="co.ufps.edu.dto.cuarto"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="java.util.List"%>
<%@page import="co.ufps.edu.dto.Huesped"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        
        
        

        
             <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="material/css/materialize.min.css"  media="screen,projection"/>
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

 <%
  ControladorNegocio c4 = new ControladorNegocio();
 empleado emp=(empleado)session.getAttribute("EmpleadoLogin");
 if(emp!=null){
 
 %>



        <title>Buscar</title>
    </head>
    <body>
       
        
        
       
        
        
        
        
        
        
        
        
	<jsp:include page="menu.jsp" />
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Buscar Huesped</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Huesped</div>
     
        
        <%Cliente huesped = (Cliente)session.getAttribute("huesped");
        
        
        if(huesped!=null){
                %>
      <div class="alert alert-success">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>¡Felicdades!</strong>Registro el Huesped correctamente
</div>
     <%
            
            
        
   
   }
        
        session.setAttribute("huesped",null);
     
        
        String idcuarto=request.getParameter("idcuartoselecionado");
        habitaciones h=null;
        if(idcuarto!=null){
            int idhabi=Integer.parseInt(idcuarto);
            h=c4.buscarh(idhabi);
            
            session.setAttribute("habien", h);
        }
     %>
     
     
     <%Reserva reserva = (Reserva)session.getAttribute("rhecha");
     
     if(reserva!=null){
     
     %>
        
     
      <div class="alert alert-success">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>¡Felicdades!</strong>Reserva hecha
</div>
     
     <%}
     session.setAttribute("rhecha", null);
     %>
					<div class="panel-body">
						<div class="col-md-6">
                                                    <form  method="GET" action="buscar.jsp" >
							<form role="form">
							
								<div class="form-group">
									<label>Digite la cedula del huesped</label>
									<input class="form-control" placeholder="Cedula" name="cc">
								</div>
																
								<div class="form-group">
                                                                    
									
								<button type="submit" class="btn btn-primary">Buscar</button>
                                                                 
								
								</div>
								 </form>
								
																
								
								
								
								
								
								
							</div>
							<div class="col-md-12">
							
								
					 <%
                                             
                                             //objetos sessiones
                                             
                                            
                                            
                                             
                                             
                                             
                                             //busqueda
                                             String busqueda=request.getParameter("cc");
        if(busqueda!=null){
            
        
        %>
        
        <%//hay busqueda
        ControladorNegocio c= new ControladorNegocio();
        int bus=Integer.parseInt(busqueda);
        Cliente cliente=c.ListarClientepor(bus);
        habitaciones selecionada =(habitaciones)session.getAttribute("habien");
        
        %>
       
        <table class="table">
    <thead>
        <tr>
            <th>id</th>
            <th>cc</th>
            <th>Nombre</th>
            <th>Nacionalidad</th>
            <th>Elegir</th>
        </tr>
    </thead>
    <tbody>
        
       
     
       
       
       
       
           
       
        <tr>
            
    <form action="facturar.jsp" method="POST">
            <td><%=cliente.getId()%></td>
             <td><%=cliente.getCedula()%></td>
            <td> <%=cliente.getNombre()%>  </td>
            <td> <%=cliente.getNacionalidad()%></td>
             
               <input type="hidden" name="idclienteReserva" value="<%=cliente.getId()%>">
               <input type="hidden" name="idcuartoselecionado" value="<%=selecionada.getId()%>">
            <td> <input type="submit" value="Elegir" class="btn btn-info" min="0"/></td>
            
            </form>
        </tr>
   
      
    </tbody>
</table>
        
        
        <%}
        
        %>			
								
				
								
		 <br>
        <br>
        <br>						
								
							</div>
        <div class ="col-md-12"  style="text-align: center;">  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Registrar Huesped
</button></div>
        
        
       
        
        <br>
        <br>
        <br>
     
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    

        <h4 class="modal-title" id="myModalLabel">Llenar informacion del Huesped</h4>
     
     
        <form  action="registrado.jsp" method="post">

            
      
      
      
  
                 
                  <input class="form-control" placeholder="Cedula" name="cedula" required>
               
      
                  <input class="form-control" placeholder="Nombre" name="nombre" required>
               
      
                  <input class="form-control" placeholder="Apellidos" name="apellidos" required>
              
      
                  <input class="form-control" placeholder="Direccion" name="direccion" required>
              
      
                  <input class="form-control" placeholder="Telefono" name="telefono" required>
               
      
      
      
                  <input class="form-control" placeholder="Pasaporte" name="pasaporte" required>
             
      
                  <input class="form-control" placeholder="Procedencia" name="procedencia" required>
              
                  <input class="form-control" placeholder="Nacionalidad" name="nacionalidad" required>
            

                   

 
</br>


       
 
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      <input type="submit" value="Registrar" class="btn btn-info" min="0"/>
      </div>
        
         </form>
    
  </div>
</div>
        
        
        
						
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->
         <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="material/js/materialize.min.js"></script>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>
        
        
        
        
        
          <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script> 
<script>
// jQuery
$(document).ready(function(){ 
  
    $('#alternar-respuesta-ej5').toggle( 
  
        // Primer click
        function(e){ 
            $('#respuesta-ej5').slideDown();
            $(this).text('Esconder Formulario');
            e.preventDefault();
        }, // Separamos las dos funciones con una coma
      
        // Segundo click
        function(e){ 
            $('#respuesta-ej5').slideUp();
            $(this).text('Desea Registrar un Huesped?');
            e.preventDefault();
        }
  
    );
  
});


<%}
 else{
     response.sendRedirect("login.jsp"); 
 }
%>
</script>
</body>
</html>
