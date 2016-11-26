/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import co.ufps.edu.dao.ItemDao;
import co.ufps.edu.dao.ReservaDAO;
import co.ufps.edu.dao.facturaDAO;
import co.ufps.edu.dao.servicioDAO;
import co.ufps.edu.dto.Item;
import co.ufps.edu.dto.Reserva;
import co.ufps.edu.dto.Servicios;
import co.ufps.edu.dto.factura;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macaco
 */
public class ControladorReserva {
    private ReservaDAO reserva;
    private servicioDAO servicio;
    private ItemDao item;
    private facturaDAO factura;
    public ControladorReserva(){
        reserva= new ReservaDAO();
        servicio= new servicioDAO();
        item = new ItemDao();
        factura = new facturaDAO();
    }
    
    public Reserva createReserva(Reserva r){
        return reserva.crearReserva(r);
    }
    public Reserva listarReservaporhuesped(int numh){
        return reserva.ListarReservaPorHuesped(numh);
    }
    
    
    public List<Servicios> ListarSErvicios(){
        return servicio.ListarServicio();
        
    }
    
    public Servicios listarserviciopor(int id){
        return servicio.lisTarserviciopor(id);
    }
    
    
    public Item createItem(Item item){
       return this.item.CreateItem(item);
    }
    
    public Reserva buscarReservaporid(int id){
        return reserva.ListarReservaPoid(id);
    }
    
    public List<Item>listaritempor(int idreserva){
       return  item.Listaritempor(idreserva);
    }
    
    
    public factura createFactura(factura f){
        return factura.crearfactura(f);
    }
    
    public Reserva updateReserva(Reserva r){
        return reserva.updateReserva(r);
    }
}
