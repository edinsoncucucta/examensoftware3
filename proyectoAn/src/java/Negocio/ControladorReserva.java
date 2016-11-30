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
import co.ufps.edu.dto.Huesped;
import co.ufps.edu.dto.Item;
import co.ufps.edu.dto.Reserva;
import co.ufps.edu.dto.Servicios;
import co.ufps.edu.dto.factura;
import co.ufps.edu.dto.habitaciones;
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
    public factura ConsultarFActura(int id_fac){
        return factura.consultarFactura(id_fac);
    }
    
    public Huesped huespedoffactura(int id_fac){
        return factura.huespedofactura(id_fac);
    }
    public Reserva reservaoffactura(int id_fac){
        return factura.reservaoffactura(id_fac);
    }
    
    public habitaciones cuartooffactura(int id_fac){
        return factura.habitacionoffactura(id_fac);
    }
    
    public factura consultarfac(int id_reserva){
        return factura.consultarFacturaporreserva(id_reserva);
    }
    
    public ArrayList<Servicios>serviciosporreserva(int id_reserva){
        return reserva.serviciosporreserva(id_reserva);
    }
    public ArrayList<factura>facturaporhuesped(int cc){
        return factura.facturaporhuesped(cc);
    }
}
