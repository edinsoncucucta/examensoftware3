<%-- 
    Document   : subirimagen
    Created on : 28/11/2016, 10:21:02 PM
    Author     : EDINSON
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   System.out.print("...............................");
    String ruta = request.getRealPath("./imagenes/hab");
    UploadBean upBean = new UploadBean();
    UploadFile file = null;
    upBean.setFolderstore(ruta);
    boolean msg = false;
    String codigo = "";


    if (!MultipartFormDataRequest.isMultipartFormData(request)) {
        msg = false;
    } else {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        Hashtable files = mrequest.getFiles();
        if ((files != null) && (!files.isEmpty())) {
            file = (UploadFile) files.get("archivo");

            codigo = mrequest.getParameter("id_hab");
            file.setFileName(codigo + ".png");

            if (file == null) {
                msg = true;
            }
            upBean.store(mrequest, "archivo");
            msg = true;
        } else {
            msg = false;
        }

    }

    boolean resul = false;
    if (msg) {
        JOptionPane.showMessageDialog(null,"public/imagenes/hab/" + file.getFileName());
       // String m = fachada.acomodarRutaImagenProducto(codigo, "public/imagenes/hab/" + file.getFileName());
    }

    if (resul) {
        //response.sendRedirect("../detalleproducto.jsp?codigo=" + codigo+"&estado=listo");}
%>

