/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.edu.co.utils.conexion;

import java.io.FileWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

/**
 *
 * @author macaco
 */
public class Conexion {
    /* Variables */
	
	long tiempo_inicio = -1;
  	long tiempo_total = 0;
  	
  	private final static String url ="jdbc:postgresql://localhost:5432/pyecton";//local
	private String usuario="postgres";	
	private String password="macaco123";
	private final static String driver = "org.postgresql.Driver";			
	private String error;
		
	// portatil
	public String ruta_logs="E:/workspaceWeb/21Web/WebContent/logs.html";
	
	//public String ruta_logs="/var/www/vhosts/sotraexsa.com/httpdocs/ecolsi/clubbioarmonias/logs/logs.html";	
	
	private Connection con;
	private CallableStatement cs;
	private PreparedStatement ps;	
	private ResultSet rst;
	
	/**
	 * Constructor de la clase.
	 */
	public Conexion()
	{		
		super();
	}
	
	public void setusuario(String usuario)
	{
		this.usuario=usuario;		
	}

	public void setclave(String clave)
	{
		this.password=clave;		
	}
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	/**
	 * Método que permite realizar una conexión con la base de datos.
	 * @param conectaDesde: Clase y método de donde se realiza la conexión. 
	 * @return Connection: Objeto con la conexión establecida con la base de datos.
	 * @throws java.sql.SQLException
	 */
	public Connection conectar(String conectaDesde) throws java.sql.SQLException
	{	if(this.con!=null){
            return this.con;
            
        
            
            
        }					
		try
		{
			Class.forName(driver);
			this.con = DriverManager.getConnection(url,usuario,password);
                        
                        System.out.println("Abrio una conexion ");
                  
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return this.con;
	}
	
	/**
	 * Método que asigna una conexion.
	 * @param conex: Conecction a asignar
	 */
	public void setConnection (Connection conex)
	{
		this.con= conex;	
	}
	
	/**
	 * Método que permite cerrar una conexión.
	 */
	public void cerrarConexion()
	{
		
		try
		{		
			if (this.rst!=null) this.rst.close();
			if (this.ps!=null) this.ps.close();
			if (this.cs!=null) this.cs.close();
						
			this.rst= null;
			this.ps= null;
			this.cs=null;
			
			this.con.close();
			this.con=null;
		}
		catch(Exception e)
		{
			this.escribirLogs("Conexion", "cerrarConexion()",e.toString());
		}
		
	}  		
	
	/**
	 * Método que se encarga de escribir lo logs de conexión del usuario.
	 * @param conexionDesde: pagina o clase donde se realiza la conexión.
	 */
	public void escribirLogsCon(String conexionDesde)
	
        {
		
            /*
                 try
		{
			java.util.Date tiempo=new java.util.Date();
			SimpleDateFormat formato_fecha=new SimpleDateFormat("dd MMMM yyyy");
			SimpleDateFormat formato_hora=new SimpleDateFormat("h:mm a");
			FileWriter fw = new FileWriter(this.ruta_logs,true);
			fw.write(formato_fecha.format(tiempo)+" "+formato_hora.format(tiempo)+" >> Conexion del usuario: "+ this.usuario+" pagina: "+conexionDesde+"<br><br>");
			fw.close();
		}
		catch(Exception e)
		{
			this.escribirLogs("Conexion", "escribirLogsCon()",e.toString());
		}
                **/
           
	}
		
	/* Método que registra los errores presentados en el sistema */
	public void escribirLogs(String nombre_clase, String nombre_pagina,String mensaje_error)
	{
		
            /*
              try
		{
			java.util.Date tiempo=new java.util.Date();
			SimpleDateFormat formato_fecha=new SimpleDateFormat("dd MMMM yyyy");
			SimpleDateFormat formato_hora=new SimpleDateFormat("h:mm a");
			FileWriter fw = new FileWriter(this.ruta_logs,true);
			fw.write(formato_fecha.format(tiempo)+" "+formato_hora.format(tiempo)+" >> Error en la clase: "+nombre_clase+" de: "+nombre_pagina+ ": " +mensaje_error+"<br><br>");
			fw.close();
			
			this.error = mensaje_error;
		}
		catch(Exception e)
		{
			System.err.println("Error en el método escribirLogs: "+e.toString());
		}
            **/
          
	}
	
	/* Método que permite iniciar el cronometro */
	public void iniciarCronometro()
	{
		tiempo_inicio = System.currentTimeMillis();
		tiempo_total=0;
	}

	/* Método que permite detener el cronometro */
	public void detenerCronometro()
	{
		tiempo_total = System.currentTimeMillis() - tiempo_inicio;
	}

	/* Método que permite calcular el tiempo total de ejecución para un proceso */
	public long getTiempoTotal()
	{
		return tiempo_total;
	}
	
	public Connection getConnection()
	{
		return this.con;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Conexion))
			return false;
		final Conexion other = (Conexion) obj;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		return true;
	}
}
