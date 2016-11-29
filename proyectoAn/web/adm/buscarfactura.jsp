<%-- 
    Document   : buscarfactura
    Created on : 27/11/2016, 08:09:52 PM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
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
        <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>


        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" /> 

    </head>

    <body onload="index();" Style="background-color: white">
        <jsp:include page="menuadm.jsp"></jsp:include>

        <%
            ControladorNegocio c4 = new ControladorNegocio();
            empleado emp = (empleado) session.getAttribute("EmpleadoLogin");
            //if (emp != null && emp.getCargo() == 1) {
            if (true) {
        %>

        <label Style="color: #000"> Seleccione las fechas en las cuales desea ver las facturas </label>
        <input type='text' name="daterange" id="fechas" class="form-control text-center  " />
        <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
        <button class="btn btn-warning btn-md pull-right " Style="background-color: #e98e4c;font-size: medium " onclick="muestraMensaje()">consultar</button>


        <script>
            function muestraMensaje() {

                var fechas = document.getElementById('fechas').value;
                alert(fechas);

                var msg = "";

                if (fechas.length == 0) {
                    alert("error, no selecciono fecha");
                } else {
                    var f = fechas.split(" - ");
                    var fechaIni = f[0];
                    var fechaFin = f[1];
                    alert("test");
                    var xhttp = new XMLHttpRequest();
                    
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState == 4 && xhttp.status == 200) {
                            if (xhttp.responseText.indexOf('error') > -1) {
                                
                                alert("error");
                            } else {
                                 var info = xhttp.responseText.toString();
                                msg=info;
                                 document.getElementById('mesanjeDisponibilidad').innerHTML = msg;
                            }
                        }
                    };
                       
                    var url = "buscarfacturas.jsp?fechaIni=" + fechaIni
                            + "&fechaFin=" + fechaFin;
                    xhttp.open("post", url, true);
                    xhttp.send();
                }
            }
        </script>
    </script>

    <script type="text/javascript">
        var hoy = new Date();

        var dd = hoy.getDate();
        var mm = hoy.getMonth() + 1; //hoy es 0!
        var yyyy = hoy.getFullYear();

        if (dd < 10) {
            dd = '0' + dd;
        }

        if (mm < 10) {
            mm = '0' + mm;
        }

        hoy = mm + '-' + dd + '-' + yyyy;

        $('input[name="daterange"]').daterangepicker({
            "autoApply": true,
            "startDate": hoy,
            "endDate": hoy,
            "maxDate": hoy
        }, function (startDate, endDate, label) {
            // alert(startDate.format('YYYY-MM-DD'));

        });
        //$(function() {
        //$('input[name="daterange"]').daterangepicker({
        //  minDate:"0",
        // locale: {
        //     format: 'MM/DD/YYYY'
        // }
        //  });
        //});
    </script>
    <div id="mesanjeDisponibilidad" class="col-ms-12">
       
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

<% } else {

        response.sendRedirect("../login.jsp");
    }
%>

</html>
