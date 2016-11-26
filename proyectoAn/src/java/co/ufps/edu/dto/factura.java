/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class factura {
    /**
     idfactura serial NOT NULL,
  descripccion character varying(255) NOT NULL,
  fechagenerada date,
  idasignada integer NOT NULL,
     
     */
    
    
    private int id;
    private String servicios;
    private Calendar fechagenerada;
    private int idReserva;
    private int total;
    private int id_huesped;
    private int id_hab;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServicios() {
        return servicios;
    }

    public void setServicios(String servicios) {
        this.servicios = servicios;
    }

    public Calendar getFechagenerada() {
        return fechagenerada;
    }

    public void setFechagenerada(Calendar fechagenerada) {
        this.fechagenerada = fechagenerada;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getId_huesped() {
        return id_huesped;
    }

    public void setId_huesped(int id_huesped) {
        this.id_huesped = id_huesped;
    }

    public int getId_hab() {
        return id_hab;
    }

    public void setId_hab(int id_hab) {
        this.id_hab = id_hab;
    }

    
    
    public void total(List<Item>servi, TipoHabitacion t,Calendar fechai,Calendar fechafin){
        long timeinicial=fechai.getTimeInMillis();
        long timefinal=fechafin.getTimeInMillis();
        
        long diferencia=timefinal-timeinicial;
        double dias = Math.floor(diferencia / (1000 * 60 * 60 * 24));
        if(dias==0){
            dias=1;
        }
        
        int valinica=(int) (dias*t.getPreciobase());
        
        for(Item  ser:servi){
            valinica+=(ser.getPrecio()*ser.getCantidad());
        }
     this.total=valinica;  
    }
    
}
