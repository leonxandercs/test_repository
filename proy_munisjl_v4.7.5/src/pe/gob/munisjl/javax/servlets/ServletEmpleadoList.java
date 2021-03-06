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
import pe.gob.munisjl.daofactory.PersonaDAO;
import pe.gob.munisjl.java.bean.PersonaBean;

/**
 * Servlet implementation class ServletEmpleadoList
 */
@WebServlet("/ServletEmpleadoList")
public class ServletEmpleadoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet EmpleadoList");
		/* Obtenemos la Session actual */
		HttpSession session=null;
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		PersonaDAO dao=fabrica.getPersonaDAO();
		
		try {
			List<PersonaBean> lista=dao.listActivo("empleado");
			session=request.getSession();
			session.setAttribute("listaEmpActivos", lista);
			session.setAttribute("new_cod_emp",dao.getNewCod("empleado"));//enviamos el nuevo codigo disponible
			request.getRequestDispatcher("/mantenerEmpleado.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
