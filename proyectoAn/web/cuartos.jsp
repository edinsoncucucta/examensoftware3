<%-- 
    Document   : cuartos
    Created on : 15-may-2016, 10:24:28
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.TipoHabitacion"%>
<%@page import="co.ufps.edu.dto.Reserva"%>
<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.ufps.edu.dto.cuarto"%>
<%@page import="facade.ControladorNegocio"%>
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
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>
        <title>Cuartos</title>
    </head>
    
<body>
   
	
				
		<%

 empleado emp=(empleado)session.getAttribute("EmpleadoLogin");
 if(emp!=null){
 
 %>
 
 <jsp:include page="menu.jsp" />
		<div class="row">
			<div class="col-lg-12">
                            
                            
                            
                            
                                                            
                            
                            
                            
				<div class="panel panel-default">
					<div class="panel-heading">
						
					</div>
                                     <form action="verinfo.jsp" method="POST">
					<div class="panel-body">
                                           
                      
						<div class="icon-grid">
                                                    
                                                    
                                                    
                                                    
                                                     <% 
        ControladorNegocio c= new ControladorNegocio();
  List<habitaciones> habitaciones=c.listarh();
   
   
    
    %>
    
   
    
                                                    <%for(habitaciones c1:habitaciones){
                                                        
                                                        
                                                    %>
                                                    
							 <div class="col s12 m4">
               
          <div class="card">
            <div class="card-image">
              <img  src="<%=c1.getFoto()%>">
              <span class="card-title">Cuarto <%=c1.getId()%></span>
            </div>
            <div class="card-content">
                
                               

              <p><p> <%=c1.getObservacion()%></p>.</p>
            </div>
            <div class="card-action">
           <button type="submit" class="btn btn-success btn-lg">ver info</button>
                                                     
                                                           <p><input type="hidden"  name="id" value="<%=c1.getId()%>"></p>
            </div>
          </div>
        	
            
           
            
            
                                                         
                                                         </div>
            
            
            
                                                        
                                                        
                                                        
                                                        
                                                        
							  

							<%}%>
                                                        
                                                        
                                                        
						</div>

					</div>
                                                </form>
					<nav>
  <ul class="pagination pagination-lg">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

				</div>

			</div>

		</div><!--/.row-->		
		
		
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
        
        <%}
 else{
     response.sendRedirect("login.jsp"); 
 }
%>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="material/js/materialize.min.js"></script>
</body>
</html>
