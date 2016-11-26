/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.limpieza;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class limpiezaDAO {
    
private clsConn cnn=new clsConn();

    public limpiezaDAO() {
    }

   
    
     public String insertar (limpieza lim){
        String msm="error";
       
  String sql ="INSERT INTO servicioaseo(id_hab, id_emp)VALUES ("+lim.getId_hab()+","+lim.getId_emp()+");";

      SQLException exe= getCnn().insertar(sql);
         
          if(exe==null){
              msm= "Ingreso exitoso";
          }else{
                System.out.println("insertar "+exe.getMessage()+"    ");
                
          }
              
     System.out.println("insertar "+msm+"    ");
     
        return msm;
    }
     public String habsinasignar(){
     ResultSet    msm= getCnn().consultaTabla("select hab.id_hab from habitaciones hab where hab.id_hab not in (select servicioaseo.id_hab from habitaciones right join servicioaseo on( habitaciones.id_hab = servicioaseo.id_hab));");
       String opcion=""; 
    try {
        while(msm.next()){
             opcion+="<option value=\""+msm.getInt(1)+"\">"+msm.getInt(1)+"</option>"; 
       
        }
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
    }
        return opcion;
     }
     public String empleados(){
     ResultSet    msm= getCnn().consultaTabla("select e.id, e.nombres, e.apellidos from empleados e where cargo in (select c.id from cargoempleado c where descripcion = 'Aseadora')");
       String opcion=""; 
    try {
        while(msm.next()){
             opcion+="<option value=\""+msm.getInt(1)+"\">"+msm.getString(2)+" "+msm.getString(3)+"</option>"; 
       
        }
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
    }
        return opcion;
     }
     
    
   public String Asignadas() throws SQLException{
       String sql="select e.id, e.nombres, e.apellidos, s.id_hab from empleados e join servicioaseo s on(e.id=s.id_emp);";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #ee9d73; color: white;\">" +
                                "<th class=\"col text-center\">Identificacion Habitacion</th>\n" +
                                "<th class=\"col text-center\">Empleado encargado</th>\n" +
                                "<th class=\"col text-center\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(4)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+" "+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" >"
                                      + "<input type=\"hidden\" name=\"id_hab\" value=\""+msm.getInt(4)+"\" >"
                                      + "<input type=\"hidden\" name=\"tabla\" value=\"aseo\" >"
                                      + "<button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>";
                                     

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla);
   } 
    
    public clsConn getCnn() {
        return cnn;
    }
      public void eliminar(int id_emp,int id_hab){
   int   msm= getCnn().verificar("DELETE FROM servicioaseo WHERE id_emp="+id_emp+"and id_hab="+id_hab+";");
     
   
}
}
