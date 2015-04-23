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

import pe.gob.munisjl.java.bean.PersonaBean;
import pe.gob.munisjl.java.util.ConexionDB;


import com.google.gson.Gson;

/**
 * Servlet implementation class ServletChart
 */
@WebServlet("/ServletInput")
public class ServletInput extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String valor=request.getParameter("valor");
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="SELECT * FROM munisjl.contribuyente;";
		ArrayList<PersonaBean> lista=new ArrayList<PersonaBean>();
		
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			PersonaBean person=null;
			while (rs.next()) {
				person=new PersonaBean();
				person.setIdPersona(rs.getInt(1));
				person.setCodigo(rs.getString(2));
				person.setFullname(rs.getString("nombre")+" "+rs.getString("ape_pa")+" "+rs.getString("ape_ma"));
				person.setNombre(rs.getString("nombre"));
				person.setApe_pa(rs.getString("ape_pa"));
				person.setApe_ma(rs.getString("ape_ma"));
				person.setDni(rs.getString("dni"));
				person.setEdad(rs.getInt("edad"));
				person.setFecNac(rs.getString("fec_nac"));
				person.setDireccion(rs.getString("direccion"));
				person.setActive(rs.getString("activo"));
				lista.add(person);
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
