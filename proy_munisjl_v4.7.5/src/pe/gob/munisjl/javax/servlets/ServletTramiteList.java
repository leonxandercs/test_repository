package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * Servlet implementation class ServletTramite
 */
@WebServlet("/ServletTramite")
public class ServletTramiteList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Servlet Tramite");
		/* Obtenemos la Session actual */
		HttpSession session=null;
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		TramiteDAO dao=fabrica.getTramiteDAO();
		
		try {
			List<TramiteBean> lista=dao.list();
			session=request.getSession();
			session.setAttribute("listaTramites", lista);
			request.getRequestDispatcher("/mantenerTramite.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

}
