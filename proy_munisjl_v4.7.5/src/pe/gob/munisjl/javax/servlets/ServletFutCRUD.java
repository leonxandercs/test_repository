package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import pe.gob.munisjl.daofactory.ExpedienteDAO;
import pe.gob.munisjl.daofactory.Factory;
import pe.gob.munisjl.daofactory.FutDAO;
import pe.gob.munisjl.java.bean.FutBean;
import pe.gob.munisjl.java.bean.PersonaBean;

/**
 * Servlet implementation class ServletFutCRUD
 */
@WebServlet("/ServletFutCRUD")
public class ServletFutCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion=request.getParameter("accion");
		System.out.println(accion);
		
		HttpSession session=null;
		session=request.getSession();
		PersonaBean usuario=(PersonaBean)session.getAttribute("usuario_logueado");
		FutBean bean=null;
		List<FutBean> lista=new ArrayList<FutBean>();
		
		Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
		FutDAO dao=fabrica.getFutDAO();
		
		if (accion.equals("crea")) {
			try {
				
				String codCnt="";
				int idPago=Integer.parseInt(request.getParameter("idPago"));
				int idtramite=Integer.parseInt(request.getParameter("tram"));
				String fundamento=request.getParameter("fundamento");
				
				if (usuario.getArea().equals("6")) {
					codCnt=usuario.getCodigo();
				} else {
					codCnt=request.getParameter("codCnt");
				}
				String rutarecibo;
				String rutaalcalde;
				
				bean=new FutBean();
				bean.setCodCont(codCnt);
				bean.setIdTramite(idtramite);
				bean.setIdPago(idPago);
				bean.setMedio("0");
				bean.setRutaRecibo("rutaserver");
				bean.setRutaSolAlcalde("rutaserver");
				bean.setIdestado(5);
				bean.setFundamentacion(fundamento);
				
				System.out.println("codigo "+codCnt);
				System.out.println("idtramite "+idtramite);
				System.out.println("pago "+idPago);
				System.out.println("fundamento "+fundamento);
				System.out.println("idususario "+usuario.getIdPersona());
				String[] insert=new String[3];
				insert=dao.create(bean,usuario.getIdPersona());
				
				PrintWriter out=response.getWriter();
				System.out.println(insert[0]+","+insert[1]+","+insert[2]);
				out.print(insert[0]+","+insert[1]+","+insert[2]);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(accion.equals("detalle")){
			try {
				Integer id=Integer.parseInt(request.getParameter("id"));
				lista=dao.getDetalleFut(id);
				
				Gson nuevo=new Gson();
				String json=nuevo.toJson(lista);
				PrintWriter out=response.getWriter();
				System.out.println(json);
				out.print(json);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (accion.equals("detallext")) {
			try {
				Integer id=Integer.parseInt(request.getParameter("id"));
				lista=dao.getDetalleFutExt(id);
				System.out.println("id de detalle: "+id);
				session.setAttribute("detallext",lista);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (accion.equals("historial")) {
			try {
				Integer id=Integer.parseInt(request.getParameter("id"));
				lista=dao.getHistorial(id);
				System.out.println("id de historial: "+id);
				
				Gson nuevo=new Gson();
				String json=nuevo.toJson(lista);
				PrintWriter out=response.getWriter();
				System.out.println(json);
				out.print(json);				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(accion.equals("genera")){
			try {
				Integer idfut=Integer.parseInt(request.getParameter("id"));
				
				ExpedienteDAO exp=fabrica.getExpedienteDAO();
				String[] insert=new String[2];
				insert=exp.create(idfut,usuario.getIdPersona());
				
				PrintWriter out=response.getWriter();
				System.out.println(insert[0]+","+insert[1]);
				out.print(insert[0]+","+insert[1]);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			int id=Integer.parseInt(request.getParameter("id"));
			int estado=Integer.parseInt(request.getParameter("idestado"));
			int fin=0;
			String obs=request.getParameter("obs");
			
			System.out.println("id Fut: "+id);
			int update=dao.update(id,estado,fin,obs,usuario.getIdPersona());
			
			Gson nuevo=new Gson();
			String json=nuevo.toJson(update);
			PrintWriter out=response.getWriter();
			System.out.println(json);
			out.print(json);
			
		}
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int pagovalido=0;
			int entidad=Integer.parseInt(request.getParameter("entidad"));
			String operacion=request.getParameter("noperacion");
			
			Factory fabrica=Factory.getTipo(Factory.TIPO_MYSQL);
			FutDAO dao=fabrica.getFutDAO();
		try {	
			pagovalido=dao.validarPago(entidad,operacion);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("valido: "+ pagovalido);
		
		Gson nuevo=new Gson();
		String json=nuevo.toJson(pagovalido);
		PrintWriter out=response.getWriter();
		System.out.println(json);
		out.print(json);
	}

}
