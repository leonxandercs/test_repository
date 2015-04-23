package pe.gob.munisjl.daofactory;

import java.util.List;

import pe.gob.munisjl.java.bean.ExpedienteBean;


public interface ExpedienteDAO {
	
	public List<ExpedienteBean> listaTotal()throws Exception;
	
	public String[] create(int idfut,int user);
	
	public int update(int idExpe,int estado,int user);
	
	public List<ExpedienteBean> listaInterna1()throws Exception;
	
	public List<ExpedienteBean> listaInterna2()throws Exception;
	
	public List<ExpedienteBean> getDetalle(int id)throws Exception;
}
