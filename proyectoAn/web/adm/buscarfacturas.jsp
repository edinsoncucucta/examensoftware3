<%-- 
    Document   : buscarfacturas
    Created on : 27/11/2016, 09:19:41 PM
    Author     : EDINSON
--%>


<%@page import="javax.swing.JOptionPane"%>
<%@page import="co.ufps.edu.dao.facturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    String fechaIni = request.getParameter("fechaIni").toString();
    String fechaFin = request.getParameter("fechaFin").toString();
    System.out.print("fecha hp" + fechaIni);
    
    String []vFechaIni= fechaIni.split("/");
    String []vFechafin= fechaFin.split("/");
    String inicio=vFechaIni[2]+"-"+vFechaIni[0]+"-"+vFechaIni[1];
    String fin=vFechafin[2]+"-"+vFechafin[0]+"-"+vFechafin[1];
    
    
    facturaDAO hb=new facturaDAO();
    String rta = hb.BuscarFacturas(inicio, fin);
    
    out.print(rta);
%>
