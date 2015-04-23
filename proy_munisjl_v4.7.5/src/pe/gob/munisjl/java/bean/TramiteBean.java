package pe.gob.munisjl.java.bean;

import java.io.Serializable;
/**
 *  pe.gob.munisjl.java.bean
 *
 *  @author Chavez Simbron Alexander
 */
public class TramiteBean  implements Serializable{

	private int idTramite;
	private String nomTramite;
	private double precio;
	private int vigente;
	private String fec_registro;
	private String consideraciones;
	
	
	public int getIdTramite() {
		return idTramite;
	}
	public void setIdTramite(int idTramite) {
		this.idTramite = idTramite;
	}
	public String getNomTramite() {
		return nomTramite;
	}
	public void setNomTramite(String nomTramite) {
		this.nomTramite = nomTramite;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getVigente() {
		return vigente;
	}
	public void setVigente(int vigente) {
		this.vigente = vigente;
	}
	public String getFec_registro() {
		return fec_registro;
	}
	public void setFec_registro(String fec_registro) {
		this.fec_registro = fec_registro;
	}
	public String getConsideraciones() {
		return consideraciones;
	}
	public void setConsideraciones(String consideraciones) {
		this.consideraciones = consideraciones;
	}

	
	
}
