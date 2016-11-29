/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.estadohab;
import co.ufps.edu.dto.estadoreserva;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class estado_reservaDAO {
 private clsConn cnn;
    
    public estado_reservaDAO() {
    }
   public String insertar (estadoreserva estadore){
        String msm="error";
       ResultSet res= getCnn().consultaTabla("select max(id)+1 from estadoreserva;");
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
     
       String sql ="INSERT INTO estadoreserva(id,descripcion) VALUES ("+id+",'"+estadore.getDescripcion()+"');";

      SQLException exe= getCnn().insertar(sql);
          if(exe==null){
              msm="Insertado exitoso";
          }
     System.out.println("insertar "+msm+"    "+estadore.getDescripcion()+" "+exe);
        return msm;
    }
   
   
     public String actualizar(estadoreserva estadore){
     ResultSet    msm= getCnn().consultaTabla("SELECT * From estadoreserva where id="+estadore.getId()+";");
    try {
        while (msm.next()){
           
            if(estadore.getDescripcion()==null){
                estadore.setDescripcion(msm.getString(2));
            }
        }   
        
        String sql="UPDATE estadoreserva SET descripcion='"+estadore.getDescripcion()+"' WHERE id="+estadore.getId()+";";
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        
    }
     return "";
     }
    
    public void eliminar(int id){
   int   msm= getCnn().verificar("DELETE FROM estadoreserva WHERE id="+id+";");
    
 }
    public String estadosreser() throws SQLException{
       String sql="select * from estadoreserva;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #ee9d73; color: white;\">\n" +
                                "<th class=\"col text-center\">Identificacion</th>\n" +
                                "<th class=\"col text-center\">Descripcion</th>\n" +
                                "<th class=\"col text-center\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"estadoreserva\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editarestado_reserva.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\""+msm.getString(2)+"\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
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
        public estadoreserva consultarid( int id){
        estadoreserva r=new estadoreserva();
         String sql="select * from estadoreserva where id="+id+";";
       
          ResultSet res= getCnn().consultaTabla(sql);
       
       try {
          while(res.next()){
                
            r.setId(res.getInt(1));
            r.setDescripcion(res.getString(2));
            }
           
       } catch (SQLException ex) {
           Logger.getLogger(tipohabitaciondao.class.getName()).log(Level.SEVERE, null, ex);
       }
        return r;
        }

}
