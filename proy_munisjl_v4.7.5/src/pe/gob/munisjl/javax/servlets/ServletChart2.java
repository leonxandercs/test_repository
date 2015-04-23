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

import pe.gob.munisjl.java.bean.Chart2;
import pe.gob.munisjl.java.util.ConexionDB;



import com.google.gson.Gson;

/**
 * Servlet implementation class ServletChart
 */
@WebServlet("/ServletChart2")
public class ServletChart2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ini=Integer.parseInt(request.getParameter("ini"));
		int fin=Integer.parseInt(request.getParameter("fin"));
		String fecha=request.getParameter("year");
		
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="call datosChart2(?,?,?);";
		ArrayList<Chart2> lista=new ArrayList<Chart2>();
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1,ini);
			pstm.setInt(2,fin);
			pstm.setString(3,fecha);
			rs=pstm.executeQuery();
			Chart2 bean=null;
			while (rs.next()) {
				bean=new Chart2(rs.getString(1),rs.getInt(2),rs.getInt(3));
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
