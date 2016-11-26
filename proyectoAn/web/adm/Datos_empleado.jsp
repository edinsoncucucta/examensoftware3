<%-- 
    Document   : Datos_hotel
    Created on : 4/05/2016, 06:45:15 AM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="co.ufps.edu.dao.empleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DATOS DEL HOTEL</title>

        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css.map" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.css.map" rel="stylesheet">
        <link href="css/mdb.css" rel="stylesheet">
        <link href="css/bootstrap-material-design.css" rel="stylesheet">
        <link href="css/bootstrap-material-design.min.css.map" rel="stylesheet">
        <link href="css/ripples.css" rel="stylesheet">
        <link href="css/ripples.css.map" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <!--<link rel="stylesheet" type="text/css" href="css/ripples.min.css">-->
        <link rel="stylesheet" type="text/css" href="js/toastr.css">
        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>

        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>

    <body onload="index();">
          <jsp:include page="menuadm.jsp"></jsp:include>
            	<%
  ControladorNegocio c4 =  new ControladorNegocio();
 empleado emp=(empleado)session.getAttribute("EmpleadoLogin");
 //if(emp!=null&&emp.getCargo()==1){
 if(true){
 %>
 
 <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Datos del empleado</h1>
			</div>
		</div><!--/.row-->
									
	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Formulario datos del empleado</div>
					<div class="panel-body">
                                          
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Nombre del empleado</label>
									<div class="col-md-10">
									<input id="name" name="name" type="text" placeholder="Nombre" size="1" maxlength="100" class="form-control" required>
									</div>
								</div>
                                                               <br>
                                                               <br>
                                                                <!-- apellido input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="apell">Apellido del empleado</label>
									<div class="col-md-10">
									<input id="apell" name="apell" type="text" placeholder="Apellidos" size="1" maxlength="100" class="form-control" required>
									</div>
								</div>
                                                                <br>
                                                                <br>
                                                                <!-- cedula input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="cedula">Documento de identificacion</label>
									<div class="col-md-10">
										<input id="cedula" name="cedula" type="number"  class="form-control" required>
									</div>
								</div>
                                                                <br>
                                                                <br>
                                                                
                                                                  <!-- contraseña input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="contr">Contraseña del usuario</label>
									<div class="col-md-10">
									<input id="cont" name="contr" type="text" placeholder="contraseña 8 caracteres" size="8" maxlength="100" class="form-control" required>
									</div>
								</div>
                                                                  <br>
                                                                  <br>
                                                                
                                                                  <!-- direccion email input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="email">Email</label>
									<div class="col-md-10">
										<input id="email" name="email" type="text" placeholder="ejemplo@ejm.com" size="30" maxlength="100" class="form-control">
									</div>
								</div>
                                                                  <br>
                                                                  <br>
							
                                                                <!-- Telefono input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="telefono">Telefono</label>
									<div class="col-md-10">
										<input id="tel" name="tel" type="number" value="0" class="form-control" required>
									</div>
								</div>
								<br>
                                                                <br>
                                                                <!-- tipo  input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="cargo">Cargo del empleado</label>
									<div class="col-md-10">
									 <select class="form-control" name="cargo" id="cargo">
                                                                        <option selected value="0"> Elige una opción </option>
                                                                        <%
                                                                        empleadoDAO em=new empleadoDAO();
                                                                        String m=em.cargos();
                                                                        out.println(m);
                                                                        %>
									</select>	
									</div>
								</div>
                                                                            <br>
                                                                            <br>
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right ">
                                                                            <button type="submit" class="btn btn-deep-orange btn-md pull-right" onclick="Ingresarempleado()">Guardar</button>
									</div>
								</div>
                                                     
					</div>
				</div>
				</div>	
									</div>
								
				
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header text-center">Listado empleados</h1>
			</div>
		</div><!--/.row-->
		<div class="col-md-12">
                                              <%
            empleadoDAO h=new empleadoDAO();
           out.print(h.todosempleados());
            %>
                </div>
			

	
        
 <script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/tether.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/material.js" type="text/javascript"></script>
        <script src="js/materialize.js" type="text/javascript"></script>

        <!--<script src="js/chart.min.js"></script>
        <script src="js/chart-data.js"></script>
        <script src="js/easypiechart.js"></script>
        <script src="js/easypiechart-data.js"></script>
       
        <!--<script src="js/material.js"></script>??????-->
        <script src="js/ripples.js" type="text/javascript"></script>
        <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
        <script>function index() {
            $.material.init();
        }</script>

        <script>


            $(window).on('resize', function () {
                if ($(window).width() > 768)
                    $('#sidebar-collapse').collapse('show')
            })
            $(window).on('resize', function () {
                if ($(window).width() <= 767)
                    $('#sidebar-collapse').collapse('hide')
            })
        </script>	
    </body>

    <%} else {

            response.sendRedirect("../login.jsp");
        }
    %>

</html>


