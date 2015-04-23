package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.TramiteDAO;
import pe.gob.munisjl.java.bean.TramiteBean;

/**
 * Servlet implementation class ServletTramiteCRUD
 */
@WebServlet("/ServletTramiteCRUD")
public class ServletTramiteCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet Tramite CRUD");
		/* Obtenemos la Session actual */
		HttpSession session=null;
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		TramiteDAO dao=fabrica.getTramiteDAO();
		
		try {
			String idElimar=request.getParameter("ideliminar");
			dao.delete(Integer.parseInt(idElimar));
			
		} catch (Exception e) {
			int vigencia=0;
			
			String accion=request.getParameter("accion");
			int id=Integer.parseInt(request.getParameter("id"));
			String descripcion=request.getParameter("descripcion");
			String fec=request.getParameter("fec_registro");
			String  precio=request.getParameter("precio");
			String aux=request.getParameter("vigencia");
			if (aux.toLowerCase().trim().equals("si")){
				vigencia=1;
			}
			String consideraciones=request.getParameter("consideraciones");
			/* Pasamos data del request al bean*/
			TramiteBean bean=new TramiteBean();
			bean.setIdTramite(id);
			bean.setNomTramite(descripcion);
			bean.setPrecio(Double.parseDouble(precio.trim().substring(3,precio.length())));//precio);
			bean.setVigente(vigencia);
			bean.setFec_registro(fec);
			bean.setConsideraciones(consideraciones);
			
			try {
				/* Validamos el tipo de acción */
				if(accion.equals("create")){
					dao.create(bean);
				}
				if(accion.equals("update")){
					dao.update(bean);
				}
				/*resultados impresos*/
				System.out.println("--------------------------------");
				System.out.println("precio:" + precio);
				System.out.println("vigencia: "+aux);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		List<TramiteBean> lista;
		try {
			lista = dao.list();
			session=request.getSession();
			session.setAttribute("listaTramites", lista);
			request.getRequestDispatcher("/mantenerTramite.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
