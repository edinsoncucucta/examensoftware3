/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import Negocio.ContorladorEmpleado;
import Negocio.ContorladorHuesped;
import Negocio.ControladorClientes;
import Negocio.ControladorHabitacion;
import Negocio.ControladorReserva;
import co.ufps.edu.dto.Cliente;
import co.ufps.edu.dto.EstadoHabitacion;
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.Item;
import co.ufps.edu.dto.Reserva;
import co.ufps.edu.dto.Servicios;
import co.ufps.edu.dto.TipoHabitacion;
import co.ufps.edu.dto.empleado;
import co.ufps.edu.dto.factura;
import co.ufps.edu.dto.habitaciones;
import java.util.List;

/**
 *
 * @author macaco
 */
public class ControladorNegocio {
    private ContorladorHuesped contorladorH;
    private ControladorHabitacion h;
    
    private ControladorClientes cliente;
    private ControladorReserva reserva;
    private static ControladorNegocio con;
    
   private ContorladorEmpleado empleado;

    public ControladorNegocio() {
        
        contorladorH= new ContorladorHuesped();
        h=new ControladorHabitacion();
        cliente= new ControladorClientes();
        reserva = new ControladorReserva();
        empleado = new ContorladorEmpleado();
    }
    public static ControladorNegocio getInstance(){
        if(con==null){
            con = new ControladorNegocio();
           
        }
        
        return con;
        
    }
    public List<Huesped> listarUsuario(){
        return contorladorH.listarHuesped();
    }
     public List<Huesped> listarUsuariopor(int cc){
        return contorladorH.listarHuespedpor(cc);
    }
    
     
     public Huesped registrarH(Huesped h){
         return contorladorH.RegistrarHuesped(h);
     }
     
     
     
     public List<habitaciones>listarh(){
       return h.consultarhabitaciones();  
     }
     
     
     public habitaciones buscarh(int id){
         return h.buscarh(id);
     }
     
     
     public EstadoHabitacion consultarEstadoHabitacion(int id){
         return h.buscarEstado(id);
     }
     
     public TipoHabitacion consultarTipoh(int id){
         return h.consultarTipo(id);
     }
     
     
     
     
     public List<Cliente>listarCliente(){
         return cliente.listarCliente();
     }
    
     
     public Cliente crearCliente(Cliente c){
         return cliente.crearCliente(c);
     }
     
     
    
     public Reserva crearReserva(Reserva  r){
       return reserva.createReserva(r);
     }
     
     public Reserva buscarReservaporHuesped(int numh){
         return reserva.listarReservaporhuesped(numh);
     }
     
     public Cliente ListarClientepor(int cc){
         return cliente.ListarHuespedpor(cc);
     }
     
     public Cliente ListarClientePorid(int id){
          return cliente.ListarHuespedporid(id);
     }
     
     
     public List<Servicios>ListarSErvicio(){
         return reserva.ListarSErvicios();
     }
     
     public Servicios listarserviciopor(int id){
         return reserva.listarserviciopor(id);
     }
     
     public Item createItem(Item item){
        return reserva.createItem(item);
     }
     
     public Reserva buscarReservapor(int id){
        return reserva.buscarReservaporid(id);
     }
     
     
     public empleado login(empleado emp){
         return empleado.login(emp);
     }
     
     public habitaciones updateestadohabi(habitaciones hu){
         return h.supdatehabi(hu);
     }
     
     public habitaciones buscarhporid(int id){
         return h.buscahabiporid(id);
     }
     
     public List<Item>listaritempo(int id_reserva){
         return reserva.listaritempor(id_reserva);
     }
     
     public factura createfactura(factura f){
         return reserva.createFactura(f);
     }
     
     public Reserva updateReserva(Reserva r){
         return reserva.updateReserva(r);
     }
}
