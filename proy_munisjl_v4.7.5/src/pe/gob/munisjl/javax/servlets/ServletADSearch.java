package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.PersonaDAO;
import pe.gob.munisjl.java.bean.PersonaBean;


@WebServlet("/ServletADSearch")
public class ServletADSearch extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
			String user=request.getParameter("userbuscado");
			String repositorio=request.getParameter("accion");
		
			PrintWriter out=response.getWriter();
			List<PersonaBean> lista=null;
			PersonaBean person=new PersonaBean();
			
		try {
			
			if (repositorio.equals("buscarAD")) {
				//iniciamos la fabrica LDAP
				Factory fabrica=Factory.getTipo(Factory.TIPO_LDAP);
				PersonaDAO dao=fabrica.getPersonaDAO();
				lista=dao.search(user);
			} else {
				//iniciamos la fabrica Mysql
				Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
				PersonaDAO dao=fabrica.getPersonaDAO();
				lista=dao.search(user);
			}
			//listado 
			if(lista!=null){
			for (PersonaBean p: lista) {
				out.println("<table border=2 bordercolor=green>");
				out.println("<thead>");
				out.println("<tr>");
				out.println("<th>User Name</ht>");
				out.println("<th>full Name</ht>");
				out.println("<th>Description</ht>");
				out.println("<th>Email</ht>");
				out.println("<th>Area</ht>");
				out.println("<th>DistinguishedName</ht>");
				out.println("<th>Cuenta Activa</ht>");
				out.println("</tr>");
				out.println("</thead>");
				out.println("<tbody>");
				out.println("<tr>");
				out.println("<td>"+p.getUserid()+"</td>");
				out.println("<td>"+p.getFullname()+"</td>");
				out.println("<td>"+p.getDescription()+"</td>");
				out.println("<td>"+p.getEmail()+"</td>");
				out.println("<td>"+p.getArea()+"</td>");
				out.println("<td>"+p.getDn()+"</td>");
				out.println("<td>"+p.getActive()+"</td>");
				out.println("</tr>");
				out.println("</tbody>");
				out.println("</table>");
			}
			}else {
				out.println("User not found");
			}
		} catch (NamingException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
