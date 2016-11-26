/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dto;

import ufps.edu.co.utils.conexion.clsConn;

/**
 *
 * @author edinson
 */
public class habitaciones {
  int id;
  int tipo;
  int estado;
  String foto;
  String Observacion;
  private clsConn cnn=new clsConn();

    public habitaciones() {
   this.id = 0;
        this.tipo = 0;
        this.estado = 0;
        this.foto = null;
    }

  
  
    public habitaciones(int id, int tipo, int estado, String foto, String Observacion) {
        this.id = id;
        this.tipo = tipo;
        this.estado = estado;
        this.foto = foto;
        this.Observacion = Observacion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

    public clsConn getCnn() {
        return cnn;
    }

    public void setCnn(clsConn cnn) {
        this.cnn = cnn;
    }

    @Override
    public String toString() {
        return "habitaciones{" + "id=" + id + ", tipo=" + tipo + ", estado=" + estado + ", foto=" + foto + '}';
    }

    

   
    
    
    
  
  
    
}
