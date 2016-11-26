<%-- 
    Document   : menuadm
    Created on : 28/05/2016, 10:25:23 AM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<head>
    <link href="css/font-awesome.css" rel="stylesheet">

</head>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse" >
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Hotel</span>Admin</a>
				<ul class="user-menu">
                                    
                                    
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Salir <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							
							<li><a href="../logut.jsp"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
                                                        
                                                         
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>

            
<div class="btn-group col-md-14 " style="background: #e98e4c;">
  <a class="btn btn-deep-orange col-md-11" href="#"><i class="fa fa-database fa-lg"></i> Administrar Base de datos</a>
  <a class="btn btn-deep-orange dropdown-toggle col-md-1 " data-toggle="dropdown" href="#" style="background: #e98e4c;">
    <span class="fa fa-caret-down" title="Toggle dropdown menu"></span>
  </a>
  <ul class="dropdown-menu col-md-13">
    <li><a href="Datos_hotel.jsp"><i class="fa fa-building-o fa-lg"></i> Datos del hotel</a></li>
    <li><a href="Datos_servicios.jsp"><i class="fa fa-life-ring fa-lg"></i> Servicios del hotel</a></li>
    <li class="divider"></li>
    <li><a href="Datos_tipo_habitacion.jsp"><i class="fa fa-key fa-lg"></i> Tipos de habitaciones</a></li>
    <li><a href="Datos_propiedadesHab.jsp"><i class="fa fa-television fa-lg"></i> Detalles fisicas de la habitacion</a></li>
    <li><a href="Datos_propiedadesTipoHab.jsp"><i class="fa fa-check-square-o fa-lg"></i> Caracteristicas habitacion</a></li>
    <li><a href="Estado_habitacion.jsp"><i class="fa fa-cogs fa-lg"></i> Tipos de estado de habitacion</a></li>
    <li><a href="Datos_habitacion.jsp"><i class="fa fa-bed fa-lg "></i>Habitacion</a></li>
    <li class="divider"></li>
    <li><a href="Estado_reserva.jsp"><i class="fa fa-cog fa-lg"></i> Tipos de estado reserva</a></li>
    <li><a href="datos_cargo.jsp"><i class="fa fa-street-view fa-lg"></i> Tipos de cargos de empleados</a></li>
    <li><a href="Datos_empleado.jsp"><i class="fa fa-user-plus fa-lg "></i> Empleados</a></li>
    <li><a href="datos_asignacion_aseo.jsp"><i class="fa fa-clipboard fa-lg"></i> Asignacion liempieza</a></li>
    <li class="divider"></li>
    <li><a href="Datos_Huesped.jsp"><i class="fa fa-users fa-lg"></i> Huesped</a></li>
  
		</ul>
  <br>
  <br>
  
	</div><!--/.sidebar-->
	
</div>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">		
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Icons</li>
			</ol>
		</div><!--/.row-->
                
