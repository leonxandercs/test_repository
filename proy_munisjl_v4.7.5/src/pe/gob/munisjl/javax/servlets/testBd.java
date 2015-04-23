package pe.gob.munisjl.javax.servlets;

import java.util.List;

import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.FutDAO;
import pe.gob.munisjl.daofactory.PersonaDAO;
import pe.gob.munisjl.daofactory.TramiteDAO;
import pe.gob.munisjl.java.bean.FutBean;
import pe.gob.munisjl.java.bean.PersonaBean;
import pe.gob.munisjl.java.bean.TramiteBean;

public class testBd {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		FutDAO dao=fabrica.getFutDAO();
		FutBean bean=new FutBean();
		int user=1;
		try {
		String id=dao.getNewidFUt();
			System.out.println(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
