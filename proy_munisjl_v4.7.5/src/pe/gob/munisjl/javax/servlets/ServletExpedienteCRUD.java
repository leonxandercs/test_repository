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

import com.google.gson.Gson;

import pe.gob.munisjl.daofactory.ExpedienteDAO;
import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.java.bean.ExpedienteBean;
import pe.gob.munisjl.java.bean.PersonaBean;

/**
 * Servlet implementation class ServletExpedienteCRUD
 */
@WebServlet("/ServletExpedienteCRUD")
public class ServletExpedienteCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion=request.getParameter("accion");
		HttpSession session=null;
		session=request.getSession();
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		ExpedienteDAO dao=fabrica.getExpedienteDAO();
		PersonaBean user=(PersonaBean) session.getAttribute("usuario_logueado");
		List<ExpedienteBean> lista=new ArrayList<ExpedienteBean>();
		
		if (accion.equals("detalle")) {
			try {
				int id=Integer.parseInt(request.getParameter("id"));
				System.out.println("id Expe: "+id);
				lista=dao.getDetalle(id);
				
				Gson nuevo=new Gson();
				String json=nuevo.toJson(lista);
				PrintWriter out=response.getWriter();
				//System.out.println(json);
				out.print(json);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			int id=Integer.parseInt(request.getParameter("id"));
			int estado=Integer.parseInt(request.getParameter("idestado"));
			System.out.println("id Expe: "+id);
			int update=dao.update(id,estado,user.getIdPersona());
			
			Gson nuevo=new Gson();
			String json=nuevo.toJson(update);
			PrintWriter out=response.getWriter();
			System.out.println(json);
			out.print(json);
		}
		
	}

	
}







