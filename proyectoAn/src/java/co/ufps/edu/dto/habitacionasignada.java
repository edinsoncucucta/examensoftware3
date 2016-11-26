/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.ufps.edu.dto;

import java.sql.Date;

/**
 *
 * @author macaco
 */
public class habitacionasignada {
    
    /**
     idasignada integer NOT NULL,
  idhuesped integer,
  idcuarto integer,
  fechainicio date,
  fechafin date,
  procedencia character varying(255),
     
     
     */
    
    private int idasignada;
    private int idhuesped;
    private int idcuarto;
    private Date fechainicio;
    private Date fechafin;
    private String procedencia;

    public int getIdasignada() {
        return idasignada;
    }

    public void setIdasignada(int idasignada) {
        this.idasignada = idasignada;
    }

    public int getIdhuesped() {
        return idhuesped;
    }

    public void setIdhuesped(int idhuesped) {
        this.idhuesped = idhuesped;
    }

    public int getIdcuarto() {
        return idcuarto;
    }

    public void setIdcuarto(int idcuarto) {
        this.idcuarto = idcuarto;
    }

    public Date getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Date getFechafin() {
        return fechafin;
    }

    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    public String getProcedencia() {
        return procedencia;
    }

    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }
    
    
    
}
