/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;
import co.ufps.edu.dto.Cliente;
import co.ufps.edu.dto.EstadoHabitacion;
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.TipoHabitacion;
import co.ufps.edu.dto.habitaciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ufps.edu.co.utils.conexion.Conexion;
/**
 *
 * @author macaco
 */
public class ClientesDAO {
    
    private Conexion conexion;
    
    //si no hay problema se retorna null si no se retorna un objeto
    public Cliente Createcliente(Cliente cliente){
        
       
		
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			
			if(conexion==null) 
                        conexion= new Conexion();
			if(conexion.getConnection()==null) 
                           con = conexion.conectar("");
			else con= conexion.getConnection();
                        /*
                        
                        
                         id serial NOT NULL,
  id_hotel numeric(10,0) NOT NULL,
  nombres character varying(40) NOT NULL,
  apellidos character varying(40) NOT NULL,
  cedula numeric NOT NULL,
  direccion character varying(60) NOT NULL,
  telefono numeric NOT NULL,
  nacionalidad character varying(60) NOT NULL,
  procedencia character varying(60) NOT NULL,
  pasaporte character varying(100),
                        
                        **/
                     
			String sql = "INSERT INTO huesped (id_hotel,cedula, nombres, apellidos,direccion,telefono,nacionalidad,"
                                + "pasaporte,procedencia)  "
					+    "values (?,?,?,?,?,?,?,?,?) ";
                        
                        
			ps = con.prepareStatement(sql);
                        
                      
                    ps.setInt(1, 1);
                    ps.setInt(2, cliente.getCedula());
                    ps.setString(3,cliente.getNombre());
                    ps.setString(4, cliente.getApellidos());
                    ps.setString(5, cliente.getDireccion());
                    ps.setInt(6, cliente.getTelefono());
                    ps.setString(7, cliente.getNacionalidad());
                    ps.setString(8, cliente.getPasaporte());
                    ps.setString(9, cliente.getProcedencia());
                     
                    
                    
                    

                    
			
			int consulta = ps.executeUpdate();
			
			if(consulta!=1){
                            cliente=null;
				
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
                return cliente;
        
    }
    
    
   public List<Cliente>ListarCliente(){
        boolean var=true;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                List<Cliente>clientes=new ArrayList<Cliente>();
                Cliente cliente=new Cliente() ;
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM huesped "
					;
			ps = con.prepareStatement(sql);
			
                       
			rst = ps.executeQuery();
			
			while(rst.next()){
                            /*
                            
                            
                              id serial NOT NULL,
  id_hotel numeric(10,0) NOT NULL,
  nombres character varying(40) NOT NULL,
  apellidos character varying(40) NOT NULL,
  cedula numeric NOT NULL,
  direccion character varying(60) NOT NULL,
  telefono numeric NOT NULL,
  nacionalidad character varying(60) NOT NULL,
  procedencia character varying(60) NOT NULL,
  pasaporte character varying(100),
                            **/
                            cliente=new Cliente();
                            
			   
                    cliente.setId(rst.getInt("id"));
                    cliente.setCedula(rst.getInt("cedula"));
                    cliente.setApellidos(rst.getString("apellidos"));
                    cliente.setNombre(rst.getString("nombres"));
                    cliente.setNacionalidad(rst.getString("nacionalidad"));
                    cliente.setPasaporte(rst.getString("pasaporte"));
                    cliente.setProcedencia(rst.getString("procedencia"));
                    cliente.setDireccion(rst.getString("direccion"));
                    cliente.setTelefono(rst.getInt("telefono"));
                    
          
			clientes.add(cliente);
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
                
                return clientes;
    
}
    
  public Cliente ListarClientepor(int cc){
   
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                Cliente cliente=new Cliente();
               
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM huesped "
					+    "WHERE cedula = ? ";
			ps = con.prepareStatement(sql);
                        ps.setInt(1,cc);
			
                       
			rst = ps.executeQuery();
			
			if(rst.next()){
			 cliente=new Cliente();
                            
			   
                    cliente.setId(rst.getInt("id"));
                    cliente.setCedula(rst.getInt("cedula"));
                    cliente.setApellidos(rst.getString("apellidos"));
                    cliente.setNombre(rst.getString("nombres"));
                    cliente.setNacionalidad(rst.getString("nacionalidad"));
                    cliente.setPasaporte(rst.getString("pasaporte"));
                    cliente.setProcedencia(rst.getString("procedencia"));
                    cliente.setDireccion(rst.getString("direccion"));
                    cliente.setTelefono(rst.getInt("telefono"));
                    
			
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
                
                return cliente;
    
}
  
  
  
  
  
  public Cliente ListarClienteporid(int id){
   
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                Cliente cliente=new Cliente();
               
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM huesped "
					+    "WHERE id = ? ";
			ps = con.prepareStatement(sql);
                        ps.setInt(1,id);
			
                       
			rst = ps.executeQuery();
			
			if(rst.next()){
			 cliente=new Cliente();
                            
			   
                    cliente.setId(rst.getInt("id"));
                    cliente.setCedula(rst.getInt("cedula"));
                    cliente.setApellidos(rst.getString("apellidos"));
                    cliente.setNombre(rst.getString("nombres"));
                    cliente.setNacionalidad(rst.getString("nacionalidad"));
                    cliente.setPasaporte(rst.getString("pasaporte"));
                    cliente.setProcedencia(rst.getString("procedencia"));
                    cliente.setDireccion(rst.getString("direccion"));
                    cliente.setTelefono(rst.getInt("telefono"));
                    
			
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
                
                return cliente;
    
}
    
    
}
