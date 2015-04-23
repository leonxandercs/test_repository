package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.FutDAO;
import pe.gob.munisjl.java.bean.FutBean;
import pe.gob.munisjl.java.bean.PersonaBean;

/**
 * Servlet implementation class ServletFutListar
 */
@WebServlet("/ServletFutListar")
public class ServletFutListar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	  
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session=null;
		session=request.getSession();
		List<FutBean> lista=null;
		PersonaBean usuario=(PersonaBean)session.getAttribute("usuario_logueado");
		
		
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		FutDAO dao=fabrica.getFutDAO();
		try {
			if(usuario.getArea().equals("2")){
				lista=dao.listaInterna1();
			}else if(usuario.getArea().equals("1") || usuario.getArea().equals("5")){
				lista=dao.listaInterna2();
			}else{
				lista=dao.listaVistaExterna(usuario.getIdPersona());
			}
			
			session.setAttribute("listaFut", lista);
			request.getRequestDispatcher("/ConsultarSolicitud.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
