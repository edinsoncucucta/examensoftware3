
package co.ufps.edu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class tipohabpropiedades {
     private clsConn cnn=new clsConn();

    public tipohabpropiedades() {
    
    }
    public String tipos(){
         ResultSet    msm= getCnn().consultaTabla("SELECT id_tipo, nombre From tiposhabitaciones;");
       String opcion=""; 
    try {
        while(msm.next()){
             opcion+="<option value=\""+msm.getInt(1)+"\">"+msm.getString(2)+"</option>"; 
       
        }
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
    }
        return opcion;
    }
    public clsConn getCnn() {
        return cnn;
    }
     public String propiedades(){
         ResultSet    msm= getCnn().consultaTabla("SELECT id, descripcion From propiedades;");
       String opcion=""; 
       int i=0;
    try {
        while(msm.next()){
            System.out.println(i);
            opcion+="<input type=checkbox name=propiedad id="+msm.getInt(1)+" value="+msm.getInt(1)+">"+msm.getString(2)+"<br>";
       i++;
        }
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
    }

        return opcion;
    }
   public String insertar(int tipo, int prop){
       String msm = null;
       String sql="INSERT INTO propiedadesportipo(id_tipo, id_descripcion)VALUES ("+tipo+","+prop+");";
SQLException exe= getCnn().insertar(sql);
if(exe!=null){msm=exe.getMessage();}

     System.out.println("insertar "+msm+"    ");
        return msm;
   }
   
   public String tabla() throws SQLException{
        String sql="select p.id_tipo,p.id_descripcion, t.nombre, e.descripcion from ((propiedadesportipo p join tiposhabitaciones t on(p.id_tipo=t.id_tipo) )join propiedades e on(p.id_descripcion=e.id)) group by p.id_tipo,p.id_descripcion, t.nombre, e.descripcion order by p.id_tipo;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\"><thead>";
                               tabla+= "<tr><th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Tipo </th>" +
                                
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Propiedad</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
          
                tabla+="<tr >";
                            tabla+="<td class=\"text-center\">"+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(4)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminarprophab.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"idprop\" value=\""+msm.getInt(2)+"\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla);
   }
    public void eliminar(int id,int idp){
   int   msm= getCnn().verificar("DELETE FROM propiedadesportipo WHERE id_tipo="+id+"and id_descripcion="+idp+";");

    
 }
}
