/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import co.ufps.edu.dao.HuespedDAO;
import co.ufps.edu.dto.Huesped;
import java.util.List;

/**
 *
 * @author macaco
 */
public class ContorladorHuesped {
    
    private HuespedDAO huesped;

    public ContorladorHuesped() {
        this.huesped = new HuespedDAO();
    }

    public HuespedDAO getHuesped() {
        return huesped;
    }

    public void setHuesped(HuespedDAO huesped) {
        this.huesped = huesped;
    }
    
    //RECIBIR UN HUESPED DTO
    public Huesped RegistrarHuesped(Huesped h){
        Huesped j=null;
       try{
                j= this.huesped.CreateHuesped(h); 
                return j;
                
       }catch(Exception e){
           
           e.printStackTrace();
       }
  
        
        
        return j;
    }
    
    
    
    public List<Huesped> listarHuesped(){
       try{
           return huesped.ListarHuesped();
       } catch(Exception e){
           e.printStackTrace();
       }
       
       return null;
    }
    
    public List<Huesped> listarHuespedpor(int cc){
       try{
           return huesped.ListarHuespedPor(cc);
       } catch(Exception e){
           e.printStackTrace();
       }
       
       return null;
    }
    
}
