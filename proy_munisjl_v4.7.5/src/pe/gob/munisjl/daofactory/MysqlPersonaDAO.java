package pe.gob.munisjl.daofactory;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import pe.gob.munisjl.java.bean.PersonaBean;
import pe.gob.munisjl.java.util.ConexionDB;

public class MysqlPersonaDAO implements PersonaDAO {
	
	/* variable las sentencias Sql*/
	private ResourceBundle rb=ResourceBundle.getBundle("infoSQLStatements");
	
	@Override
	public List<PersonaBean> search(String user) throws Exception {
		int salida=0;
		List<PersonaBean> lista=new ArrayList<PersonaBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		PersonaBean person=null;
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			String sql=rb.getString("SQL_USUARIO");
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, user);
			rs=pstm.executeQuery();
			System.out.println("Conexion correcta");
			while (rs.next()) {
				person=new PersonaBean();
				person.setUserid(rs.getString("log_usu"));
				person.setFullname(rs.getString("nombre")+" "+rs.getString("ape_pa")+" "+rs.getString("ape_ma"));
				person.setEmail(rs.getString("dni"));
				person.setDn("distingido");
				person.setDireccion(rs.getString("direccion"));
				person.setDescription("activo");
				lista.add(person);
				System.out.println(rs.getString("log_usu"));
	            System.out.println(rs.getString("nombre")+" "+rs.getString("ape_pa")+" "+rs.getString("ape_ma"));
	            System.out.println(rs.getString("dni"));
	            System.out.println("distinguido");
	            System.out.println(rs.getString("direccion"));
	            System.out.println("activo");
	            salida++;
			}
		} catch (Exception e) {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("Usuario no encontrado");
			return null;
		}else{
			return lista;
		}
	}

	@Override
	public List<PersonaBean> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int create(PersonaBean person,String entidad) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		String sql="";
		
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			if (entidad.equals("empleado")) {
				sql=rb.getString("SQL_CREATE_EMP");
			}else if (entidad.equals("contribuyente")) {
				sql=rb.getString("SQL_CREATE_CONT");
			}else {
				sql=rb.getString("");
			}
			
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setString(1,person.getCodigo());
			pstm.setString(2,person.getNombre());
			pstm.setString(3,person.getApe_pa());
			pstm.setString(4,person.getApe_ma());
			pstm.setString(5,person.getDni());
			pstm.setInt(6,person.getEdad());
			pstm.setString(7,person.getFecNac());
			pstm.setString(8,person.getDireccion());
			
			System.out.println("Conexion correcta");
			
			pstm.executeUpdate();
            System.out.println("Registro correcto: "+entidad);
            //System.out.println("Tramite :"+bean.getIdTramite());
            salida++;
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("Error al Registrar: "+entidad);
			return 0;
		}else{
			return salida;
		}
	}

	@Override
	public int update(PersonaBean person,String entidad) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		String sql="";
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			if (entidad.equals("empleado")) {
				sql=rb.getString("SQL_UPDATE_EMP");
			}else if (entidad.equals("contribuyente")) {
				sql=rb.getString("SQL_UPDATE_CONT");
			}else {
				sql=rb.getString("");
			}
			conn=new ConexionDB().getConexion();
			System.out.println("Conexion correcta");
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1,person.getIdPersona());
			pstm.setString(2,person.getCodigo());
			pstm.setString(3,person.getNombre());
			pstm.setString(4,person.getApe_pa());
			pstm.setString(5,person.getApe_ma());
			pstm.setString(6,person.getDni());
			pstm.setInt(7,person.getEdad());
			pstm.setString(8,person.getFecNac());
			pstm.setString(9,person.getDireccion());
			pstm.executeUpdate();
            System.out.println("Update correcto: "+entidad);
            //System.out.println("Tramite :"+bean.getIdTramite());
            salida++;
			
		} catch (Exception e) {
			try {
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("Error  al hacer Update: "+entidad);
			return 0;
		}else{
			return salida;
		}
	}

	@Override
	public int delete(int id,String entidad) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		String sql="";
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		if (entidad.equals("empleado")) {
			sql=rb.getString("SQL_BAJA_EMP");
		}else if (entidad.equals("contribuyente")) {
			sql=rb.getString("SQL_BAJA_CONT");
		}else {
			sql=rb.getString("");
		}
		try {
			conn=new ConexionDB().getConexion();
			System.out.println("Conexion correcta");
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1,id);
			pstm.executeUpdate();
			System.out.println(entidad+" :"+id+" dado de Baja");
			return salida++;
		} catch (Exception e) {
			try {
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("Error  al dar de baja: "+entidad);
			return 0;
		}else{
			return salida;
		}
	}

	@Override
	public PersonaBean Authenticate(String user, String pass) {
			 
				String sql="call myAccount(?,?);";
				PersonaBean person=null;
				Connection conn=null;
				PreparedStatement pstm=null;
				System.out.println("Accediento a Fabrica Mysql");
				try {
					System.out.println("testing");
					conn=new ConexionDB().getConexion();
					pstm=conn.prepareStatement(sql);
					pstm.setString(1,user);
					pstm.setString(2,pass);
					ResultSet rs=pstm.executeQuery();
					while (rs.next()) {
						person=new PersonaBean();
						
						person.setUserid(rs.getString(1));
						person.setPassword(rs.getString(2));
						person.setArea(rs.getString(3));
						person.setIdPersona(rs.getInt(4));
						person.setCodigo(rs.getString(5));
						person.setFullname(rs.getString(6)+" "+rs.getString(7)+" "+rs.getString(8));
						person.setNombre(rs.getString(6));
						person.setApellido(rs.getString(7)+" "+rs.getString(8));
						person.setApe_pa(rs.getString(7));
						person.setApe_ma(rs.getString(8));
						person.setDni(rs.getString(9));
						person.setEdad(rs.getInt(10));
						person.setFecNac(rs.getString(11));
						person.setDireccion(rs.getString(12));
						person.setActive(rs.getInt("activo")+"");
						person.setTelefono(rs.getString(14));
						person.setEmail(rs.getString(15));
						System.out.println("Connection Succesful");
					}			
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if (pstm!=null) pstm.close();
						if(conn!=null) conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				return person;
	}

	@Override
	public List<PersonaBean> listActivo(String entidad) throws Exception {
		int salida=0;
		List<PersonaBean> lista=new ArrayList<PersonaBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="";
		
		PersonaBean person=null;
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			if (entidad.equals("empleado")) {
				sql=rb.getString("SQL_EMP_ACTIVOS");
			}else if (entidad.equals("contribuyente")) {
				sql=rb.getString("SQL_CONT_ACTIVOS");
			}else {
				sql=rb.getString("SQL_TER_ACTIVOS");
			}
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			System.out.println("Conexion correcta");
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
	            salida++;
			}
		} catch (Exception e) {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("No hay Datos: "+entidad);
			return null;
		}else{
			return lista;
		}
	}

	@Override
	public List<PersonaBean> listInactivo(String entidad) throws Exception {
		int salida=0;
		List<PersonaBean> lista=new ArrayList<PersonaBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="";
		
		PersonaBean person=null;
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			
			if (entidad.equals("empleado")) {
				sql=rb.getString("SQL_EMP_INACTIVOS");
			}else if (entidad.equals("contribuyente")) {
				sql=rb.getString("");
			}else {
				sql=rb.getString("");
			}
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			System.out.println("Conexion correcta");
			while (rs.next()) {
				person=new PersonaBean();
				person.setIdPersona(rs.getInt(1));
				person.setCodigo(rs.getString(2));
				person.setFullname(rs.getString("nombre")+" "+rs.getString("ape_pa")+" "+rs.getString("ape_ma"));
				person.setNombre(rs.getString("nombre"));
				person.setApe_pa(rs.getString("ape_pa"));
				person.setApe_ma(rs.getString("ape_ma"));
				person.setEmail(rs.getString("dni"));
				person.setEdad(rs.getInt("edad"));
				person.setFecNac(rs.getString("fec_nac"));
				person.setDireccion(rs.getString("direccion"));
				person.setActive(rs.getString("activo"));
				lista.add(person);
	            salida++;
			}
		} catch (Exception e) {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("No hay Datos : "+entidad);
			return null;
		}else{
			return lista;
		}
	}

	@Override
	public String getNewCod(String entidad) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="";
		
		String codigo=null;
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			
			if (entidad.equals("empleado")) {
				sql=rb.getString("SQL_NUEVOCOD_EMP");
			}else{
				sql=rb.getString("SQL_NUEVOCOD_CONT");
			}
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			System.out.println("Conexion correcta");
			while (rs.next()) {
				codigo=(rs.getString(1));
				salida++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if(rs!=null) rs.close();
				if(pstm!=null)pstm.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (salida<1) {
			System.out.println("Error al generar nuevo Codigo : "+entidad);
			return null;
		}else{
			return codigo;
		}
	}

}
