/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.Cliente;
import co.ufps.edu.dto.Servicios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.Conexion;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class servicioDAO {
 private clsConn cnn=new clsConn();
 private Conexion conexion;
    public servicioDAO() {
    }
    
 public String insertar (Servicios ser){
        String msm="error";
       ResultSet res= getCnn().consultaTabla("select max(id)+1 from servicio;");
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
     
       String sql ="INSERT INTO servicio(id,id_hotel,nombre,precio) VALUES ("+id+",1,'"+ser.getNombre()+"',"+ser.getPrecio()+");";

      SQLException exe= getCnn().insertar(sql);
          if(exe==null){
              msm="Ingreso correcto";
          }
     System.out.println("insertar "+msm+"    ");
        return msm;
    }
     public String actualizar(Servicios ser){
     ResultSet    msm= getCnn().consultaTabla("SELECT * From servicio where id="+ser.getId()+";");
    try {
        while (msm.next()){
           
            if(ser.getNombre()==null){
                ser.setNombre(msm.getString(3));
            }
            if(ser.getPrecio()==0){
                ser.setPrecio(msm.getInt(4));
            }
        }   
        
        String sql="UPDATE servicio SET nombre='"+ser.getNombre()+"',precio="+ser.getPrecio()+" WHERE id="+ser.getId()+";";
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        
    }
     return "";
     }
    
    public void eliminar(int id){
   int   msm= getCnn().verificar("DELETE FROM servicio WHERE id="+id+";");
   
    
 }
    public String tablaservicios() throws SQLException{
         String sql="select * from servicio;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #ee9d73; color: white;\">\n" +
                                "<th class=\"col text-center\">Identificacion</th>\n" +
                                "<th class=\"col text-center\">Descripcion</th>\n" +
                                "<th class=\"col text-center\">Precio</th>\n" +
                                "<th class=\"col text-center\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(4)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"servicio\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editar_servicios.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" id=+\"name\" name=\"tabla\" value=\""+msm.getString(3)+"\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla);
   }
    public clsConn getCnn() {
        return cnn;
    }
    
    
    
    
    
   public List<Servicios>ListarServicio(){
      
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                List<Servicios>servicios=new ArrayList<Servicios>();
                Servicios servicio=new Servicios() ;
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM servicio"
					;
			ps = con.prepareStatement(sql);
			
                       
			rst = ps.executeQuery();
			
			while(rst.next()){
                          
                            servicio=new Servicios();
                            
			   
       servicio.setId(rst.getInt("id"));
       servicio.setNombre(rst.getString("nombre"));
       servicio.setPrecio(rst.getInt("precio"));
                    
          
			servicios.add(servicio);
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
        try {
            con.close();
        } catch (SQLException e) { /* ignored */}
    }
                    
                    
                    
                    
                    
						
			ps=null;
			con=null;
                        rst=null;
    }
                
                return servicios;
    
}
   
   
    public Servicios lisTarserviciopor(int id){
   
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                Servicios servicio=new Servicios();
               
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM servicio "
					+    "WHERE id = ? ";
			ps = con.prepareStatement(sql);
                        ps.setInt(1,id);
			
                       
			rst = ps.executeQuery();
			
			if(rst.next()){
			 servicio=new Servicios();
                            
			   
                    servicio.setId(rst.getInt("id"));
                    servicio.setNombre(rst.getString("nombre"));
                    servicio.setPrecio(rst.getInt("precio"));
                    
			
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
        try {
            con.close();
        } catch (SQLException e) { /* ignored */}
    }
                    
                    
                    
                    
                    
						
			ps=null;
			con=null;
                        rst=null;
    }
                
                return servicio;
    
}
  
}

