package co.ufps.edu.dao;

import co.ufps.edu.dto.habitaciones;
import co.ufps.edu.dto.principal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import ufps.edu.co.utils.conexion.Conexion;
import ufps.edu.co.utils.conexion.clsConn;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author edinson
 */
public class principaldao {
    private Conexion c=new Conexion();
    private Connection con;
    private ResultSet rs;
    private PreparedStatement ps;
    private clsConn cnn=new clsConn();

    public principaldao()   {
  
     
    }
   
    public principal consultardatos() throws SQLException{
        principal p=new principal();
    ResultSet res= getCnn().consultaTabla("SELECT * FROM hotel;");
       int id=0; 
       try {
          while(res.next()){
                p.setNombre(res.getString(1));
                p.setSlogan(res.getString(2));
               p.setDir(res.getString(3));
               p.setTel(res.getInt(4));
               p.setCel(res.getInt(5));
               p.setVision(res.getString(7));
               p.setMision(res.getString(8));
               p.setObj(res.getString(9));
                
            }
           
       } catch (SQLException ex) {
           Logger.getLogger(tipohabitaciondao.class.getName()).log(Level.SEVERE, null, ex);
       }
       return p;
    }
    
    public String habitacionesMostrar(){
        String m="";
      String  sql1="select tipo, foto from habitaciones  group by tipo,foto; ";
    int preciob=0;
    String caracteristicas="";
    String tip="";
    
    ArrayList<Integer> tipo= new ArrayList<Integer>();
        try {
        ResultSet rs1=getCnn().consultaTabla(sql1);
           
            while(rs1.next()){
                if(!tipo.contains(rs1.getInt(1))){
                    tipo.add(rs1.getInt(1));
                  
                    String  sql2="select nombre,preciobase from tiposhabitaciones where id_tipo="+rs1.getInt(1)+"; ";
                      ResultSet rs2 =getCnn().consultaTabla(sql2);
                      while(rs2.next()){
                          tip=rs2.getString(1);
                          preciob=rs2.getInt(2);
                 
                      
                      
                      String  sql3="select ph.descripcion from propiedadesportipo p join propiedades ph on(p.id_descripcion=ph.id) where p.id_tipo="+rs1.getInt(1)+"; ";
                      ResultSet rs3 =getCnn().consultaTabla(sql3);
                      while(rs3.next()){
                          caracteristicas+=rs3.getString(1)+", ";
                          
                      }
                      
                    m+="<div class=\"portfolio logo1 mix_all port-big-grid wow bounceIn\" data-wow-delay=\"0.5s\" style=\"display: inline-block; opacity: 1;\">";
						m+="<div class=\"portfolio-wrapper\">";		
							m+="<a data-toggle=\"modal\" da1ta-target=\".bs-example-modal-md\"  class=\"b-link-stripe b-animate-go  thickbox\">";
						     m+="<span class=\"price\">$"+preciob+"</span>";
                                                        m+="<img class=\"p-img\" src=\""+rs1.getString(2)+"\" />";
                                                     
                                                     m+="<div class=\"b-wrapper\">";
						     m+="	<h2 class=\"b-animate b-from-left    b-delay03 \">";
						     		m+="<div class=\"caption\">";
						     			m+="<h4>"+rs2.getString(1)+"</h4>";
						     			m+="<p>"+caracteristicas+"</p>";
						     		m+="</div>";
						     	m+="</h2>";
						  	m+="</div></a>";
		                m+="</div>";

					m+="</div>";	
                     
		caracteristicas="";
                }}
            }
            
    } catch (SQLException ex) {
            Logger.getLogger(principaldao.class.getName()).log(Level.SEVERE, null, ex);
        }

    return m;
}
   
     public clsConn getCnn() {
        return cnn;
        
        
    }
     public String mostrarEvent(){
        String m="";
      String  sql1="select * from eventos  where id_hotel=1 ";
    int preciob=0;
    String caracteristicas="";
    String tip="";
        try {
        ResultSet rs1=getCnn().consultaTabla(sql1);
           
            while(rs1.next()){
                
                    m+= "<div class=\"blog-grid-left wow bounceIn\" data-wow-delay=\"0.4s\">"
               + "<div class=\"blog-art-pic\"><img src=\""+rs1.getString(4)+"\" title=\"name\" /></div>";
					m+="<div class=\"blog-art-info\">";
						m+="<h3><a>"+rs1.getString(5)+"</a></h3>";
						m+="<p>"+rs1.getString(3)+"</p>";
		m+="</div></div>";
                }
            }
            
    catch (SQLException ex) {
            Logger.getLogger(principaldao.class.getName()).log(Level.SEVERE, null, ex);
        }
     return m;
     }
     
     
     public String tiposh(){
         String sql1="select nombre from tiposhabitaciones";  
         ResultSet rs2 =getCnn().consultaTabla(sql1);
         String m="<ul id=\"filters\" class=\"clearfix\">";
        try {
            while(rs2.next()){
                m+="<li class=\"filtter-color1\"><span class=\"filter active\" >"+rs2.getString(1)+"</span></li>";
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(principaldao.class.getName()).log(Level.SEVERE, null, ex);
        }
        m+="</ul>";
        return m;
     }
}
  