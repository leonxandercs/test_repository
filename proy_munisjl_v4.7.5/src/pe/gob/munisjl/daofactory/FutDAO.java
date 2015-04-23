package pe.gob.munisjl.daofactory;

import java.util.List;


import pe.gob.munisjl.java.bean.FutBean;


public interface FutDAO {

	public List<FutBean> listaInterna1()throws Exception;
	
	public List<FutBean> listaInterna2()throws Exception;
	
	public List<FutBean> listaVistaExterna(int id)throws Exception;
	
	public List<FutBean> getDetalleFut(int id)throws Exception;
	
	public List<FutBean> getDetalleFutExt(int id)throws Exception;
	
	public String[] create(FutBean bean,int user);
	
	public int delete(int id);
	
	public int update(int id,int estado,int fin,String obs,int user);
	
	public List<FutBean> listaxEstado()throws Exception;
	
	public String getNewidFUt();
	
	public int validarPago(int entidad,String operacion)throws Exception;
	
	public List<FutBean> getHistorial(int id)throws Exception;
}












