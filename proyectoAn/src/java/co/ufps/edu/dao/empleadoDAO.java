/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.empleado;
import co.ufps.edu.dto.estadoreserva;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;
import ufps.edu.co.utils.conexion.Conexion;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class empleadoDAO {
 private clsConn cnn;
    private Conexion conexion=new Conexion();
 public empleadoDAO() {
    }
    
     public String insertar (empleado emp){
       
       int nid=obtenerid();
    String passwordencriptada=DigestUtils.sha1Hex(emp.getContraseña());
       String sql ="INSERT INTO empleados(id,id_hotel,nombres,apellidos,password,email,cargo,cedula,telefono) VALUES ("+nid+",1,'"+emp.getNombre()+"','"+emp.getApellidos()+"','"+passwordencriptada+"','"+emp.getEmail()+"',"+emp.getCargo()+","+emp.getCedula()+","+emp.getTelefono()+");";
String msm="error";
      SQLException exe= getCnn().insertar(sql);
           if(exe==null){
              msm= "Ingreso exitoso";
          }else{
               System.out.println("insertar "+exe.getMessage()+"    ");
           }
              System.out.println("insertar "+msm+"    ");
     
     
        return msm;
    }
     public int obtenerid(){
         ResultSet res= getCnn().consultaTabla("select max(id)+1 from empleados;");
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
       return id;
     }
     public String actualizar(empleado emp){
         String passwordencriptada=DigestUtils.sha1Hex(emp.getContraseña());
     ResultSet    msm= getCnn().consultaTabla("SELECT * From empleados where id="+emp.getId()+";");
    try {
        while (msm.next()){
           if(emp.getNombre()==null){
               emp.setNombre(msm.getString(2));
           }
           if(emp.getApellidos()==null){
            emp.setApellidos(msm.getString(3));
           }
           if(emp.getContraseña()==null){
             emp.setContraseña(msm.getString(4));
           }
           if(emp.getEmail()==null){
               emp.setEmail(msm.getString(5));
           }
           if(emp.getCargo()==0){
               emp.setCargo(msm.getInt(7));
           }
           if(emp.getCedula()==0){
               emp.setCedula(msm.getInt(8));
           }
           if(emp.getTelefono()==0){
               emp.setTelefono(msm.getInt(9));
           }
            
        }   
         
        String sql="UPDATE empleados SET  nombres='"+emp.getNombre()+"', apellidos='"+emp.getApellidos()+"', password='"+passwordencriptada+"', email='"+emp.getEmail()+"', id_hotel=1, cargo="+emp.getCargo()+", cedula="+emp.getCedula()+", telefono="+emp.getTelefono()+" WHERE id="+emp.getId();
System.out.println(sql);
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        System.out.println(ex);
    }
     return "";
     }
      public String todosempleados() throws SQLException{
      String sql="select * from empleados join cargoempleado on(empleados.cargo=cargoempleado.id) order by empleados.id ;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr>\n" +
                                "<th class=\"col text-center\"Style=\"background-color:  #ee9d73; color: white;\" >Id</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Nombres</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Contraseña</th>\n" +
                                 "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Email</th>\n" +
                               "<th class=\"col text-center\"Style=\"background-color:  #ee9d73; color: white;\">Cargo</th>\n" +
                               "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Cedula</th>\n" +
                               "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Telefono</th>\n" +
                               "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+" "+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(4)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(5)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(11)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(8)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(9)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"empleado\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editar_empleado.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\""+msm.getString(2)+" "+msm.getString(3)+"\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla);
   }
    
    public void eliminar(int id){
   int   msm= getCnn().verificar("DELETE FROM empleados WHERE id="+id+";");
    
    
 }
    public clsConn getCnn() {
         if (cnn==null){
             cnn=new clsConn();
         }
        return cnn;
    } 
     public String cargos(){
       ResultSet    msm= getCnn().consultaTabla("SELECT * From cargoempleado;");
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
     public empleado login(empleado emp){
         boolean var=true;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                
                String passwordencriptada=DigestUtils.sha1Hex(emp.getContraseña());
		try {
			
			con=conexion.conectar("");
                        
			
			String sql = "SELECT * FROM empleados "
					+    "WHERE email = ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, emp.getEmail());
                       
			rst = ps.executeQuery();
                        
			
			if(rst.next()){
                            if(!passwordencriptada.equalsIgnoreCase(rst.getString("password"))){
                                emp=null;
                            }else{
                                emp.setCargo(rst.getInt("cargo"));
                                emp.setApellidos(rst.getString("apellidos"));
                                emp.setNombre(rst.getString("nombres"));
                                emp.setCedula(rst.getInt("cedula"));
                            }
                            
                            
                            
				
			}else{
                            emp=null;
                        }
			
                        
                        
		} catch (Exception e) {
                    System.out.println("error "+e.toString());
			e.printStackTrace();
			conexion.escribirLogs("UsuarioDao", "registrarUsuario", e.toString());
                       
		} finally {
			
                    
                    
                    
                     if (rst != null) {
        try {
            rst.close();
        } catch (SQLException e) { /* ignored */}
    }
    if (ps != null) {
        try {
            ps.close();
        } catch (SQLException e) { /* ignored */}
    }
    if (con != null) {
        
         
conexion.cerrarConexion();                 

                    
                    
		}
    
    
			ps=null;
			con=null;
                        rst=null;
                        
                }
                return emp;
         
     }
}
