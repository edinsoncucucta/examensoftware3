/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import co.ufps.edu.dao.ClientesDAO;
import co.ufps.edu.dto.Cliente;
import java.util.List;

/**
 *
 * @author macaco
 */
public class ControladorClientes {
    
    private ClientesDAO cliente;
    public ControladorClientes(){
        cliente= new ClientesDAO();
    }
    
    public List<Cliente>listarCliente(){
        return cliente.ListarCliente();
    }
    
    public Cliente crearCliente(Cliente c){
        return cliente.Createcliente(c);
        
    }
    public Cliente  ListarHuespedpor(int cc)
    {
        return cliente.ListarClientepor(cc);
    }    
    
    public Cliente ListarHuespedporid(int id){
        return cliente.ListarClienteporid(id);
    }
}
