/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import co.ufps.edu.dao.EstadoHabitacionDAO;
import co.ufps.edu.dao.daohabitaciones;
import co.ufps.edu.dao.propiedadeshabDAO;
import co.ufps.edu.dao.tipoHabitacionesDAO;
import co.ufps.edu.dto.EstadoHabitacion;
import co.ufps.edu.dto.TipoHabitacion;
import co.ufps.edu.dto.fotosHab;
import co.ufps.edu.dto.habitaciones;
import co.ufps.edu.dto.propiedadeshab;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macaco
 */
public class ControladorHabitacion {
    
    private daohabitaciones habi;
    private tipoHabitacionesDAO tipoH;
    private EstadoHabitacionDAO estado;
    private propiedadeshabDAO propiedades;
    
    
    public ControladorHabitacion (){
        habi= new daohabitaciones();
        tipoH = new tipoHabitacionesDAO();
        estado=new EstadoHabitacionDAO();
        propiedades= new propiedadeshabDAO();
    }
    
    
    public List<habitaciones>consultarhabitaciones(){
        
        return habi.listarh();
    }
    
    public habitaciones buscarh(int id){
        return habi.buscarh(id);
    }
    
    
    
    //adcionales
    
    
    public TipoHabitacion consultarTipo(int id){
        
        return tipoH.buscartipoh(id);
    }
    
    public EstadoHabitacion buscarEstado(int id){
        
        return estado.buscarestadoh(id);
    }
    
    
    public habitaciones supdatehabi(habitaciones h){
        return habi.updateEstadohabi(h);
    }
    
    
    public habitaciones buscahabiporid(int id){
        return habi.buscarh(id);
    }
    
   public ArrayList<propiedadeshab> propiedadesportipo(int idtipo){
      return  propiedades.buscarpropiedadespor(idtipo);
       
   }
   
   
   public ArrayList<fotosHab>fotoshabitacion(int id_hab){
       return habi.traerfotoscuarto(id_hab);
   }
}
