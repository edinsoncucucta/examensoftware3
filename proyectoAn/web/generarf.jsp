<%-- 
    Document   : generarf
    Created on : 20-may-2016, 7:27:41
    Author     : macaco
--%>

<%@page import="co.ufps.edu.dto.Servicios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.ufps.edu.dto.Huesped"%>
<%@page import="co.ufps.edu.dto.empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="co.ufps.edu.dto.TipoHabitacion"%>
<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="co.ufps.edu.dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="co.ufps.edu.dto.factura"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="co.ufps.edu.dto.Cliente"%>
<%@page import="co.ufps.edu.dto.Reserva"%>
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
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">




<!--Icons-->
<script src="js/lumino.glyphs.js"></script>


        <title>Facturar</title>
        
        <script>
            function demoFromHTML() {
                var pdf = new jsPDF('p', 'pt', 'letter');
                // source can be HTML-formatted string, or a reference
                // to an actual DOM element from which the text will be scraped.
                source = $('#content23')[0];

                // we support special element handlers. Register them with jQuery-style 
                // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                // There is no support for any other type of selectors 
                // (class, of compound) at this time.
                specialElementHandlers = {
                    // element with id of "bypass" - jQuery style selector
                    '#bypassme': function (element, renderer) {
                        // true = "handled elsewhere, bypass text extraction"
                        return true
                    }
                };
                margins = {
                    top: 80,
                    bottom: 60,
                    left: 40,
                    width: 522
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(
                        source, // HTML string or DOM elem ref.
                        margins.left, // x coord
                        margins.top, {// y coord
                            'width': margins.width, // max width of content on PDF
                            'elementHandlers': specialElementHandlers
                        },
                function (dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save('Test.pdf');
                }, margins);
            }
        </script>
    </head>
    
      <jsp:include page="menu.jsp" />
     
    
        
    
    <body>
     
     
       
       <%
           int id=0;
           try{
           id=Integer.parseInt(request.getParameter("genreservaid"));
       }catch(Exception e){
           response.sendRedirect("cuartos.jsp");
       }
       ControladorNegocio n= new ControladorNegocio();
       
        empleado emp=(empleado)session.getAttribute("EmpleadoLogin");
       Reserva reserva=n.buscarReservapor(id);
          Calendar fecha= new GregorianCalendar();
          fecha=Calendar.getInstance();
          
          //reserva finalizada
          reserva.setFechafin(fecha);
          
          
          factura f = new factura();
          
          
          f.setFechagenerada(fecha);
          f.setIdReserva(reserva.getId());
          f.setId_hab(reserva.getId_hab());
          f.setId_huesped(reserva.getId_cliente());
         
          
        
       
       Cliente c= n.ListarClientePorid(reserva.getId_cliente());
       
       
       
       List<Item>itemspedidos=n.listaritempo(reserva.getId());
       habitaciones ha=n.buscarh(reserva.getId_hab());
       TipoHabitacion tipoh=n.consultarTipoh(ha.getTipo());
       
       f.total(itemspedidos, tipoh, reserva.getFechainicio(), fecha);
       
       ha.setEstado(2);//disponible
       n.updateestadohabi(ha);
       
       //finalizada
       
       reserva.setEstado(3);
       n.updateReserva(reserva);
       
       String concatena="";
       
       for(Item i:itemspedidos){
           concatena+="Servicio :   "+i.getId()+"  precio :"+i.getPrecio()+"\n";
       }
       f.setServicios(concatena);
       factura creada=n.createfactura(f);
       
       factura rae=n.consultarfacpor(reserva.getId());
       
       Huesped huesof=n.huespedoffactura(rae.getId());
       habitaciones habi = n.habitacionoffactura(rae.getId());
       
       
       
       SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
       
       %>
       
     
       
           
           
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Facturar</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Cliente</div>
					<div class="panel-body">
                                          
						<table data-toggle="table">
						    <thead>
						    <tr>
						        <th data-field="ID" data-checkbox="true" > ID</th>
						        <th data-field="Nombres" data-sortable="true">NOMBRE</th>
						        <th data-field="Apellidos"  data-sortable="true">APELLIDOS</th>
						        <th data-field="Direecion" data-sortable="true">DIRECCION</th>
                                                        <th data-field="Pasaporte" data-sortable="true">PASAPORTE</th>
                                                          
						    </tr>
						    </thead>
                                                    
                                                     <tbody>
     
        <tr>
            <td><%=huesof.getIdcliente()%></td>
            <td><%=huesof.getNombre()%></td>
            <td><%=huesof.getApellidos()%></td>
            <td><%=huesof.getDir()%></td>
            <td><%=huesof.getPasaporte()%></td>
        </tr>
    
       
    </tbody>
						</table>
                                                </di>
					
				</div>
			</div>
                            
                          
                              
		</div><!--/.row-->	
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">Servicios Al cuarto</div>
					<div class="panel-body">
						<table data-toggle="table" >
						    <thead>
						    <tr>
						        
						        <th data-field="id">  ID</th>
                                                         <th data-field="id">  Descripcion</th>
                                                         <th data-field="id">  Precio</th>
                                                        
                                                     
						    </tr>
						    </thead>
                                                    
                                                    
                                                                              
                                                     <tbody>
                                                         <%if(itemspedidos.size()==0){
                
            %>
     
        <tr>
            
           <td>no pidio nada</td>  
          
      
        </tr>
          <%}else{
                
            ArrayList<Servicios>ser=n.serviciosporreserva(reserva.getId());
for(Servicios s:ser){
    
          
%>
    
        <tr>
            
           <td><%=s.getId()%></td>  
            <td><%=s.getNombre()%></td>  
             <td><%=s.getPrecio()%></td> 
          
      
        </tr>
        
        <%}
                                                         }%>
    </tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">Infrmacion de la reserva</div>
					<div class="panel-body">
						<table data-toggle="table" id="table-style"  data-row-style="rowStyle">
						    <thead>
						    <tr>
						        <th data-field="id" data-align="right" >Fecha Llegada</th>
						        <th data-field="name" >Fecha salida</th>
                                                         <th data-field="pago" >Total a pagar</th>
						       
						    </tr>
						    </thead>
                                                                                   <tbody>
                                                                                       <tr>
                                                                                           
                                                                                         <td><%=sdf.format(reserva.getFechainicio().getTime())%></td>  
            <td><%=sdf.format(reserva.getFechafin().getTime())%></td>   
            <td><%=creada.getTotal()%></td> 
                                                                                       </tr>
  
    
       
    </tbody>
		
                                                    
						</table>
                                                    
                                                      <%
                                ControladorNegocio n2 = new ControladorNegocio();
                                
                                factura  fac=n2.consultarfacpor(creada.getIdReserva());
                                %>
                                
			<div class="panel-body">
                            <form method="POST" action="pdfgen.jsp">
                                  <input type="hidden" name="id_factura" value="<%=fac.getId()%>">
                                  <input type="submit" value="IMPRIMIR" class="btn btn-info" min="0"/>
                            </form>
                                               
					</div>
						
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
	</div><!--/.main-->
        
        
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
 <script src="js/jquery-2.1.4.min.js"></script>
 
 
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="material/js/materialize.min.js"></script>
        
    </body>
</html>

    
