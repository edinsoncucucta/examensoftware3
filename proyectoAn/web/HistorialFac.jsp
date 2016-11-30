<%-- 
    Document   : HistorialFac
    Created on : 30-nov-2016, 3:49:13
    Author     : macaco
--%>
<%@page import="co.ufps.edu.dto.factura"%>
<%@page import="co.ufps.edu.dto.Servicios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
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
      <link type="text/css" rel="stylesheet" href="material/css/materialize.css"  media="screen,projection"/>

        
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        
        

        
        
        
        
        
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
				<h1>Historial Facturas</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Facturas</div>
                                        
        
            
     
        
					<div class="panel-body">
						<div class="col-md-6">
                                                    <form  method="GET" action="HistorialFac.jsp" >
							<form role="form">
							
								<div class="form-group">
									<label for="numcuarto"><FONT SIZE=5>Digite el # de Cedula</FONT></label>
									<input class="form-control" id="numcuarto"  name="cc">
                                                                        
                                                                        
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
       List<Huesped> hue=c.listarUsuariopor(bus);
        
        
         
         if(hue!=null){
             ArrayList<factura>fac=c.facporhuesped(hue.get(0).getCc());
        %>
       
        <table class="table">
    <thead>
        <tr>
            <th>id</th>
            <th>Total</th>
              <th>Link</th>
          
        </tr>
    </thead>
    <tbody>
         
       
     
       
       
       <%for(factura s:fac){%>
      
        <tr>
   
            <td><%=s.getId()%></td>
            
             <td><%=s.getTotal()%></td>
             <td><a href="pdfgen.jsp?id_factura=<%=s.getId()%>" class="btn btn-success btn-lg">Ver pdf</a></td>
            
            
            
        </tr>
    
      <%}%>
    </tbody>
</table>
        
        
        <%
        
        
         }else{
        
        
        %>			
								
        <p>opps este huesped no existe </p>	
        
        <%
         }        
 
 }%>
								
		 <br>
        <br>
        <br>						
								
							</div>
        
        
        
        <br>
        <br>
        <br>
        
        <div class="col-md-12" id="respuesta-ej5" style="display: none;" >
            
            
            <form  method="GET" action="HistorialFac.jsp" >
							<form role="form">
							
								<div class="form-group">
									<label>Digite el numero de Cedula</label>
									<input class="form-control" placeholder="Cedula" name="cc">
								</div>
																
								<div class="form-group">
                                                                    
									
								<button type="submit" class="btn btn-primary">Buscar</button>
                                                                 
								
								</div>
								 </form>
</div>

</br>


        </form>
        </div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->
        <%}
 else{
     response.sendRedirect("login.jsp"); 
 }
%>

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
            $(this).text('Buscar Por cuarto');
            e.preventDefault();
        }
  
    );
  
});



</script>
</body>
</html>

