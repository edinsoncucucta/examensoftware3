/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import co.ufps.edu.dao.empleadoDAO;
import co.ufps.edu.dto.empleado;

/**
 *
 * @author macaco
 */
public class ContorladorEmpleado {
    
    private empleadoDAO empleado;
    
    public ContorladorEmpleado(){
        empleado= new empleadoDAO();
    }
    
    
    
    public empleado login(empleado emp){
       return empleado.login(emp);
    }
}
