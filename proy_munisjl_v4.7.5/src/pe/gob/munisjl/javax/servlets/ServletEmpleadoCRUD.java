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
 * Servlet implementation class ServletEmpleadoCRUD
 */
@WebServlet("/ServletEmpleadoCRUD")
public class ServletEmpleadoCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Obtenemos_la_Session_actual */
		HttpSession session=null;
		System.out.println("Servlet Empelado CRUD");
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		PersonaDAO dao=fabrica.getPersonaDAO();
		
		try {
			String idElimar=request.getParameter("ideliminar");
			dao.delete(Integer.parseInt(idElimar),"empleado");
		
		} catch (Exception e) {
			
			String accion=request.getParameter("accion");
			String id=request.getParameter("idEmpleado");
			String codigo=request.getParameter("codigo");
			String nomre=request.getParameter("nombre");
			String  ape_pa=request.getParameter("ape_pa");
			String ape_ma=request.getParameter("ape_ma");
			String dni=request.getParameter("dni");
			String edad=request.getParameter("edad");
			String fec_can=request.getParameter("fec_nac");
			String direccion=request.getParameter("direccion");

			/* 	Pasamos_data_del_request_al_bean*/
			PersonaBean person=new PersonaBean();
			person.setIdPersona(Integer.parseInt(id));
			person.setCodigo(codigo);
			person.setNombre(nomre);
			person.setApe_pa(ape_pa);
			person.setApe_ma(ape_ma);
			person.setDni(dni);
			person.setEdad(Integer.parseInt(edad));
			person.setFecNac(fec_can);
			person.setDireccion(direccion);
			person.setActive("1");
			
			try {
				/* Validamos_tipo_de_acción */
				if(accion.equals("create")){
					dao.create(person,"empleado");
				}
				if(accion.equals("update")){
					dao.update(person,"empleado");
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		List<PersonaBean> lista;
		try {
			lista = dao.listActivo("empleado");
			session=request.getSession();
			session.setAttribute("listaEmpActivos", lista);
			session.setAttribute("new_cod_emp",dao.getNewCod("empleado"));//enviamos el nuevo codigo disponible
			request.getRequestDispatcher("/mantenerEmpleado.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
