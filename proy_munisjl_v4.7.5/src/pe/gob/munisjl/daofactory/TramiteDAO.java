package pe.gob.munisjl.daofactory;

import java.util.List;

import pe.gob.munisjl.java.bean.TramiteBean;


public interface TramiteDAO {

	public int create(TramiteBean bean);
	
	public int update(TramiteBean bean);
	
	public List<TramiteBean> read(int id) throws Exception;
	
	public int delete(int id);
	
	public List<TramiteBean> list() throws Exception;
	
}
