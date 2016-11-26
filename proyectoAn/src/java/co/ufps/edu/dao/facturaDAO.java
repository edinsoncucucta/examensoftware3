/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;
import co.ufps.edu.dto.Reserva;
import co.ufps.edu.dto.factura;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
    
}
