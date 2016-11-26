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
public class cuarto {
    
    /*
    
    idcuarto integer NOT NULL,
  precio integer NOT NULL,
  idtipo integer NOT NULL,
  detalle character varying(60),
  capacidad integer NOT NULL,
  idestado integer NOT NULL,
  descripcion character varying(255),
    
    
    
    **/
    
    
    
    private int idcuarto;
    private double precio;
    private int idtipo;
    private  String datalle;
    private int capacidad;
    private int idestado;
    private String descripccion;

    public int getIdcuarto() {
        return idcuarto;
    }

    public void setIdcuarto(int idcuarto) {
        this.idcuarto = idcuarto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(int idtipo) {
        this.idtipo = idtipo;
    }

    public String getDatalle() {
        return datalle;
    }

    public void setDatalle(String datalle) {
        this.datalle = datalle;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }

    public String getDescripccion() {
        return descripccion;
    }

    public void setDescripccion(String descripccion) {
        this.descripccion = descripccion;
    }
    
    
    
    
}
