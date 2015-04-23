package pe.gob.munisjl.java.bean;

import java.io.Serializable;

/**
 *  pe.gob.munisjl.java.bean
 *
 *  @author Chavez Simbron Alexander
 */

public class PersonaBean implements Serializable{
	
	/**  Datos del Active Directory  **/
	private String userid;
	private String password;
    private String fullname;   
    private String description;
    private String email;
    private String dn;
    private String area;
    /**  Datos de BD  **/
    private String apellido;
    /**              **/
    private int idPersona;
    private String codigo;
	private String nombre;
	private String ape_pa;
	private String ape_ma;
	private String dni;
	private int edad;
    private String fecNac;
    private String direccion;
    private String active;
	private String telefono;
	
	
    
    
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDn() {
		return dn;
	}
	public void setDn(String dn) {
		this.dn = dn;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public String getApe_pa() {
		return ape_pa;
	}
	public void setApe_pa(String ape_pa) {
		this.ape_pa = ape_pa;
	}
	public String getApe_ma() {
		return ape_ma;
	}
	public void setApe_ma(String ape_ma) {
		this.ape_ma = ape_ma;
	}
	public int getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(int idPersona) {
		this.idPersona = idPersona;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getFecNac() {
		return fecNac;
	}
	public void setFecNac(String fecNac) {
		this.fecNac = fecNac;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}   
	public String getCodigo() {
		return codigo;
	}  
	
	
}
