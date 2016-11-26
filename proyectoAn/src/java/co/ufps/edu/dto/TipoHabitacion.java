/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dto;

/**
 *
 * @author macaco
 */
public class TipoHabitacion {
    /*
    
    
    d_tipo numeric(50,0) NOT NULL,
  nombre character varying(70),
  preciobase numeric,
  
    **/
    
    
    private int id_tipo;
    private String nombre;
    private double preciobase;

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPreciobase() {
        return preciobase;
    }

    public void setPreciobase(double preciobase) {
        this.preciobase = preciobase;
    }
    
    
    
    
    
}
