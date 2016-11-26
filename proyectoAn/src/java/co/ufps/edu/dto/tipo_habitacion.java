/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dto;

/**
 *
 * @author EDINSON
 */
public class tipo_habitacion {
    int id;
    String nombre;
    int preciobase;

    public tipo_habitacion() {
    }

    public tipo_habitacion(int id, String nombre, int preciobase) {
        this.id = id;
        this.nombre = nombre;
        this.preciobase = preciobase;
    }

    public tipo_habitacion(String nombre, int preciobase) {
        this.nombre = nombre;
        this.preciobase = preciobase;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPreciobase() {
        return preciobase;
    }

    public void setPreciobase(int preciobase) {
        this.preciobase = preciobase;
    }
    
    
}
