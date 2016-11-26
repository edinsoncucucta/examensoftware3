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
public class Cliente {
    
    /*
    
    id serial NOT NULL,
  id_hotel numeric(10,0) NOT NULL,
  nombres character varying(40) NOT NULL,
  apellidos character varying(40) NOT NULL,
  cedula numeric NOT NULL,
  direccion character varying(60) NOT NULL,
  telefono numeric NOT NULL,
  nacionalidad character varying(60) NOT NULL,
  procedencia character varying(60) NOT NULL,
  pasaporte character varying(100),
    **/
    
    
    private  int id;
    private String nombre;
    private String apellidos;
    private int cedula;
    private  String direccion;
    private int telefono;
    private String nacionalidad;
    private String procedencia;
    private  String pasaporte;

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

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getProcedencia() {
        return procedencia;
    }

    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }
    
    
    
    
    
    
    
    
    
    
    

    
    
    
}
