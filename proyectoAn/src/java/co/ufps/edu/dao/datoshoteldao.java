/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ufps.edu.co.utils.conexion.Conexion;
import co.ufps.edu.dto.principal;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author EDINSON
 */
public class datoshoteldao  {
  
private clsConn cnn=new clsConn();
    public datoshoteldao()  {
      
    }
    
    public void agregar(principal p) throws SQLException{
     if(estavacio()==true){
         System.out.println("esta vacido");
         ingresar(p);
         
     }
     else{
           System.out.println("esta lleno");
         actualizar(p);
     }
        }
    public boolean  estavacio(){
       String sql="SELECT * From hotel;";
if (    getCnn().verificar(sql) == -1){
 System.err.print(getCnn().verificar(sql) );
return true;}
return false; 
    }
    
    public void ingresar(principal p){
        String sql ="INSERT INTO hotel VALUES ('"+p.getNombre()+"','"+ p.getSlogan()+"','"+ p.getDir()+"',"+p.getTel()+","+p.getCel()+","+1+",'"+p.getMision()+"','"+p.getVision()+"','"+p.getObj()+"');";
        
       SQLException exe= getCnn().insertar(sql);

    }
    public void actualizar(principal p){
        String sql ="UPDATE hotel SET Nombre='"+p.getNombre()+"',Slogan='"+ p.getSlogan()+"',Direccion='"+ p.getDir()+"',telefono="+p.getTel()+",celular="+p.getCel()+",id="+1+",Mision='"+p.getMision()+"',vision='"+p.getVision()+"',obj='"+p.getObj()+"' WHERE id=1;";
 

       int exe= getCnn().actualizar(sql);
   
       
    }
    
     public clsConn getCnn() {
        return cnn;
    }
       public String configurar(){
          String rta ="";
          if(estavacio()){
              return rta;
          }else{
              rta=" <div class=\"row\">"
			+"<div class=\"col-xs-12 col-md-6 col-lg-12\">"
				+"<div class=\"panel panel-blue panel-widget \">"
					+"<div class=\"row no-padding\">"
						+"<div class=\"col-sm-3 col-lg-3 widget-left\">"
                                                    
                                                              +"<a class=\"list-group-item\" href=\"Datos_servicios.jsp\"><i class=\"fa fa-life-ring fa-lg\" aria-hidden=\"true\"></i>&nbsp;Servicios del hotel</a>"
                                                                
						+"</div>"
                                                  +"<div class=\"col-sm-3 col-lg-3 widget-left\">"
                                                    
							
                                         
                                                              +"<a class=\"list-group-item\" href=\"Datos_tipo_habitacion.jsp\"><i class=\"fa fa-key fa-x3\" aria-hidden=\"true\"></i>&nbsp;Tipos de habitaciones</a>"
                                                                   
						+"</div>"
                                                +"<div class=\"col-sm-3 col-lg-3 widget-left\">"
                                                    
							
                                         
                                                              +"<a class=\"list-group-item\" href=\"Datos_propiedadesHab.jsp\"><i class=\"fa fa-television fa-lg\" aria-hidden=\"true\"></i>&nbsp;Detalles de la habitacion</a>"
                                                      
						+"</div>"
                                                +"<div class=\"col-sm-3 col-lg-3 widget-left\">"
                                                    
                                                              +"<a class=\"list-group-item\" href=\"Estado_reserva.jsp\"><i class=\"fa fa-cog fa-lg\" aria-hidden=\"true\"></i>&nbsp;Tipos de estado reserva</a>"
                                                             
					+"</div>"
                                    +"</div>"
				+"</div>"
			+"</div>"
			
		+"</div><!--/.row-->";
         return rta;
          }
       }
public principal datos(){
    principal p= new principal();
    ResultSet    msm= getCnn().consultaTabla("SELECT * From hotel;");
      
    try {
        while(msm.next()){
             p.setNombre(msm.getString(1));
             p.setSlogan(msm.getString(2));
             p.setTel(msm.getInt(4));
             p.setCel(msm.getLong(5));
             p.setDir(msm.getString(3));
             p.setObj(msm.getString(9));
             p.setVision(msm.getString(8));
             p.setMision(msm.getString(7));
       System.out.print(p.getNombre());
        }
    } catch (SQLException ex) {
        Logger.getLogger(datoshoteldao.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    return p;
}
      
       
     
    }
    
    
    
 
