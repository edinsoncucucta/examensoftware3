/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;
import co.ufps.edu.dto.EstadoHabitacion;
import co.ufps.edu.dto.TipoHabitacion;
import co.ufps.edu.dto.habitaciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ufps.edu.co.utils.conexion.Conexion;

/**
 *
 * @author macaco
 */
public class EstadoHabitacionDAO {
    private Conexion conexion;
    
    
     public EstadoHabitacion buscarestadoh(int id){
     		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                EstadoHabitacion estadoh =new EstadoHabitacion();
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM estadohabitacion "
					+    "WHERE id = ? ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
                       
			rst = ps.executeQuery();
			
			if(rst.next()){
				estadoh.setId(rst.getInt("id"));
                                estadoh.setDescriccion(rst.getString("descripcion"));
                                
                               
			}else{
                            estadoh=null;
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
                return estadoh;
    }
}
