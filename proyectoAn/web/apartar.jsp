<%-- 
    Document   : apartar
    Created on : 20-may-2016, 7:48:06
    Author     : macaco
--%>

<%@page import="java.util.List"%>
<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="facade.ControladorNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <%ControladorNegocio c = new ControladorNegocio();
        
        List<habitaciones> h = c.listarh();
        %>
        <div class="row">
			<div class="col-xs-12 col-md-6 col-lg-4">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
                                                    <svg class="glyph stroked bag"><svg class="glyph stroked tag"><use xlink:href="#stroked-tag"/></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">5</div>
							<div class="text-muted">Consulta Habitaciones disponibles</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xs-12 col-md-6 col-lg-4">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large"></div>
							<div class="text-muted">Consulta Huespedes</div>
						</div>
					</div>
				</div>
			</div>
			
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Formulario de  Apartado</div>
					<div class="panel-body">
						<form class="form-horizontal" action="" method="post">
							<fieldset>
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Nombre</label>
									<div class="col-md-9">
									<input id="name" name="name" type="text" placeholder="Nombre" class="form-control">
									</div>
								</div>
                                                                <!-- cedula input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="identificacion">Identificacion</label>
									<div class="col-md-9">
										<input id="iden" name="iden" type="text" placeholder="Identificacion" class="form-control">
									</div>
								</div>
                                                                <!-- Telefono input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="telefono">Telefono</label>
									<div class="col-md-9">
										<input id="tel" name="tel" type="number" placeholder="Telefono" class="form-control">
									</div>
								</div>
							
								<!-- Email input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="email">E-mail</label>
									<div class="col-md-9">
										<input id="email" name="email" type="email" placeholder="email" class="form-control">
									</div>
								</div>
                                                                <!-- Dias de hospedaje input-->
								<div class="form-group">
									<label class="col-xs-3 control-label" for="dias">Cantidad de dias</label>
									<div class="col-md-9">
										<input id="tel" name="dias" type="number" placeholder="Dias" class="form-control">
									</div>
								</div>
                                                                <!-- Calendario -->
                                                                <div class="panel panel-red">
                                                                    <div class="panel-heading dark-overlay "><svg class="glyph stroked calendar "></svg>Fecha a apartar</div>
                                                                    <div class="panel-body">
                                                                            <div id="calendar"></div>
                                                                    </div>
                                                            </div>
                                                                <!-- Tipo de Habitacion -->
                                                            <div class="form-group">
									<label class="col-md-3 control-label" for="tipo">Seleccione el tipo de Habitacion</label>
									<div class="col-md-9">
									<div class="btn-group">
  <button type="button" class="btn btn-danger">Habitaciones</button>
 
  <button type="button" class="btn btn-danger dropdown-toggle"
          data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Desplegar menú</span>

  </button>
 
  <ul class="dropdown-menu" role="menu">
      <%for(habitaciones h1:h){%>
    <li><a href="#"><%=h1.getId()%></a></li>
    <%}%>
  </ul>
</div>	
									</div>
								</div>
								
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">Observaciones</label>
									<div class="col-md-9">
										<textarea class="form-control" id="message" name="message" placeholder="Observaciones..." rows="5"></textarea>
									</div>
								</div>
                                                                    
                                                                
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right btn btn-danger">
										<button type="submit" class="btn btn-info btn-md pull-right">Guardar</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				
				
			</div><!--/.col-->
			
			<div class="col-md-4">
			
				
				
				
								
			</div><!--/.col-->
		</div><!--/.row-->
	</div>	<!--/.main-->
		  

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		$('#calendar').datepicker({
		});

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
    </body>
</html>
