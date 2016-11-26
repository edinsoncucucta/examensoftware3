/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.Reserva;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import ufps.edu.co.utils.conexion.Conexion;
import ufps.edu.co.utils.conexion.clsConn;
/**
 *
 * @author macaco
 */
public class ReservaDAO {
    
    private Conexion conexion;
    private clsConn cnn;
    
    public clsConn getCnn() {
         if (cnn==null){
             cnn=new clsConn();
         }
        return cnn;
    }
     public Reserva crearReserva(Reserva reserva){
        
       SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		
		Connection con=null;
		PreparedStatement ps=null;
               java.sql.Timestamp fecha = new java.sql.Timestamp(reserva.getFechainicio().getTime().getTime());

		
		try {
			
			if(conexion==null) 
                        conexion= new Conexion();
			if(conexion.getConnection()==null) 
                           con = conexion.conectar("");
			else con= conexion.getConnection();
                     
			String sql = "INSERT INTO reserva (id_cliente, fechainicial, fechafin,id_hab,estado)  "
					+    "values (?,?,?,?,?) ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reserva.getId_cliente());
                        //ps.setString(2, sdf.format(reserva.getFechainicio().getTime()));
                        ps.setTimestamp(2, fecha);
                        ps.setTimestamp(3, fecha);
                        ps.setInt(4,reserva.getId_hab());
                        ps.setInt(5, reserva.getEstado());
                        
			int consulta = ps.executeUpdate();
			//consulta tablas que se actualizaron 
			if(consulta!=1){
                            reserva=null;
				
			}
			
		} catch (Exception e) {
                    System.out.println("error "+e.toString());
			e.printStackTrace();
			
                       
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				
			}
						
			ps=null;
			con=null;
		}
                return reserva;
        
    }
     /*JOIN
     
    listar reserva por huesped
     **/
     
      public Reserva ListarReservaPorHuesped(int numhab){
      
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                Calendar fechainicio= new GregorianCalendar();
                Calendar fechafin=new GregorianCalendar();
                
               Reserva r=new Reserva() ;
		try {
				if(conexion==null){
                            conexion= new Conexion();
                }
			if(conexion.getConnection()==null) {
                            con = conexion.conectar("");
                        }
                        else{ con= conexion.getConnection();}
			String sql = "SELECT * FROM reserva where id_hab=? and estado=1";
			ps = con.prepareStatement(sql);
                       ps.setInt(1,numhab);
			
                       
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
                              
                               
			
                        }else{
                            r=null;
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
            
            //con.close();
            //conexion.cerrarConexion();
            
           
            conexion.getConnection().close();
            
          
        } catch (SQLException e) { /* ignored */}
    }
                    
                    
                    
                    
                    
						
			ps=null;
			con=null;
                        rst=null;
    }
                
                return r;
    
}
      
      
      
      
         public Reserva ListarReservaPoid(int id){
      
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                Calendar fechainicio= new GregorianCalendar();
                Calendar fechafin=new GregorianCalendar();
                
               Reserva r=new Reserva() ;
		try {
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM reserva where id= ?";
			ps = con.prepareStatement(sql);
                       ps.setInt(1,id);
			
                       
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
                              
                               
			
                        }else{
                            r=null;
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
    public Reserva updateReserva(Reserva f){
                       java.sql.Timestamp fecha = new java.sql.Timestamp(f.getFechafin().getTime().getTime());

  String sql="UPDATE reserva SET fechafin='"+fecha+"', estado="+3+" WHERE id="+f.getId()+";";
    int i=getCnn().actualizar(sql);
   return f;
  }
    
    
}
