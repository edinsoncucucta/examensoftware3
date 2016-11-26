/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.edu.co.utils.conexion;

import Negocio.ContorladorHuesped;
import co.ufps.edu.dto.Huesped;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author macaco
 */
public class prueba {
  
   public static void main(String []args) throws SQLException{
       
       
       
       ContorladorHuesped  s= new ContorladorHuesped();
       Huesped h= new Huesped();
       h.setCc(444444);
       h.setNacionalidad("colobiana");
       h.setNombre("jairo");
       h.setProcedencia("pamplona");
       Huesped f=s.RegistrarHuesped(h);
       if(f!=null){
           System.out.println("funciono");
       }
   }
    
}
