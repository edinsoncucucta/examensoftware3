<%-- 
    Document   : registradoHotel
    Created on : 6/05/2016, 07:45:30 AM
    Author     : EDINSON
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.UploadBean"%>
<jsp:useBean id="hab" class="co.ufps.edu.dao.daohabitaciones" scope="session"></jsp:useBean>
<jsp:useBean id="datos" class="co.ufps.edu.dto.habitaciones" scope="session"></jsp:useBean>   
<%
    
   
   
  //  out.println(m);
    String nueva = "";
String ruta2 = getServletContext().getRealPath("/");

ruta2 += "imagenes/hab";

    UploadBean upBean = new UploadBean();
    UploadFile file = null;
    upBean.setFolderstore(ruta2);
    boolean msg = false;
    String tipo = "";
    String id = "";
    String descripcion = "";
    int id_hab;
    
    

    if (!MultipartFormDataRequest.isMultipartFormData(request)) {
        msg = false;

    } else {

        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        Hashtable files = mrequest.getFiles();
        id_hab = Integer.parseInt(mrequest.getParameter("idh"));
        int tipo1 = Integer.parseInt(mrequest.getParameter("tipo"));
        int estado = Integer.parseInt(mrequest.getParameter("estado"));
        String obs= mrequest.getParameter("obs");
    String m="error";
        
        if ((files != null) && (!files.isEmpty())) {

            file = (UploadFile) files.get("archivo");

            if (file == null) {

                msg = true;
            }
            if (file.getFileName() != null) {
                File filess = new File(ruta2 + "/" + id + ".jpg");

                filess.delete();
                file.setFileName(id_hab + ".jpg");
                upBean.store(mrequest, "archivo");
                nueva="../imagenes/hab/"+id_hab+".jpg";
                    datos.setId(id_hab);
                    datos.setTipo(tipo1);
                    datos.setEstado(estado);
                    datos.setFoto(nueva);
                    datos.setObservacion(obs);
                    m=hab.insertar1(datos);
                    System.out.println("esteee22222:::::" + m);
              //  msg = negocio.registrarHabitacion(id, descripcion, tipo, nueva, tarifa);
                System.out.println(ruta2+" "+file.getFileName());
             //   System.out.println(nueva);
            }

        } else {
            msg = false;
        }

    } 
response.sendRedirect("Datos_habitacion.jsp");
%>
