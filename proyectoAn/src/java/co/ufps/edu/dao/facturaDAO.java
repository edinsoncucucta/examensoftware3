/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.Reserva;
import co.ufps.edu.dto.TipoHabitacion;
import co.ufps.edu.dto.factura;
import co.ufps.edu.dto.habitaciones;
import co.ufps.edu.dto.propiedadeshab;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import ufps.edu.co.utils.conexion.Conexion;

/**
 *
 * @author macaco
 */
public class facturaDAO {
    
    private Conexion conexion;
    
    public factura crearfactura(factura factu){
        
       SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		
		Connection con=null;
		PreparedStatement ps=null;
               java.sql.Timestamp fecha = new java.sql.Timestamp(factu.getFechagenerada().getTime().getTime());

		
		try {
			
			if(conexion==null) 
                        conexion= new Conexion();
			if(conexion.getConnection()==null) 
                           con = conexion.conectar("");
			else con= conexion.getConnection();
                     
			String sql = "INSERT INTO factura (id_huesped, id_hab, total,fecha,servicios,id_reserva)  "
					+    "values (?,?,?,?,?,?) ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, factu.getId_huesped());
                        ps.setInt(2, factu.getId_hab());
                        ps.setInt(3, factu.getTotal());
                        ps.setTimestamp(4, fecha);
                        ps.setString(5, factu.getServicios());
                        ps.setInt(6, factu.getIdReserva());
                        
			int consulta = ps.executeUpdate();
			//consulta tablas que se actualizaron 
			if(consulta!=1){
                            factu=null;
				
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
                return factu;
        
    }
    
    
    
    
    
    public Huesped huespedofactura(int idfactura){
     		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                TipoHabitacion tipoh =new TipoHabitacion();
                Huesped h = new Huesped();
                
                
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT huesped.* " +
"                                FROM huesped " +
"                                    JOIN factura " +
"                                    ON huesped.id=factura.id_huesped where factura.id_fac=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idfactura);
                       
			rst = ps.executeQuery();
                        
			
			if(rst.next()){
                         
                               h.setCc(rst.getInt("cc"));
                                h.setIdcliente(rst.getInt("idcliente"));
                                h.setNacionalidad(rst.getString("nacionalidad"));
                                h.setNombre(rst.getString("nombre"));
                                h.setProcedencia(rst.getString("procedencia"));
                                h.setApellidos(rst.getString("apellidos"));
                                h.setDir(rst.getString("direccion"));
                                h.setPasaporte(rst.getString("pasaporte"));
                                h.setTele(rst.getInt("telefono"));
                                
                               
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
                return h;
    }
    
     public habitaciones habitacionoffactura(int idfactura){
     		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                TipoHabitacion tipoh =new TipoHabitacion();
                habitaciones h = new habitaciones();
                
                
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT habitaciones.* " +
"                                FROM habitaciones " +
"                                    JOIN factura " +
"                                    ON habitaciones.id_hab=factura.id_hab where factura.id_fac=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idfactura);
                       
			rst = ps.executeQuery();
                        
			
			if(rst.next()){
                         
                               h.setEstado(rst.getInt("estado"));
                               h.setFoto(rst.getString("foto"));
                               h.setId(rst.getInt("id_hab"));
                               h.setTipo(rst.getInt("tipo"));
                              h.setObservacion(rst.getString("Observacion"));
                               
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
                return h;
    }
    
     
     
     
     
     
     public Reserva reservaoffactura(int idfactura){
     		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
               
                Reserva  r = new Reserva();
                 Calendar fechainicio= new GregorianCalendar();
                Calendar fechafin=new GregorianCalendar();
                
                
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT reserva.* " +
"                                FROM reserva " +
"                                    JOIN factura " +
"                                    ON reserva.id=factura.id_reserva where factura.id_fac=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idfactura);
                       
			rst = ps.executeQuery();
                        
			
			if(rst.next()){
                         
                          r.setEstado(rst.getInt("estado"));
                                r.setId(rst.getInt("id"));
                                //asi parseamos la fecha de  tiemstamp a Calendar nota: los milisegundos no pasan todos
                             fechainicio.setTimeInMillis(rst.getTimestamp("fechainicial").getTime());
                             fechafin.setTimeInMillis(rst.getTimestamp("fechafin").getTime());
                             
                             r.setFechainicio(fechainicio);
                             r.setFechafin(fechafin);
                             
                             r.setId_cliente(rst.getInt("id_cliente"));
                              r.setId_hab(rst.getInt("id_hab"));
                              
                               
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
                return r;
    }
    
     
     
     
     public factura consultarFactura(int idfactura){
     		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
               
                factura  r = new factura();
                 
                
                
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * from factura where id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idfactura);
                       
			rst = ps.executeQuery();
                        
			
			if(rst.next()){
                         
                         r.setTotal(rst.getInt("total"));
                         r.setId(rst.getInt("id_fac"));
                              
                               
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
                return r;
    }
     
     
     public factura consultarFacturaporreserva(int idreserva){
     		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
               
                factura  r = new factura();
                 
                
                
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * from factura where id_reserva=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idreserva);
                       
			rst = ps.executeQuery();
                        
			
			if(rst.next()){
                         
                         r.setTotal(rst.getInt("total"));
                         r.setId(rst.getInt("id_fac"));
                         
                              
                               
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
                return r;
    }
    
    
    
}
