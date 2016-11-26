/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dto;

import java.util.Calendar;

/**
 *
 * @author macaco
 */
public class Reserva {
    /**
     
     
       id serial NOT NULL,
  id_cliente integer NOT NULL,
  "fecha inicial" date NOT NULL,
  fechafin date NOT NULL,
  id_hab integer NOT NULL,
  estado integer NOT NULL,
     */
    
    private int id;
    private int id_cliente;
   private Calendar fechainicio;
   private Calendar fechafin;
   private int id_hab;
   private int estado;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public Calendar getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(Calendar fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Calendar getFechafin() {
        return fechafin;
    }

    public void setFechafin(Calendar fechafin) {
        this.fechafin = fechafin;
    }

    public int getId_hab() {
        return id_hab;
    }

    public void setId_hab(int id_hab) {
        this.id_hab = id_hab;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
   
   
    
}
