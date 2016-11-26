<%-- 
    Document   : eliminar
    Created on : 13/05/2016, 09:37:35 PM
    Author     : EDINSON
--%>

   <%@page import="co.ufps.edu.dao.HuespedDAO"%>
<%@page import="co.ufps.edu.dao.limpiezaDAO"%>
<%@page import="co.ufps.edu.dao.servicioDAO"%>
<%@page import="co.ufps.edu.dao.cargo_emp_DAO"%>
<%@page import="co.ufps.edu.dao.empleadoDAO"%>
<%@page import="co.ufps.edu.dao.estado_reservaDAO"%>
<%@page import="co.ufps.edu.dao.estado_habDAO"%>
<%@page import="co.ufps.edu.dao.propiedadeshabDAO"%>
<%@page import="co.ufps.edu.dao.tipohabitaciondao"%>
<%@page import="co.ufps.edu.dao.daohabitaciones"%>
<!DOCTYPE>
<html>
    <head>
   
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>R</title>

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
   <% String Param1= request.getParameter ("id");
        String Param2= request.getParameter ("tabla");
        System.out.println(Param1+" de la tabla   eliminar"+Param2);
      
       switch (Param2){
 
        case "habitaciones": daohabitaciones h= new daohabitaciones();
                               h.eliminar(Integer.parseInt(Param1));
                               response.sendRedirect("Datos_habitacion.jsp");
                               break;
        case "tiposhab": tipohabitaciondao t= new tipohabitaciondao();
                            t.eliminar(Integer.parseInt(Param1));
                            response.sendRedirect("Datos_tipo_habitacion.jsp");
                            break;
        case "prophab": propiedadeshabDAO p= new propiedadeshabDAO();
                        p.eliminar(Integer.parseInt(Param1));
                        response.sendRedirect("Datos_propiedadesHab.jsp");
                        break;
                        
        case  "estadohab" :estado_habDAO e= new estado_habDAO();
                            e.eliminar(Integer.parseInt(Param1));
                            response.sendRedirect("Estado_habitacion.jsp");
                        break;
        case "estadoreserva":
                            estado_reservaDAO er= new estado_reservaDAO();
                            er.eliminar(Integer.parseInt(Param1));
                            response.sendRedirect("Estado_reserva.jsp");
                           break;
                           
        case "empleado":  empleadoDAO em=new empleadoDAO();
                          em.eliminar(Integer.parseInt(Param1));
                          response.sendRedirect("Datos_empleado.jsp");
                          break;
                          
        case "cargo": cargo_emp_DAO ca=new cargo_emp_DAO();
                      ca.eliminar(Integer.parseInt(Param1));
                      response.sendRedirect("datos_cargo.jsp");
                      break;
        case "servicio": servicioDAO se=new servicioDAO();
                         se.eliminar(Integer.parseInt(Param1));
                         response.sendRedirect("Datos_servicios.jsp");
                         break;
        case "aseo": limpiezaDAO li=new limpiezaDAO();
                    String Param3= request.getParameter ("id_hab");              
                    li.eliminar(Integer.parseInt(Param1), Integer.parseInt(Param3));
                    response.sendRedirect("datos_asignacion_aseo.jsp");
                    break;
                    
        case "huesped": HuespedDAO hues=new HuespedDAO();
                    
                         hues.eliminar(Integer.parseInt(Param1));
                         response.sendRedirect("Datos_Huesped.jsp");;
                    break;
        default:
     
        break;
 
 }
 %>
</body>

</html>




