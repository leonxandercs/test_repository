package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.FutDAO;
import pe.gob.munisjl.daofactory.MenuDAO;
import pe.gob.munisjl.daofactory.PersonaDAO;
import pe.gob.munisjl.java.bean.FutBean;
import pe.gob.munisjl.java.bean.PersonaBean;
import pe.gob.munisjl.java.bean.UsuarioBean;
import pe.gob.munisjl.java.util.ConexionDB;

/**
 * Servlet implementation class ServletAuthenticate
 */
@WebServlet("/ServletAuthenticate")
public class ServletAuthenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//obtener parametros
		String usuario=request.getParameter("username");
		String clave=request.getParameter("password");

		// Se declara un objeto HttpSession
		HttpSession session = null;
		try {
			//accediendo al Factory Mysql
			Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
			PersonaDAO dao=fabrica.getPersonaDAO();
			PersonaBean person =dao.Authenticate(usuario, clave);
			
			FutDAO daofut=fabrica.getFutDAO();
			FutBean fut=new FutBean();
			
			if(person != null){// Se encontro el usuario
														
				if(request.isRequestedSessionIdValid()){// Se verifica si existe una sesion valida
					session = request.getSession(false);// Si existe la recuperamos	y la invalidamos
					session.invalidate(); // Forzamos el cierre de la sesion
				}
				
				session = request.getSession(true);// Creamos una nueva sesion
				session.setAttribute("usuario_logueado",person);// Se agrega un atributo a la sesion
				System.out.println("Rol"+person.getArea());
				String menu=new MenuDAO().getMenu(person.getArea()); //creamos el menu segun perfil
				session.setAttribute("menu", menu);		//Se agrega el menu a la session
				//validando si es usuairo interno o externo
				if(person.getArea().equals("2")){ 
					String idcarpeta=daofut.getNewidFUt();
					session.setAttribute("idcarpeta", idcarpeta);
					
					request.getRequestDispatcher("/Paso1.jsp")// Se redirecciona
					.forward(request, response);
					System.out.println("usuario logeado:"+person.getUserid()+"id: "+person.getIdPersona());
				}else if(person.getArea().equals("6")){
					String idcarpeta=daofut.getNewidFUt();
					session.setAttribute("idcarpeta", idcarpeta);
					
					request.getRequestDispatcher("/Paso1.jsp")// Se redirecciona
					.forward(request, response);
					System.out.println("usuario logeado:"+person.getUserid()+"id: "+person.getIdPersona());
				}else{
					request.getRequestDispatcher("/ServletExpedienteListar")// Se redirecciona
					.forward(request, response);
					System.out.println("usuario logeado:"+person.getUserid()+"id: "+person.getIdPersona());
				}
				
			}
			else{
				request.setAttribute("failed_account",new Integer(1));//indicamos el fallo
				request.getRequestDispatcher("/login.jsp")
				.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
