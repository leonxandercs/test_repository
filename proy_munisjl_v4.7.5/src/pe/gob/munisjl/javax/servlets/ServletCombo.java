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

import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.TramiteDAO;
import pe.gob.munisjl.java.bean.TramiteBean;

/**
 * Servlet implementation class ServletTramite
 */
@WebServlet("/ServletCombo")
public class ServletCombo extends HttpServlet {
	private static final long serialVersionUID = 1L;

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
	   System.out.println("Servlet Tramite");
		/* Obtenemos la Session actual */
		HttpSession session=null;
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		TramiteDAO dao=fabrica.getTramiteDAO();
		
		try {
			List<TramiteBean> lista=dao.list();
			
			Gson nuevo=new Gson();
			String json=nuevo.toJson(lista);
			PrintWriter out=response.getWriter();
			System.out.println(json);
			out.print(json);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
}

}
