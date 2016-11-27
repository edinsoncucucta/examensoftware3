<%-- 
    Document   : disponibilidadHabitacion
    Created on : 26/11/2016, 10:09:51 PM
    Author     : EDINSON
--%>

<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="co.ufps.edu.dao.daohabitaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idHabitacion = request.getParameter("idHabitacion").toString();
    String fechaIni = request.getParameter("fechaIni").toString();
    String fechaFin = request.getParameter("fechaFin").toString();
    String []vFechaIni= fechaIni.split("/");
    String []vFechafin= fechaFin.split("/");
    String inicio=vFechaIni[2]+"-"+vFechaIni[0]+"-"+vFechaIni[1];
    String fin=vFechafin[2]+"-"+vFechafin[0]+"-"+vFechafin[1];
    
    
    daohabitaciones hb=new daohabitaciones();
    String rta = hb.ConsultarDisponibilidad(idHabitacion, inicio, fin);
    
    out.print(rta);
%>
