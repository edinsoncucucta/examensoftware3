/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.cargo_empleado;
import co.ufps.edu.dto.estadohab;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class cargo_emp_DAO {

    public cargo_emp_DAO() {
    }
    
     private clsConn cnn;
public String insertar (cargo_empleado cargo){
        String msm="error";
       ResultSet res= getCnn().consultaTabla("select max(id)+1 from cargoempleado;");
       int id=0; 
       try {
           if(res.next()){
               if(res.getInt(1)==0){
                    id=1;
                }else{
                id= res.getInt(1);}
           }
       } catch (SQLException ex) {
           Logger.getLogger(tipohabitaciondao.class.getName()).log(Level.SEVERE, null, ex);
       }
     
       String sql ="INSERT INTO cargoempleado(id,descripcion) VALUES ("+id+",'"+cargo.getNombre()+"');";

      SQLException exe= getCnn().insertar(sql);
        if(exe==null){
            msm="Ingreso exitoso";
        }
     System.out.println("insertar "+msm+"    ");
        return msm;
    }
  public String actualizar(cargo_empleado cargo){
     ResultSet    msm= getCnn().consultaTabla("SELECT * From cargoempleado where id="+cargo.getId()+";");
    try {
        while (msm.next()){
           
            if(cargo.getNombre()==null){
                cargo.setNombre(msm.getString(2));
            }
        }   
         
        String sql="UPDATE cargoempleado SET descripcion='"+cargo.getNombre()+"' WHERE id_hab="+cargo.getId()+";";
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        
    }
     return "";
     }
    
    public void eliminar(int id){
   int   msm= getCnn().verificar("DELETE FROM cargoempleado WHERE id="+id+";");
    
    
 }
     public String cargos() throws SQLException{
       String sql="select * from cargoempleado;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #ee9d73; color: white;\">\n" +
                                "<th class=\"col text-center\">Identificacion</th>\n" +
                                "<th class=\"col text-center\">Nombre</th>\n" +
                                "<th class=\"col text-center\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"cargo\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"actualizar_cargo.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"cargo\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla);
   }

public clsConn getCnn() {
     if (cnn==null){
             cnn=new clsConn();
         }
        return cnn;
    }
}
