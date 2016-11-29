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
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.Conexion;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author macaco
 */
public class facturaDAO {
    private clsConn cnn=new clsConn();
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
    
    public String BuscarFacturas(String ini, String fin) throws SQLException{
        String sql="select * from factura where fecha::timestamp::date >='"+ini+"' and fecha::timestamp::date <='"+fin+"';";
      ResultSet   msm= getCnn().consultaTabla(sql);
        int total =0;
       String tabla="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #ee9d73; color: white;\">\n" +
                                "<th class=\"col text-center\" >Id factura</th>\n" +
                               "<th class=\"col text-center\" >Habitación</th>\n" +
               "<th class=\"col text-center\" >Id Huesped</th>\n" +
               "<th class=\"col text-center\" >Fecha</th>\n" +
               "<th class=\"col text-center\" >Id Reserva</th>\n" +
               "<th class=\"col text-center\" >Total</th>\n" +
               "<th class=\"col text-center\" >Acciones</th>\n" +
                                "</tr>\n" +
                                   "\n" +"<tboby>";
       
       while(msm.next()){
                tabla+="<tr >";
                              tabla+="<td class=\"text-center\">"+msm.getInt(4)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getInt(2)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getInt(1)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getString(5)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getInt(7)+"</td>";
                              tabla+="<td class=\"text-center\">"+msm.getInt(3)+"</td>";
                              tabla+="<td class=\"text-center\">"+"<form class=\"form-horizontal\" action=\"eliminar.jsp\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"tabla\" value=\"prophab\" ><button type=\"warning\" class=\"btn btn-danger btn-xs\"<a type=\"hidden\" onclick=\"return confirm('Seguro de eliminar?');\"></a>Eliminar</button></form>"
                                      +"<form class=\"form-horizontal\" action=\"editarpropiedadeshab.jsp\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\""+msm.getInt(1)+"\" ><input type=\"hidden\" name=\"name\" value=\""+msm.getString(2)+"\" ><button type=\"warning\" class=\"btn btn-warning btn-xs\">Editar</button></form>"+ "</td>";
          tabla+="</tr>";
total+=msm.getInt(3);

            }

      
       tabla+="</tbody></table>";
          // tabla+= "<table><tr Style=\"background-color:  #2ca88d; color: white;\"><th class=\"col text-center\" >TOTAL ="+total+"</th></tr></table></div>" ;
        
           tabla+="<div class=\"panel-footer table-responsive\"><table class=\"table table-striped\">\n" +
                            "<thead>\n" +
                               "<tr Style=\"background-color:  #2ca88d; color: white;\">\n" +
                                "<th class=\"col text-center\" >El total de las facturas es: $"+total+"</th>\n"+
                                "</tr></table>";
                   return (tabla);
        }

  public clsConn getCnn() {
        return cnn;
        
        
    }
        
        
      
    
    
}
