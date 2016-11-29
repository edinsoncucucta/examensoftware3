/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.propiedadeshab;
import co.ufps.edu.dto.tipo_habitacion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class propiedadeshabDAO {
    
    private clsConn cnn=new clsConn();

    public propiedadeshabDAO() {
    }
    
     public String insertar (propiedadeshab proph){
        String msm="error";
       ResultSet res= getCnn().consultaTabla("select max(id)+1 from propiedades;");
       int id=0; 
       try {
           if(res.next()){
               if(res.getInt(1)==0){
                    id=1;
                }else{
                id= res.getInt(1);
                proph.setId(id);
               System.err.println(id);
               }
           }
       } catch (SQLException ex) {
           Logger.getLogger(tipohabitaciondao.class.getName()).log(Level.SEVERE, null, ex);
       }
   System.out.println(proph.getDescripcion());
       String sql ="INSERT INTO propiedades(id,descripcion) VALUES ("+id+",'"+proph.getDescripcion()+"');";

      SQLException exe= getCnn().insertar(sql);
          if(exe==null){
              msm="ingreso correcto";
          }
    
        return msm;
    }
    
   public String todaspropiedades() throws SQLException{
       String sql="select * from propiedades;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Identificacion</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Nombre de la propiedad</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+"</td>";
                              //tabla+="<td class=\"text-center\">"+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"prophab\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editarpropiedadeshab.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"name\" value=\""+msm.getString(2)+"\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
      
        return (tabla);
   } 
    
    public clsConn getCnn() {
        return cnn;
    }
      public void eliminar(int id){
   int   msm= getCnn().verificar("DELETE FROM propiedades WHERE id="+id+";");
   
    
 }
      public String actualizar(propiedadeshab proph){
     ResultSet    msm= getCnn().consultaTabla("SELECT * From propiedades where id="+proph.getId()+";");
    try {
        while (msm.next()){
            if(proph.getInc()==0){
               proph.setInc(0);
            }
            if(proph.getDescripcion()==null){
                proph.setDescripcion(msm.getString(2));
            }
        }   
         
        String sql="UPDATE propiedades SET descripcion='"+proph.getDescripcion()+"', incremento="+proph.getInc()+" WHERE id="+proph.getId()+";";
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        
    }
     
     return "";
     }
}
