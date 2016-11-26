<%-- 
    Document   : Datos_hotel
    Created on : 4/05/2016, 06:45:15 AM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="co.ufps.edu.dao.datoshoteldao"%>
<%@page import="co.ufps.edu.dto.principal"%>
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
            ControladorNegocio c4 = new ControladorNegocio();
            empleado emp = (empleado) session.getAttribute("EmpleadoLogin");
            //if (emp != null && emp.getCargo() == 1) {
            if (true) {
        %>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Datos del Hotel</h1>
            </div>
        </div><!--/.row-->
        <% datoshoteldao p = new datoshoteldao();
            String m = p.configurar();
            out.print(m);
            principal x = new principal();
            x = p.datos();

        %>


        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Formulario Datos del hotel</div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="registradoHotel.jsp" method="post">
                            <fieldset>

                                <!-- Name input-->
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="name">Nombre del hotel</label>
                                    <div class="col-md-10">
                                        <input id="name" name="name" class="form-control" type="text" placeholder="Nombre" class="form-control" value="<%out.print(x.getNombre()); %>"required>
                                    </div>
                                </div>

                                <!-- Slogan input-->
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="slogan">Slogan del hotel</label>
                                    <div class="col-md-10">
                                        <input id="slog" name="slog" class="form-control" type="text" placeholder="Slogan" class="form-control" value="<%out.print(x.getSlogan()); %>" required>
                                    </div>
                                </div>
                                <!-- direccion input-->
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="direccion">Dirección</label>
                                    <div class="col-md-10">
                                        <input id="iden" name="dir" class="form-control" type="text" placeholder="Dirección" class="form-control" value="<%out.print(x.getDir()); %>"required>
                                    </div>
                                </div>
                                <!-- Telefono input-->
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="telefono">Telefono</label>
                                    <div class="col-md-10">
                                        <input id="tel" name="tel" class="form-control" type="number"  class="form-control" value="<%out.print(x.getTel()); %>" max="99999999" required>
                                    </div>
                                </div>

                                <!-- celular input-->
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="cel">Celular</label>
                                    <div class="col-md-10">
                                        <input id="cel" name="cel" class="form-control" type="number" class="form-control"value="<%out.print(x.getCel()); %>" max="90000000000" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputmision" class="col-md-2 control-label">Mision</label>

                                    <div class="col-md-10">
                                        <input name="mision"  type="text" class="form-control" id="inputmision" placeholder="Mision del hotel" value="<%out.print(x.getMision()); %>">
                                    </div>
                                  
                                </div>
                 <div class="row">
   
        
      
                                <div class="form-group">
                                    <label for="inputvision" class="col-md-2 control-label">Vision</label>

                                    <div class="col-md-10">
                                        <input name="vision" type="Text" class="form-control" id="inputvision" placeholder="Vision del hotel" value="<%out.print(x.getVision()); %>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputcarac" class="col-md-2 control-label">Caracteristicas del hotel</label>

                                    <div class="col-md-10">
                                        <input name="carac" type="text" class="form-control" id="inputcarac" placeholder="Descripcion del hotel" value="<%out.print(x.getObj()); %>">
                                    </div>
                                </div>
                                <!-- Form actions -->
                                <div class="form-group">
                                    <div class="col-md-12 widget-right">
                                        <button type="submit" class="btn btn-deep-orange btn-md pull-right">Guardar</button>
                                    </div>
                                </div>

                            </fieldset>
                        </form>
                    </div>
                </div>

            </div>	
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
