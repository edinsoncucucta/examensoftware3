<%-- 
    Document   : fotoshab
    Created on : 29/11/2016, 10:45:43 PM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="co.ufps.edu.dao.daohabitaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>REGISTRO DE HABITACIONES</title>

        <%
            ControladorNegocio c4 = new ControladorNegocio();
            empleado emp = (empleado) session.getAttribute("EmpleadoLogin");
// if(emp!=null&&emp.getCargo()==1){
            if (true) {
        %>

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

    <body onload="index()">
        <jsp:include page="menuadm.jsp"></jsp:include>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header text-center">FOTOS DE LA HABITACION</h1>
                </div>
            </div><!--/.row-->


            <div class="row">
                <div class="c5ol-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Formulario Datos de la habitacion</div>
                        <div class="panel-body">
                                 <form name="formfotosHabitacion" id="formHabitacion" enctype="multipart/form-data" action="registrarfotos.jsp" method="post">
                            <!-- id input-->
                            
                            <!-- tipo input-->
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="tipo">ID de Habitacion</label>
                                <div class="col-md-10">
                                    <select class="form-control" name="idh" id="idh">
                                        <option selected value="0"> Elige una opción </option>
                                    <%
                                    daohabitaciones hab=new daohabitaciones();
                                    String m=hab.idHabitaciones();
                                    out.println(m);
                                    %>
                                </select>

                            </div>
                        </div>
                        <br>
                        <br>
                        
                        <!-- foto input-->
                        <div class="form-group">
                            <label class="col-md-2 control-label" for="foto">Direccion de la foto</label>
                            <div class="col-md-10">
                                <input id="foto" name="name" type="text"  class="form-control">
                                <input type="file" name="archivo" accept=".jpg" />
                            
                            </div>
                        </div>
                        <br>
 
                        <br>
                        <!-- Form actions -->
                        <div class="form-group">
                            <div class="col-md-12 widget-right ">
                                <button class="btn btn-deep-orange btn-md pull-right">Guardar</button>
                            </div>
                        </div>
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
        <script src="js/ajaxhab.js"></script>
        <script src="js/blockUI.js"></script>
        <script src="js/toastr.js"></script>
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

    <%}
else{
    response.sendRedirect("../login.jsp"); 
}
    %>

</html>

