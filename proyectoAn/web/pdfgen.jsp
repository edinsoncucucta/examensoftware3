<%-- 
    Document   : index
    Created on : 23-nov-2016, 16:30:11
    Author     : macaco
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="co.ufps.edu.dto.factura"%>
<%@page import="co.ufps.edu.dto.propiedadeshab"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.ufps.edu.dto.Huesped"%>
<%@page import="co.ufps.edu.dto.habitaciones"%>
<%@page import="co.ufps.edu.dto.Reserva"%>
<%@page import="facade.ControladorNegocio"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.html.WebColors"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.*" %>
<%
    int id_factura=0 ;
    try{
         id_factura =Integer.parseInt(request.getParameter("id_factura"));
    }catch(Exception e){
        response.sendRedirect("login.jsp");
    }
   
    ControladorNegocio c = new ControladorNegocio();
    
    Reserva r=c.reservaoffactura(id_factura);
    habitaciones h=c.habitacionoffactura(id_factura);
    Huesped hue=c.huespedoffactura(id_factura);
    factura consultarf=c.consultarfac(id_factura);
    
    
     response.setContentType("application/pdf");
    
String relativeWebPath = "/";
String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
    FileOutputStream archivo = new FileOutputStream(absoluteDiskPath+"/123.pdf");
    System.out.println("user... " + System.getProperty("user.dir"));
    Image img = Image.getInstance(absoluteDiskPath+"/Logo.png");
    Document documento = new Document(PageSize.LETTER, 5, 5, 5, 5);
     PdfWriter.getInstance(documento, response.getOutputStream());

    /*Image logoUno = Image.getInstance("C:img/logo1.jpg");
     float scaler = ((documento.getPageSize().getWidth() - documento.leftMargin()
     - documento.rightMargin() - 0) / logoUno.getWidth()) * 20;
     logoUno.scalePercent(scaler);

    

     PdfPCell celdaImg = new PdfPCell(logoUno);
     celdaImg.setRowspan(1);
     celdaImg.setColspan(4);
     celdaImg.setHorizontalAlignment(Element.ALIGN_CENTER);
     celdaImg.setBorderColor(BaseColor.WHITE);
     tablaEncabezado.addCell(celdaImg);*/
    PdfWriter.getInstance(documento, archivo);
    documento.open();
    Paragraph salto = new Paragraph(new Phrase(Chunk.NEWLINE));
    documento.add(salto);

    //ENCABEZADO DEL DOCUMENTO
    PdfPTable tablaEncabezado = new PdfPTable(6);

    PdfPCell imagenUno = new PdfPCell(img);
    imagenUno.setColspan(1);
    imagenUno.setRowspan(4);
    imagenUno.setHorizontalAlignment(Element.ALIGN_CENTER);
    imagenUno.setBorderColor(BaseColor.WHITE);
    tablaEncabezado.addCell(imagenUno);

    PdfPCell titulo = new PdfPCell(new Paragraph("Hotel Proyecto de Software", FontFactory.getFont("arial", 14, Font.BOLD)));
    titulo.setColspan(4);
    titulo.setRowspan(1);
    titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
    titulo.setBorderColor(BaseColor.WHITE);
    tablaEncabezado.addCell(titulo);

    PdfPCell imagenDos = new PdfPCell(new Paragraph("Logo 2", FontFactory.getFont("arial", 16, Font.BOLD)));
    imagenDos.setColspan(1);
    imagenDos.setRowspan(4);
    imagenDos.setHorizontalAlignment(Element.ALIGN_CENTER);
    imagenDos.setBorderColor(BaseColor.WHITE);
    tablaEncabezado.addCell(imagenDos);

    PdfPCell eslogan = new PdfPCell(new Paragraph("Slogan del Hotel",
            FontFactory.getFont("arial", 10)));
    eslogan.setColspan(4);
    eslogan.setRowspan(1);
    eslogan.setHorizontalAlignment(Element.ALIGN_CENTER);
    eslogan.setBorderColor(BaseColor.WHITE);
    tablaEncabezado.addCell(eslogan);

    PdfPCell fundado = new PdfPCell(new Paragraph("",
            FontFactory.getFont("arial", 10)));
    fundado.setColspan(4);
    fundado.setRowspan(1);
    fundado.setHorizontalAlignment(Element.ALIGN_CENTER);
    fundado.setBorderColor(BaseColor.WHITE);
    tablaEncabezado.addCell(fundado);

    PdfPCell tituloForm = new PdfPCell(new Paragraph("Factura de Cliente "+hue.getNombre(),
            FontFactory.getFont("arial", 10, Font.BOLD)));
    tituloForm.setColspan(4);
    tituloForm.setRowspan(1);
    tituloForm.setHorizontalAlignment(Element.ALIGN_CENTER);
    tituloForm.setBorderColor(BaseColor.WHITE);
    tablaEncabezado.addCell(tituloForm);

    documento.add(tablaEncabezado);

    documento.add(salto);

    BaseColor colorTitulo = WebColors.getRGBColor("#34495e");
    BaseColor colorDato = WebColors.getRGBColor("#A2D6F9");
    BaseColor colorLetra = WebColors.getRGBColor("#ecf0f1");
    //CUERPO DEL PDF, FORMULARIO DE REGISTRO, SE CREA LA TABLA
    PdfPTable tablaFormulario = new PdfPTable(20);

    //AGREGAR INFORMACION DEL ESTUDIANTE
    
    
    
    
    

    //espacio
    PdfPCell espacio = new PdfPCell(new Paragraph("",
            FontFactory.getFont("arial", 7, Font.BOLD)));

    //INFORMACION DE LA MATRICULA
    PdfPCell infoMatricula = new PdfPCell(new Paragraph("INFORMACION DEL CUARTO",
            FontFactory.getFont("arial", 16, Font.BOLD, colorLetra)));
    infoMatricula.setBackgroundColor(colorTitulo);
    infoMatricula.setColspan(20);
    infoMatricula.setRowspan(1);
    infoMatricula.setHorizontalAlignment(Element.ALIGN_CENTER);
    infoMatricula.setVerticalAlignment(Element.ALIGN_MIDDLE);
    infoMatricula.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(infoMatricula);

    //GRADO EN QUE SE MATRICULA
    PdfPCell gradoMatricula = new PdfPCell(new Paragraph("#",
            FontFactory.getFont("arial", 10, colorTitulo)));
    gradoMatricula.setColspan(4);
    gradoMatricula.setRowspan(1);
    gradoMatricula.setBackgroundColor(colorDato);
    gradoMatricula.setVerticalAlignment(Element.ALIGN_MIDDLE);
    gradoMatricula.setHorizontalAlignment(Element.ALIGN_CENTER);
    gradoMatricula.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(gradoMatricula);

    //ESPECIFICACION DEL GRADO EN QUE SE MATRICULA
    PdfPCell gradoMatriculaEsp = new PdfPCell(new Paragraph(""+h.getId(),
            FontFactory.getFont("arial", 10)));
    gradoMatriculaEsp.setColspan(3);
    gradoMatriculaEsp.setRowspan(1);
    gradoMatriculaEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    gradoMatriculaEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    gradoMatriculaEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(gradoMatriculaEsp);

    //TIPO DE ESTUDIANTE
    PdfPCell tipoEstudiante = new PdfPCell(new Paragraph("Tipo",
            FontFactory.getFont("arial", 10, colorTitulo)));
    tipoEstudiante.setColspan(3);
    tipoEstudiante.setRowspan(1);
    tipoEstudiante.setBackgroundColor(colorDato);
    tipoEstudiante.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoEstudiante.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoEstudiante.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoEstudiante);

    //ESPECIFICACION DEL TIPO DE ESTUDIANTE
    PdfPCell tipoEstuEsp = new PdfPCell(new Paragraph(""+h.getTipo(),
            FontFactory.getFont("arial", 10)));
    tipoEstuEsp.setColspan(2);
    tipoEstuEsp.setRowspan(1);
    tipoEstuEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoEstuEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoEstuEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoEstuEsp);

    //TIPO DE MATRICULA
    PdfPCell tipoMatricula = new PdfPCell(new Paragraph("Observacion",
            FontFactory.getFont("arial", 10, colorTitulo)));
    tipoMatricula.setColspan(4);
    tipoMatricula.setRowspan(1);
    tipoMatricula.setBackgroundColor(colorDato);
    tipoMatricula.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoMatricula.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoMatricula.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoMatricula);

    //ESPECIFICACION DEL TIPO DE MATRICULA
    PdfPCell tipoMatriculaEsp = new PdfPCell(new Paragraph(h.getObservacion(),
            FontFactory.getFont("arial", 10)));
    tipoMatriculaEsp.setColspan(5);
    tipoMatriculaEsp.setRowspan(1);
    tipoMatriculaEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoMatriculaEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoMatriculaEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoMatriculaEsp);

    //INFORMACION DEL PADRE
    PdfPCell infoPadre = new PdfPCell(new Paragraph("INFORMACION DEL CLIENTE",
            FontFactory.getFont("arial", 16, Font.BOLD, colorLetra)));
    infoPadre.setBackgroundColor(colorTitulo);
    infoPadre.setColspan(20);
    infoPadre.setRowspan(1);
    infoPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    infoPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    infoPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(infoPadre);

    //TIPO DE DOCUMENTO DEL PADRE
    PdfPCell tipoDocuPadre = new PdfPCell(new Paragraph("#id",
            FontFactory.getFont("arial", 10, colorTitulo)));
    tipoDocuPadre.setColspan(5);
    tipoDocuPadre.setRowspan(1);
    tipoDocuPadre.setBackgroundColor(colorDato);
    tipoDocuPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoDocuPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoDocuPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoDocuPadre);

    //ESPECIFICACION DEL TIPO DE DOCUMENTO DEL PADRE
    PdfPCell tipoDocPadreEsp = new PdfPCell(new Paragraph(""+hue.getIdcliente(),
            FontFactory.getFont("arial", 10)));
    tipoDocPadreEsp.setColspan(2);
    tipoDocPadreEsp.setRowspan(1);
    tipoDocPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoDocPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoDocPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoDocPadreEsp);

    //NUMERO DE DOCUMENTO DEL PADRE
    PdfPCell numDocuPadre = new PdfPCell(new Paragraph("Identificacion°",
            FontFactory.getFont("arial", 10, colorTitulo)));
    numDocuPadre.setColspan(4);
    numDocuPadre.setRowspan(1);
    numDocuPadre.setBackgroundColor(colorDato);
    numDocuPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    numDocuPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    numDocuPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(numDocuPadre);

    //ESPECIFICACION DEL NUMERO DE DOCUMENTO DEL PADRE
    PdfPCell numDocPadreEsp = new PdfPCell(new Paragraph(""+hue.getCc(),
            FontFactory.getFont("arial", 10)));
    numDocPadreEsp.setColspan(4);
    numDocPadreEsp.setRowspan(1);
    numDocPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    numDocPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    numDocPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(numDocPadreEsp);

    //LUGAR DE EXPEDICION DEL PADRE
    PdfPCell expPadre = new PdfPCell(new Paragraph("Nombres",
            FontFactory.getFont("arial", 10, colorTitulo)));
    expPadre.setColspan(3);
    expPadre.setRowspan(1);
    expPadre.setBackgroundColor(colorDato);
    expPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    expPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    expPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(expPadre);

    //ESPECIFICACION DEL NUMERO DE DOCUMENTO DEL PADRE
    PdfPCell expPadreEsp = new PdfPCell(new Paragraph(hue.getNombre(),
            FontFactory.getFont("arial", 10)));
    expPadreEsp.setColspan(5);
    expPadreEsp.setRowspan(1);
    expPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    expPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    expPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(expPadreEsp);

    //NOMBRE DEL PADRE
    PdfPCell nombrePadre = new PdfPCell(new Paragraph("APELLIDOS",
            FontFactory.getFont("arial", 10, colorTitulo)));
    nombrePadre.setColspan(3);
    nombrePadre.setRowspan(1);
    nombrePadre.setBackgroundColor(colorDato);
    nombrePadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    nombrePadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    nombrePadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(nombrePadre);

    //ESPECIFICACION DEL NOMBRE DEL PADRE
    PdfPCell nombrePadreEsp = new PdfPCell(new Paragraph(hue.getApellidos(),
            FontFactory.getFont("arial", 10)));
    nombrePadreEsp.setColspan(9);
    nombrePadreEsp.setRowspan(1);
    nombrePadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    nombrePadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    nombrePadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(nombrePadreEsp);

    //FECHA DE NACIMIENTO DEL PADRE
    PdfPCell fechaNacPadre = new PdfPCell(new Paragraph("Direccion",
            FontFactory.getFont("arial", 10, colorTitulo)));
    fechaNacPadre.setColspan(4);
    fechaNacPadre.setRowspan(1);
    fechaNacPadre.setBackgroundColor(colorDato);
    fechaNacPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    fechaNacPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    fechaNacPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(fechaNacPadre);

    //ESPECIFICACION DE LA FECHA DE NACIMIENTO DEL PADRE
    PdfPCell fechaNacPadreEsp = new PdfPCell(new Paragraph(hue.getDir(),
            FontFactory.getFont("arial", 10)));
    fechaNacPadreEsp.setColspan(4);
    fechaNacPadreEsp.setRowspan(1);
    fechaNacPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    fechaNacPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    fechaNacPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(fechaNacPadreEsp);

    //OCUPACION DEL PADRE
    PdfPCell ocupacionPadre = new PdfPCell(new Paragraph("Telefono",
            FontFactory.getFont("arial", 10, colorTitulo)));
    ocupacionPadre.setColspan(4);
    ocupacionPadre.setRowspan(1);
    ocupacionPadre.setBackgroundColor(colorDato);
    ocupacionPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    ocupacionPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    ocupacionPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(ocupacionPadre);

    //ESPECIFICACION DE LA OCUPACION DEL PADRE
    PdfPCell ocupacionPadreEsp = new PdfPCell(new Paragraph(""+hue.getTele(),
            FontFactory.getFont("arial", 10)));
    ocupacionPadreEsp.setColspan(5);
    ocupacionPadreEsp.setRowspan(1);
    ocupacionPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    ocupacionPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    ocupacionPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(ocupacionPadreEsp);

    //NOMBRE DE LA EMPRESA DEL PADRE
    PdfPCell empresaPadre = new PdfPCell(new Paragraph("Nacionalidad",
            FontFactory.getFont("arial", 10, colorTitulo)));
    empresaPadre.setColspan(3);
    empresaPadre.setRowspan(1);
    empresaPadre.setBackgroundColor(colorDato);
    empresaPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    empresaPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    empresaPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(empresaPadre);

    //ESPECIFICACION DEL NOMBRE DE LA EMPRESA DEL PADRE
    PdfPCell empresaPadreEsp = new PdfPCell(new Paragraph(hue.getNacionalidad(),
            FontFactory.getFont("arial", 10)));
    empresaPadreEsp.setColspan(8);
    empresaPadreEsp.setRowspan(1);
    empresaPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    empresaPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    empresaPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(empresaPadreEsp);

    //DIRECCION DE LA EMPRESA DEL PADRE
    PdfPCell dirEmpPadre = new PdfPCell(new Paragraph("Procedencia",
            FontFactory.getFont("arial", 10, colorTitulo)));
    dirEmpPadre.setColspan(6);
    dirEmpPadre.setRowspan(1);
    dirEmpPadre.setBackgroundColor(colorDato);
    dirEmpPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    dirEmpPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    dirEmpPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(dirEmpPadre);

    //ESPECIFICACION DE LA DIRECCION DE LA EMPRESA DEL PADRE
    PdfPCell dirEmpPadreEsp = new PdfPCell(new Paragraph(hue.getProcedencia(),
            FontFactory.getFont("arial", 10)));
    dirEmpPadreEsp.setColspan(6);
    dirEmpPadreEsp.setRowspan(1);
    dirEmpPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    dirEmpPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    dirEmpPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(dirEmpPadreEsp);

    //EMAIL DEL PADRE
    PdfPCell emailPadre = new PdfPCell(new Paragraph("Pasaporte",
            FontFactory.getFont("arial", 10, colorTitulo)));
    emailPadre.setColspan(3);
    emailPadre.setRowspan(1);
    emailPadre.setBackgroundColor(colorDato);
    emailPadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    emailPadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    emailPadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(emailPadre);

    //ESPECIFICACION DEL EMAIL DEL PADRE
    PdfPCell emailPadreEsp = new PdfPCell(new Paragraph(hue.getPasaporte(),
            FontFactory.getFont("arial", 10)));
    emailPadreEsp.setColspan(6);
    emailPadreEsp.setRowspan(1);
    emailPadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    emailPadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    emailPadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(emailPadreEsp);

    //TELEFONO DE LA EMPRESA DEL PADRE
    
    ArrayList<propiedadeshab>propiedades= new ArrayList();
    propiedades=c.porpiedadesportipo(h.getTipo());
    PdfPCell usoColegio = new PdfPCell(new Paragraph("SERVICIOS ADICIONALES",
            FontFactory.getFont("arial", 14, Font.BOLD, colorLetra)));
    usoColegio.setBackgroundColor(colorTitulo);
    usoColegio.setColspan(20);
    usoColegio.setRowspan(1);
    usoColegio.setVerticalAlignment(Element.ALIGN_MIDDLE);
    usoColegio.setHorizontalAlignment(Element.ALIGN_CENTER);
    usoColegio.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(usoColegio);

    //LISTA PARA REGISTRO CIVIL
    int num=propiedades.size();
    for(propiedadeshab p : propiedades){
        ZapfDingbatsList listadoRegisCivil = new ZapfDingbatsList(52, 4);
    ListItem regisCivil = new ListItem(" ", FontFactory.getFont("arial", 7, Font.BOLD));
    listadoRegisCivil.add(regisCivil);

    PdfPCell chuloRegistroCivil = new PdfPCell(new Paragraph("",
            FontFactory.getFont("arial", 10, Font.BOLD)));
    chuloRegistroCivil.addElement(listadoRegisCivil);
    chuloRegistroCivil.setColspan(1);
    chuloRegistroCivil.setRowspan(1);
    chuloRegistroCivil.setBorderColor(BaseColor.WHITE);
    chuloRegistroCivil.setVerticalAlignment(Element.ALIGN_MIDDLE);
    chuloRegistroCivil.setHorizontalAlignment(Element.ALIGN_RIGHT);
    tablaFormulario.addCell(chuloRegistroCivil);

    //REGITRO CIVIL
    PdfPCell registroCivil = new PdfPCell(new Paragraph(p.getDescripcion(),
            FontFactory.getFont("arial", 10)));
    registroCivil.setColspan(3);
    registroCivil.setRowspan(1);
    registroCivil.setBackgroundColor(colorDato);
    registroCivil.setVerticalAlignment(Element.ALIGN_MIDDLE);
    registroCivil.setHorizontalAlignment(Element.ALIGN_CENTER);
    registroCivil.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(registroCivil);
    
   
        
    }
    

    
     while((num%5)!=0){
           ZapfDingbatsList listadoRegisCivil = new ZapfDingbatsList(52, 4);
    ListItem regisCivil = new ListItem(" ", FontFactory.getFont("arial", 7, Font.BOLD));
    listadoRegisCivil.add(regisCivil);

    PdfPCell chuloRegistroCivil = new PdfPCell(new Paragraph("",
            FontFactory.getFont("arial", 10, Font.BOLD)));
 
    chuloRegistroCivil.setColspan(1);
    chuloRegistroCivil.setRowspan(1);
    chuloRegistroCivil.setBorderColor(BaseColor.WHITE);
    chuloRegistroCivil.setVerticalAlignment(Element.ALIGN_MIDDLE);
    chuloRegistroCivil.setHorizontalAlignment(Element.ALIGN_RIGHT);
    tablaFormulario.addCell(chuloRegistroCivil);

    //REGITRO CIVIL
    PdfPCell registroCivil = new PdfPCell(new Paragraph("",
            FontFactory.getFont("arial", 10)));
    registroCivil.setColspan(3);
    registroCivil.setRowspan(1);
 
    registroCivil.setVerticalAlignment(Element.ALIGN_MIDDLE);
    registroCivil.setHorizontalAlignment(Element.ALIGN_CENTER);
    registroCivil.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(registroCivil);
         
         num=num+1;
     }
    
    
    
    
    //INFORMACION DE LA MADRE
    PdfPCell infoMadre = new PdfPCell(new Paragraph("TOTAL A PAGAR",
            FontFactory.getFont("arial", 16, Font.BOLD, colorLetra)));
    infoMadre.setBackgroundColor(colorTitulo);
    infoMadre.setColspan(20);
    infoMadre.setRowspan(1);
    infoMadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    infoMadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    infoMadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(infoMadre);

    //TIPO DE DOCUMENTO DE LA MADRE
    PdfPCell tipoDocuMadre = new PdfPCell(new Paragraph("Fecha Ingreso",
            FontFactory.getFont("arial", 10, colorTitulo)));
    tipoDocuMadre.setColspan(5);
    tipoDocuMadre.setRowspan(1);
    tipoDocuMadre.setBackgroundColor(colorDato);
    tipoDocuMadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoDocuMadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoDocuMadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoDocuMadre);

    //ESPECIFICACION DEL TIPO DE DOCUMENTO DE LA MADRE
     SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
    PdfPCell tipoDocMadreEsp = new PdfPCell(new Paragraph(""+sdf.format(r.getFechainicio().getTime()),
            FontFactory.getFont("arial", 10)));
    tipoDocMadreEsp.setColspan(3);
    tipoDocMadreEsp.setRowspan(1);
    tipoDocMadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    tipoDocMadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoDocMadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(tipoDocMadreEsp);

    //NUMERO DE DOCUMENTO DE LA MADRE
    PdfPCell numDocuMadre = new PdfPCell(new Paragraph("Fecha Salida",
            FontFactory.getFont("arial", 10, colorTitulo)));
    numDocuMadre.setColspan(3);
    numDocuMadre.setRowspan(1);
    numDocuMadre.setBackgroundColor(colorDato);
    numDocuMadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    numDocuMadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    numDocuMadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(numDocuMadre);

    //ESPECIFICACION DEL NUMERO DE DOCUMENTO DE LA MADRE
    PdfPCell numDocMadreEsp = new PdfPCell(new Paragraph(""+sdf.format(r.getFechafin().getTime()),
            FontFactory.getFont("arial", 10)));
    numDocMadreEsp.setColspan(3);
    numDocMadreEsp.setRowspan(1);
    numDocMadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    numDocMadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    numDocMadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(numDocMadreEsp);

    //LUGAR DE EXPEDICION DE LA MADRE
    PdfPCell expMadre = new PdfPCell(new Paragraph("$Total",
            FontFactory.getFont("arial", 10, colorTitulo)));
    expMadre.setColspan(3);
    expMadre.setRowspan(1);
    expMadre.setBackgroundColor(colorDato);
    expMadre.setVerticalAlignment(Element.ALIGN_MIDDLE);
    expMadre.setHorizontalAlignment(Element.ALIGN_CENTER);
    expMadre.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(expMadre);

    //ESPECIFICACION DEL NUMERO DE DOCUMENTO DE LA MADRE
    PdfPCell expMadreEsp = new PdfPCell(new Paragraph("$ "+consultarf.getTotal(),
            FontFactory.getFont("arial", 10)));
    expMadreEsp.setColspan(5);
    expMadreEsp.setRowspan(1);
    expMadreEsp.setVerticalAlignment(Element.ALIGN_MIDDLE);
    expMadreEsp.setHorizontalAlignment(Element.ALIGN_CENTER);
    expMadreEsp.setBorderColor(BaseColor.WHITE);
    tablaFormulario.addCell(expMadreEsp);

    //NOMBRE DE LA MADRE
    

    //INFORMACION DEL ACUDIENTE
    
    //INFORMACION USO DEL COLEGIO
    

    documento.add(tablaFormulario);

    documento.close();

    documento.open();
%>
