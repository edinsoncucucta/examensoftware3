<%-- 
    Document   : verinfo
    Created on : 15-may-2016, 12:16:50
    Author     : macaco
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="co.ufps.edu.dto.EstadoHabitacion"%>
<%@page import="co.ufps.edu.dto.TipoHabitacion"%>
<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="co.ufps.edu.dto.cuarto"%>
<%@page import="facade.ControladorNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
         <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="material/css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

        <title>Informacion</title>
        
    </head>
    <body>
        
        <%
            int id=0;
        try{
            id=Integer.parseInt(request.getParameter("id"));
            
        }catch(NumberFormatException e){
            
        
        response.sendRedirect("cuartos.jsp"); 
        }catch(Exception e){
             response.sendRedirect("cuartos.jsp"); 
        }
        
        
        
        ControladorNegocio c= new ControladorNegocio();
        habitaciones h=null;
        try{
                 h  = c.buscarh(id);
        }catch(Exception e){
             response.sendRedirect("cuartos.jsp"); 
        }

       
       if(h!=null){
               
       
           
      session.setAttribute("habitacion",h);
       
       TipoHabitacion tipo=c.consultarTipoh(h.getTipo());
       
       EstadoHabitacion estado=c.consultarEstadoHabitacion(h.getEstado());
       
       
       
      String fechainicio=request.getParameter("fechainicio");
      String fechafinaliza=request.getParameter("fechafin");
      
      SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
       Calendar calendar = Calendar.getInstance();
       
        %>
        
       
        
        
     <jsp:include page="menu.jsp" />
				
<!--/.row-->		
		
		
<div class="row">
    
    
    
    		<div class="col-md-3 col-md-offset-3">
				<h2>Cuarto  <%=h.getId()%></h2>
                                
			</div>
      
</div>
	
			
			
			<div class="col-lg-12">
				
                                      
                                                
                                                
                                                 <div class="card">
            <div class="card-image">
              <img  src="<%=h.getFoto()%>">
              <span class="card-title">Cuarto <%=h.getId()%></span>
              
            </div>
            <div class="card-content">
                
                               

              <p><p> <%=h.getObservacion()%></p>.</p>
            </div>
            <div class="card-action">
                                <form action="buscar.jsp" method="POST">
			<div class="panel-body">
                             <input type="hidden" name="idcuartoselecionado" value="<%=h.getId()%>">
						<button type="submit" class="btn btn-success btn-lg col-md-3 col-md-offset-3">Reservar</button>
                                                              <a class="col-md-3 col-md-offset-3 btn-floating btn-large waves-effect waves-light red" data-toggle="modal" data-target="#myModal"><i class="material-icons">add</i></a>
					</div>
                 </form>
                                                                        
                                
                          
               

           
                             
            </div>
                                                
              
                                                
                                                
                                                
                                                
                                                
                                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    
     <div class="modal-dialog" role="document">
         <h1>Mas imagenes del cuarto</h1>
         
         <img class="materialboxed" data-caption="A picture of some deer and tons of trees" width="250" src="<%=h.getFoto()%>" width="100" height="200">
      
         
         
         
         
     
         <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
         </div>
      
   
    <!-- /.modal-content -->
  </div><!-- /.modal-dialog -->                               
                                                    
                                                </div>
                                                
                                                
                                                
                                                
          </div>
                                                
                                                		<div class="center-block">
                            <ul class="collapsible popout" data-collapsible="accordion">
    <li>
      <div class="collapsible-header center-block"><h3>Servicios</h3></div>
      <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
    </li>
   
  </ul>
      </div>
                                                
				</div>
			

		
			
		<!-- /.row -->
			
		
		
		
		
		
		
			
		
			
			
                  
			
	
                            <!--/.panel-->
			<!-- /.col-->
			
		<!-- /.row -->
		
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
        
      
        
    <%}%>   
</body>	
    </body>
</html>
