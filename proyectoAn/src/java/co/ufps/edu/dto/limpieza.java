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
public class limpieza {

    
    int id_hab;
    int id_emp;

    public limpieza() {
    }

    public limpieza(int id_hab, int id_emp) {
        this.id_hab = id_hab;
        this.id_emp = id_emp;
    }
    public int getId_hab() {
        return id_hab;
    }

    public void setId_hab(int id_hab) {
        this.id_hab = id_hab;
    }

    public int getId_emp() {
        return id_emp;
    }

    public void setId_emp(int id_emp) {
        this.id_emp = id_emp;
    }
}
