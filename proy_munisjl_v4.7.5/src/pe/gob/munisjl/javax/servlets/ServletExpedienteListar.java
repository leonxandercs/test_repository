package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pe.gob.munisjl.daofactory.ExpedienteDAO;
import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.java.bean.ExpedienteBean;
import pe.gob.munisjl.java.bean.PersonaBean;

/**
 * Servlet implementation class ServletExpedienteListar
 */
@WebServlet("/ServletExpedienteListar")
public class ServletExpedienteListar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=null;
		session=request.getSession();
		List<ExpedienteBean> lista=new ArrayList<ExpedienteBean>();
		PersonaBean usuario=(PersonaBean)session.getAttribute("usuario_logueado");
		
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		ExpedienteDAO dao=fabrica.getExpedienteDAO();
		
		try {
			
			if(usuario.getArea().equals("3")){
			    lista=dao.listaInterna1();
			}else if(usuario.getArea().equals("4")){
			    lista=dao.listaInterna2();
			}else{
			    lista=dao.listaTotal();
			}
			
			session.setAttribute("listaExpe", lista);
			request.getRequestDispatcher("/ConsultarExpediente.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}







