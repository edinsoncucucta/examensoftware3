<%-- 
    Document   : buscar
    Created on : 09-may-2016, 15:05:14
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="java.util.List"%>
<%@page import="co.ufps.edu.dto.Huesped"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
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
				<h1 class="page-header">Buscar Huesped</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Huesped</div>
					<div class="panel-body">
						<div class="col-md-6">
                                                    <form  method="GET" action="buscar.jsp" >
							<form role="form">
							
								<div class="form-group">
									<label>Digite la cedula del huesped</label>
									<input class="form-control" placeholder="Cedula" name="cc">
								</div>
																
								<div class="form-group">
                                                                    
									
								<button type="submit" class="btn btn-deep-orange">Buscar</button>
                                                                 
								
								</div>
								 </form>
								
																
								
								
								
								
								
								
							</div>
							<div class="col-md-12">
							
								
					 <%String busqueda=request.getParameter("cc");
        if(busqueda!=null){
            
        
        %>
        
        <%//hay busqueda
        ControladorNegocio c= new ControladorNegocio();
        int bus=Integer.parseInt(busqueda);
        List<Huesped>huesd=c.listarUsuariopor(bus);
        %>
       
        <table class="table">
    <thead>
        <tr>
            <th>id</th>
            <th>cc</th>
            <th>Nombre</th>
            <th>Nacionalidad</th>
        </tr>
    </thead>
    <tbody>
         
       
     
       
       
       
       <%for(Huesped  h:huesd){
           
       %>
        <tr>
           
            <td><%=h.getIdcliente()%></td>
             <td><%=h.getCc()%></td>
            <td><%=h.getNombre()%>  </td>
            <td><%=h.getNacionalidad()%></td>
        </tr>
    <%}%>
      
    </tbody>
</table>
        
        
        <%}
        
        %>			
								
				
								
								
								
							</div>
        <div class="col-md-12">
            
            
               <form  action="registrado.jsp" method="post">

            <div>
                <p class="label label-primary"> cc: </p><input type="text" name="cc"  required>

            </div>
            <div>
                <p class="label label-primary"> Nombre: </p><input type="text" name="nombre" required >

            </div>
            <div><p class="label label-primary"> Nacionalidad: </p><input type="text" name="nacionalidad" required >
</div>
         <div><p class="label label-primary"> Procedencia </p><input type="text" name="procedencia" required >
</div> 
                   <input type="submit" value="Registrar" class="btn btn-deep-orange" min="0"/>
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