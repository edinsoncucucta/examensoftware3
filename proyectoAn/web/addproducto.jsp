<%-- 
    Document   : addproducto
    Created on : 28-may-2016, 16:06:33
    Author     : macaco
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="co.ufps.edu.dto.Servicios"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="co.ufps.edu.dto.Cliente"%>
<%@page import="co.ufps.edu.dto.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
         <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="material/css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        

        
        
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

 


        <title>Buscar</title>
    </head>
    <body>
       
        
        
       
        
        
        
        
        
        
        
        
	<jsp:include page="menu.jsp" />
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Agregar Producto</h1>
                                
                                <%String registro=(String)request.getSession().getAttribute("registro");

if(registro!=null){
    

%>
    <div class="alert alert-success">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>¡Felicdades!</strong> <%=registro%>
</div>
    <%}
    
    request.getSession().setAttribute("registro", null);
    %>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Encuentra el Cuarto</div>
                                        
                                        
					<div class="panel-body">
						<div class="col-md-6">
                                                    <form  method="GET" action="addproducto.jsp" >
							<form role="form">
							
								<div class="form-group">
									<label>Digite El numero del cuarto</label>
									<input class="form-control" placeholder="#cuarto" name="cc">
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
                                             Reserva yabusco=(Reserva)session.getAttribute("reserv1");
                                             
        if(busqueda!=null){
            
        
        %>
        
        <%//hay busqueda
        ControladorNegocio c= new ControladorNegocio();
        int bus=Integer.parseInt(busqueda);
        List<Servicios>servicios=c.ListarSErvicio();
        
        Reserva re=c.buscarReservaporHuesped(bus);
        session.setAttribute("reserv1", re);
         
         if(re!=null){
         
        %>
       
        <table class="table">
    <thead>
        <tr>
            <th>id</th>
            <th>Nombre producto</th>
             <th>Precio</th>
                <th>Cantidad</th>
              <th>Elegir</th>
           
           
        </tr>
    </thead>
   
    <tbody>
         
       
     
       
       
       
      <%for(Servicios s:servicios){%>
        <tr>
    
        
            <td><%=s.getId()%></td>
           
             <td><%=s.getNombre()%></td>
           
            <td><%=s.getPrecio()%></td>
              <form action="confirmarpedido.jsp" method="POST">
            <td><input type="text" name="cantidad">  </td> 
            <input type="hidden" name="idservicio" value="<%=s.getId()%>">
            <td><input type="submit" value="agregar servicio" class="btn btn-info" min="0"/></td> 
            
          </form>
            
        </tr>
    <%
      
      }
       
      
      
      
        %>
          
    </tbody>

         
</table>
        
        
    			
								
				
								
		 <br>
        <br>
        <br>						
								
							</div>
       <%}else{
         
         
         
        
       %> 
       <p>ops este cuarto no esta en reserva en este momento o no eixste verifique</p>
       
       <%
         
         }
         
         
  }%>
        
        <br>
        <br>
        <br>
        
        <div class="col-md-12" id="respuesta-ej5" style="display: none;" >
            
          
        </div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

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

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="material/js/materialize.min.js"></script>
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
</script>
</body>
</html>
