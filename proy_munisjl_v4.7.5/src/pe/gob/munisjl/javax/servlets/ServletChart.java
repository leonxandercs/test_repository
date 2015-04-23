package pe.gob.munisjl.javax.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.gob.munisjl.java.bean.Chart1;
import pe.gob.munisjl.java.util.ConexionDB;

import com.google.gson.Gson;

/**
 * Servlet implementation class ServletChart
 */
@WebServlet("/ServletChart")
public class ServletChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String year=request.getParameter("year");
		int inicio=Integer.parseInt(request.getParameter("inicio"));
		int fin=Integer.parseInt(request.getParameter("fin"));
		System.out.println(""+year+" "+inicio+" "+fin);
		
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="call datosChart1(?,?,?);";
		ArrayList<Chart1> lista=new ArrayList<Chart1>();
		
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
				pstm.setInt(1,inicio);
				pstm.setInt(2,fin);
				pstm.setString(3,year);
				rs=pstm.executeQuery();
				Chart1 bean=null;
				while (rs.next()) {
					bean=new Chart1();
					bean.setDia(rs.getString(1));
					bean.setPagos(Integer.parseInt(rs.getString(2)));
					bean.setSolicitudeS(Integer.parseInt(rs.getString(3)));
					bean.setExpedientes(Integer.parseInt(rs.getString(4)));
					bean.setContribuyente(Integer.parseInt(rs.getString(5)));
					lista.add(bean);
				}
			
		} catch (Exception e) {
		 e.printStackTrace();
		}
		
		Gson nuevo=new Gson();
		String json=nuevo.toJson(lista);
		PrintWriter out=response.getWriter();
		//System.out.println(json);
		out.print(json);
	}

}
