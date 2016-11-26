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
public class propiedadeshab {
    int id;
    String descripcion;
    int inc;

    public propiedadeshab() {
    }

    public propiedadeshab(String descripcion, int inc) {
        this.descripcion = descripcion;
        this.inc = inc;
    }

    public propiedadeshab(int id, String descripcion, int inc) {
        this.id = id;
        this.descripcion = descripcion;
        this.inc = inc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getInc() {
        return inc;
    }

    public void setInc(int inc) {
        this.inc = inc;
    }
    
    
    
}
