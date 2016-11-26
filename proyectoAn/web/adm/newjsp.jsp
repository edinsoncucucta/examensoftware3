<%-- 
    Document   : Datos_hotel
    Created on : 4/05/2016, 06:45:15 AM
    Author     : EDINSON
--%>


<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="co.ufps.edu.dao.cargo_emp_DAO"%>
<%@page import="co.ufps.edu.dao.estado_habDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
   
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CARGOS</title>

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

<body>
		<jsp:include page="menuadm.jsp"></jsp:include>
                
                             	<%
  ControladorNegocio c4 = new ControladorNegocio();
 empleado emp=(empleado)session.getAttribute("EmpleadoLogin");
 //if(emp!=null){
  if(true){
 %>
									
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header text-center">Cargos del empleado</h1>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Formulario datos estados de la habitacion</div>
					<div class="panel-body">
						
							
								<!-- foto input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Nombre del cargo</label>
									<div class="col-md-10">
                                                                            <input id="name" name="name" type="text"  class="form-control" required="">
									</div>
								</div>
                                                                <br>
                                                                <br>
 	
									
								
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
                                                                            <button onclick="cargoempleado()" class="btn btn-deep-orange btn-md pull-right">Guardar</button>
									</div>
								</div>
							
                                            </div>
                                        </div>         
                                    </div>
                                </div>    
                                            <div class="row">
			<div class="col-md-12">
				<h1 class="page-header text-center">Listado de cargos</h1>
			</div>
		</div><!--/.row-->
		<div class="col-md-12">
                                              <%
           cargo_emp_DAO  h=new cargo_emp_DAO();
           out.print(h.cargos());
            %>
                </div>
					
				
        
  		       <%}
 else{
     response.sendRedirect("../login.jsp"); 
 }
%>
		  

	 <script src="js/jquery-2.1.4.min.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/tether.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/material.js"></script>
        <!--<script src="js/materialize.js"></script>

        <script src="js/chart.min.js"></script>
        <script src="js/chart-data.js"></script>
        <script src="js/easypiechart.js"34></script>
        <script src="js/easypiechart-data.js"></script>
       
        <!--<script src="js/material.js"></script>??????-->
        <script src="js/ripples.js"></script>
         <script src="js/bootstrap-datepicker.js"></script>
        <script>function index() {
           $.material.init();
        }</script>
        <script src="js/ajax8.js"></script>
        <script src="js/blockUI.js"></script>
        <script src="js/toastr.js"></script>
	<script>
		

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>

