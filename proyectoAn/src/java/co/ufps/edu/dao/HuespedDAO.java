/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.habitaciones;
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
 * @author macaco
 */
public class HuespedDAO {
    private Conexion conexion;
    private clsConn cnn;
    
    //si no hay problema se retorna null si no se retorna un objeto
    public Huesped CreateHuesped(Huesped huesped){
        
       
		
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			
			if(conexion==null) 
                        conexion= new Conexion();
			if(conexion.getConnection()==null) 
                           con = conexion.conectar("");
			else con= conexion.getConnection();
                     
			String sql = "INSERT INTO huesped (cc, nombre, nacionalidad,procedencia)  "
					+    "values (?,?,?,?) ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, huesped.getCc());
                        ps.setString(2, huesped.getNombre());
                        ps.setString(3, huesped.getNacionalidad());
                        ps.setString(4, huesped.getProcedencia());
			int consulta = ps.executeUpdate();
			
			if(consulta!=1){
                            huesped=null;
				
			}
			
		} catch (Exception e) {
                    System.out.println("error "+e.toString());
			e.printStackTrace();
			
                       
		} finally {
	
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
                     
		}
                return huesped;
        
    }
    
    
    public boolean validarExistencia(Huesped huesped){
       
		boolean var=true;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM huesped "
					+    "WHERE cc = ? ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, huesped.getCc());
                       
			rst = ps.executeQuery();
			
			if(rst.next()){
				var=false;
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
                return var;
        
    }
    
    public List<Huesped>ListarHuesped(){
        boolean var=true;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                List<Huesped>huespeds=new ArrayList<Huesped>();
                Huesped h ;
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM huesped "
					;
			ps = con.prepareStatement(sql);
			
                       
			rst = ps.executeQuery();
			
			while(rst.next()){
				h = new Huesped();
                                h.setCc(rst.getInt("cc"));
                                h.setIdcliente(rst.getInt("idcliente"));
                                h.setNacionalidad(rst.getString("nacionalidad"));
                                h.setNombre(rst.getString("nombre"));
                                h.setProcedencia(rst.getString("procedencia"));
                                huespeds.add(h);
			
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
                
                return huespeds;
    
}
      public List<Huesped>ListarHuespedPor(int cc){
        boolean var=true;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                List<Huesped>huespeds=new ArrayList<Huesped>();
                Huesped h ;
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM huesped "
					+    "WHERE cc = ? ";
			ps = con.prepareStatement(sql);
                        ps.setInt(1,cc);
			
                       
			rst = ps.executeQuery();
			
			if(rst.next()){
				h = new Huesped();
                                h.setCc(rst.getInt("cc"));
                                h.setIdcliente(rst.getInt("idcliente"));
                                h.setNacionalidad(rst.getString("nacionalidad"));
                                h.setNombre(rst.getString("nombre"));
                                h.setProcedencia(rst.getString("procedencia"));
                                huespeds.add(h);
			
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
                
                return huespeds;
    
}
      public String todoslosHuespedes() throws SQLException{
         String sql="select id,nombres, apellidos,cedula,direccion,telefono,nacionalidad,pasaporte,procedencia from huesped;";
        ResultSet   msm= getCnn().consultaTabla(sql);
        
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr>\n" +
                                "<th class=\" text-center\" Style=\"background-color:  #ee9d73; color: white;\">Identificacion</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Nombres</th>\n" +
               "<th class=\"col45 text-center\" Style=\"background-color:  #ee9d73; color: white;\">Apellidos</th>\n" +     
               "<th class=\"col45 text-center\" Style=\"background-color:  #ee9d73; color: white;\">Cedula</th>\n" +
               "<th class=\"col45 text-center\"Style=\"background-color:  #ee9d73; color: white;\">Dirección</th>\n" +
               "<th class=\"col45 text-center\" Style=\"background-color:  #ee9d73; color: white;\">Telefono</th>\n" +
              "<th class=\"col45 text-center\" Style=\"background-color:  #ee9d73; color: white;\">Nacionalidad</th>\n" +
               "<th class=\"col45 text-center\" Style=\"background-color:  #ee9d73; color: white;\">Pasaporte</th>\n" +
               "<th class=\"col45 text-center\" Style=\"background-color:  #ee9d73; color: white;\">Procedencia</th>\n" +
                                "<th class=\"col text-center\" Style=\"background-color:  #ee9d73; color: white;\">Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(2)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(4)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(5)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(6)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(7)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(8)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(9)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"huesped\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editar_Huesped.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\""+msm.getString(2)+" "+msm.getString(3)+"\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";

            }
     
      
       tabla+="</tbody></table></div>";
        return (tabla); 
      }
      public void eliminar(int id){
           int   msm= getCnn().verificar("DELETE FROM huesped WHERE id="+id+";");
      }
      
       public String actualizar(Huesped h){
     ResultSet    msm= getCnn().consultaTabla("SELECT * From huesped where id_hab="+h.getIdcliente()+";");
    try {
        while (msm.next()){
            if(h.getNombre()==""){
                h.setNombre(msm.getString(3));
            }
            if(h.getApellidos()==""){
                h.setApellidos(msm.getString(4));
            }
            if(h.getDir()==null){
                h.setDir(msm.getString(6));
            }
            if(h.getCc()==0){
                h.setCc(msm.getInt(5));
            }
             if(h.getTele()==0){
                h.setTele(msm.getInt(7));
            }
             if(h.getNacionalidad()==null){
                h.setNacionalidad(msm.getString(8));
            }
             if(h.getProcedencia()==null){
                h.setProcedencia(msm.getString(9));
            }
              if(h.getPasaporte()==null){
                h.setPasaporte(msm.getString(10));
            }
        }   
        String sql="UPDATE huesped SET id="+h.getIdcliente()+"id_hotel=1,nombres='"+h.getNombre()+"', apellidos='"+h.getApellidos()+"', cedula="+h.getCc()+"direccion='"+h.getDir()+"', telefono="+h.getTele()+", nacionalidad='"+h.getNacionalidad()+"',procedencia='"+h.getProcedencia()+"',pasaporte='"+h.getPasaporte()+"' WHERE id="+h.getIdcliente()+";";
    int i=getCnn().actualizar(sql);
    } catch (SQLException ex) {
        Logger.getLogger(daohabitaciones.class.getName()).log(Level.SEVERE, null, ex);
        
    }
     return "";
     }
     public clsConn getCnn() {
         if (cnn==null){
             cnn=new clsConn();
         }
        return cnn;
    }
}