/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

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
public class tipohabitaciondao {
   private clsConn cnn=new clsConn();
int id;
    String nombre;
    int preciobase;
    public tipohabitaciondao() {
    }

    public tipohabitaciondao(int id, String nombre, int preciobase) {
        this.id = id;
        this.nombre = nombre;
        this.preciobase = preciobase;
    }
   
   public String insertar (tipo_habitacion tipoh){
        String msm="error";
       ResultSet res= getCnn().consultaTabla("select max(id_tipo)+1 from tiposhabitaciones;");
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
       String sql ="INSERT INTO tiposhabitaciones(id_tipo,nombre, preciobase) VALUES ("+id+",'"+tipoh.getNombre()+"',"+tipoh.getPreciobase()+");";

      SQLException exe= getCnn().insertar(sql);
           if(exe==null){
               msm="Ingreso exitoso";
           }
     System.out.println("insertar "+msm+"    ");
        return msm;
    }
   public String tipos() throws SQLException{
      String sql="select * from tiposhabitaciones;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #ee9d73; color: white;\">\n" +
                                "<th class=\"col text-center\">Identificacion</th>\n" +
                                "<th class=\"col text-center\">Nombre del tipo</th>\n" +
                                "<th class=\"col text-center\">Precio Base</th>\n" +
                                "<th class=\"col text-center\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"tiposhab\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editartipohab.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"tiposhab\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla);
   }

    public clsConn getCnn() {
        return cnn;
    }
     public String actualizar(tipo_habitacion tipoh){
     ResultSet    msm= getCnn().consultaTabla("SELECT * From tiposhabitaciones where id_tipo="+tipoh.getId()+";");
    try {
        while (msm.next()){
            if(tipoh.getPreciobase()==0){
                tipoh.setPreciobase(msm.getInt(3));
            }
            if(tipoh.getNombre()==null){
                tipoh.setNombre(msm.getString(2));
            }
        }   
         
        String sql="UPDATE tiposhabitaciones SET nombre='"+tipoh.getNombre()+"', preciobase="+tipoh.getPreciobase()+" WHERE id_tipo="+tipoh.getId()+";";
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        
    }
     
     return "";
     }
     public void eliminar(int id){
   int   msm= getCnn().verificar("DELETE FROM tiposhabitaciones WHERE id_tipo="+id+";");
     
    
 }
}
