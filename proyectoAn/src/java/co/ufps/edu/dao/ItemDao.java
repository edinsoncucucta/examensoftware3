/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import co.ufps.edu.dto.Cliente;
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.Item;
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
public class ItemDao {
    private Conexion conexion;
    
     public Item CreateItem(Item item){
        
       
		
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			
			if(conexion==null) 
                        conexion= new Conexion();
			if(conexion.getConnection()==null) 
                           con = conexion.conectar("");
			else con= conexion.getConnection();
                      
                     
			String sql = "INSERT INTO item (id_ser,id_cliente, id_reserva,cantidad,precio)"
                               
					+    "values (?,?,?,?,?) ";
                        
                        
			ps = con.prepareStatement(sql);
                        
                      
                    ps.setInt(1, item.getIdser());
                    ps.setInt(2, item.getId_cliente());
                    ps.setInt(3, item.getId_reserva());
                    ps.setInt(4, item.getCantidad());
                    ps.setInt(5, item.getPrecio());
                    
                     
                    
                    
                    

                    
			
			int consulta = ps.executeUpdate();
			
			if(consulta!=1){
                            item=null;
				
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
                return item;
        
    }
     
  //Todos los pedidos que ha hecho el cliente o huesped   
     
      public List<Item>Listaritempor(int idreserva){
        boolean var=true;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
                List<Item>items=new ArrayList<Item>();
                Item item ;
		try {
			
			if(conexion==null) conexion= new Conexion();
			if(conexion.getConnection()==null) con = conexion.conectar("");
			else con= conexion.getConnection();
			String sql = "SELECT * FROM item where id_reserva= ? "
					;
			ps = con.prepareStatement(sql);
			ps.setInt(1, idreserva);
                       
			rst = ps.executeQuery();
			
			while(rst.next()){
				item = new Item();
                                item.setCantidad(rst.getInt("cantidad"));
                                item.setId_cliente(rst.getInt("id_cliente"));
                                item.setIdser(rst.getInt("id_ser"));
                                item.setId_reserva(rst.getInt("id_reserva"));
                                item.setPrecio(rst.getInt("precio"));
                               
                                items.add(item);
			
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
                
                return items;
    
}
    
}
