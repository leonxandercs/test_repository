package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import org.apache.jasper.tagplugins.jstl.core.Out;

import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.PersonaDAO;
import pe.gob.munisjl.java.bean.PersonaBean;
import pe.gob.munisjl.java.util.ConexionLDAP;


/**
 * Servlet implementation class ServletADAuthenticator
 */
@WebServlet("/ServletADAuthenticator")
public class ServletADAuthenticator extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
 protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	PrintWriter out=response.getWriter();
		try {
			
			String user=request.getParameter("user");
			String password=request.getParameter("password");
			
			//iniciamos la fabrica LDAP
			Factory fabrica=Factory.getTipo(Factory.TIPO_LDAP);
			PersonaDAO dao=fabrica.getPersonaDAO();
			PersonaBean userid=dao.Authenticate(user, password);
			
			if(userid!=null){
				out.println("connection Successful");
			}
			else{
				out.println("connection Unsuccessful");
				out.println(" ");
				out.println(" ");
				out.println("Please verify your credentials");
			} 
				
			//request.getRequestDispatcher("ADAuthenticator.jsp").forward(request, response);
		} catch (Exception e) {
			out.println(e.getMessage());
			//request.getRequestDispatcher("ADAuthenticator.jsp").forward(request, response);
		}
	}


}
