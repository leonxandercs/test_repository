package pe.gob.munisjl.daofactory;

import java.util.List;

import pe.gob.munisjl.java.bean.PersonaBean;

public interface PersonaDAO {
	
	public PersonaBean Authenticate(String user, String pass);
	
	public List<PersonaBean> search(String user) throws Exception;
	
	public List<PersonaBean> list() throws Exception;
	
	public String getNewCod(String entidad);
	
	public int create(PersonaBean bean,String entidad);
	
	public int update(PersonaBean bean,String entidad);
	
	public int delete(int id,String entidad);
	
	public List<PersonaBean> listActivo(String entidad) throws Exception;
	
	public List<PersonaBean> listInactivo(String entidad) throws Exception;

}
