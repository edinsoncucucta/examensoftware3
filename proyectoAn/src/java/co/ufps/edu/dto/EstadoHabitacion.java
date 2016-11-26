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
public class EstadoHabitacion {
    
    /*
    id serial NOT NULL,
  descripcion character varying(60) NOT NULL,
  CONSTRAINT estadoreserva_pkey PRIMARY KEY (id)
)
    **/
    
    
    
    private int id;
    
    private String descriccion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescriccion() {
        return descriccion;
    }

    public void setDescriccion(String descriccion) {
        this.descriccion = descriccion;
    }

  
    
    
    
    
}
