package pe.gob.munisjl.daofactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import pe.gob.munisjl.java.bean.FutBean;
import pe.gob.munisjl.java.util.ConexionDB;

public class MysqlFutDAO implements FutDAO {

	ResourceBundle  rb=ResourceBundle.getBundle("infoSQLStatements");
	
	@Override
	public String[] create(FutBean bean,int user){
		
		int salida=0;
		String[] futgenerado=new String[3];
		
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_FUT_CREATE"));
			pstm.setString(1,bean.getCodCont());
			pstm.setInt(2,bean.getIdTramite());
			pstm.setInt(3,bean.getIdPago());
			pstm.setString(4,bean.getMedio());
			pstm.setString(5,bean.getRutaRecibo());
			pstm.setString(6,bean.getRutaSolAlcalde());
			pstm.setInt(7,bean.getIdestado());
			pstm.setString(8,bean.getFundamentacion());
			pstm.setInt(9,user );
			rs=pstm.executeQuery();
			while (rs.next()) {
				salida=rs.getInt("fallo");
				futgenerado[0]=""+rs.getInt("fallo");
				if (salida==0) {
					futgenerado[1]=""+rs.getInt(2);
					futgenerado[2]=rs.getString(3);
				}
			}
			if (salida==0) {
				System.out.println("Registro Correcto");
			}else{
				System.out.println("Registro Fallido");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("incorrecto");
		}
		
		return futgenerado;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(int id,int estado,int fin,String obs,int user) {
		
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_FUT_UPDATE"));
			pstm.setInt(1,id);
			pstm.setInt(2,estado);
			pstm.setInt(3,fin); // si es 1 indica fin de solicitud
			pstm.setString(4,obs);
			pstm.setInt(5, user);
			pstm.executeUpdate();
			salida++;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("incorrecto");
		}
		
		if (salida>0) {
			System.out.println("Actualizacion Correcto");
		}else{
			System.out.println("Actualizacion Fallida");
		}
		return salida;
	}

	@Override
	public List<FutBean> listaxEstado() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int validarPago(int entidad,String operacion) throws Exception {
		int idPago=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_VALIDA_PAGO"));
			pstm.setInt(1,entidad);
			pstm.setString(2, operacion);
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			while (rs.next()) {
				idPago=rs.getInt("idPago");
			}
			System.out.println("pago: "+idPago);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idPago;
	}

	@Override
	public List<FutBean> listaInterna1() throws Exception {
		System.out.println("Factoria MYSQLFut - VISTA INTERNA 1");
		List<FutBean> lista=new ArrayList<FutBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_FUT_EMPLEADOS1"));
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			FutBean bean=null;
			while (rs.next()) {
				bean=new FutBean();
				bean.setIdSolicitud(rs.getInt(1));
				bean.setCodSoli(rs.getString(2));
				//bean.setCodExpe(rs.getString(3));
				bean.setSolicitante(rs.getString(3));
				bean.setMotivo(rs.getString(4));
				bean.setFechaini(rs.getString(5));
				bean.setEstado(rs.getString(6));
				bean.setFundamentacion(rs.getString(7));
				lista.add(bean);
			}
			System.out.println("listado correcto");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (rs!=null) rs.close();
				if (pstm!=null) pstm.close();
				if (conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}
	
	@Override
	public List<FutBean> listaInterna2() throws Exception {
		System.out.println("Factoria MYSQLFut -  - VISTA INTERNA 2");
		List<FutBean> lista=new ArrayList<FutBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_FUT_GERENTE"));
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			FutBean bean=null;
			while (rs.next()) {
				bean=new FutBean();
				bean.setIdSolicitud(rs.getInt(1));
				bean.setCodSoli(rs.getString(2));
				bean.setCodExpe(rs.getString(3));
				bean.setSolicitante(rs.getString(4));
				bean.setMotivo(rs.getString(5));
				bean.setFechaini(rs.getString(6));
				bean.setEstado(rs.getString(7));
				bean.setFundamentacion(rs.getString(8));
				lista.add(bean);
			}
			System.out.println("listado correcto");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (rs!=null) rs.close();
				if (pstm!=null) pstm.close();
				if (conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

	@Override
	public List<FutBean> listaVistaExterna(int id) throws Exception {
		System.out.println("Factoria MYSQLFut  - VISTA externa");
		List<FutBean> lista=new ArrayList<FutBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_FUT_EXTERNOS"));
			pstm.setInt(1,id);
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			FutBean bean=null;
			while (rs.next()) {
				bean=new FutBean();
				bean.setIdSolicitud(rs.getInt(1));
				bean.setCodSoli(rs.getString(2));
				bean.setCodExpe(rs.getString(3));
				bean.setMotivo(rs.getString(4));
				bean.setFechaini(rs.getString(5));
				bean.setEstado(rs.getString(6));
				bean.setFundamentacion(rs.getString(7));
				lista.add(bean);
			}
			System.out.println("listado correcto vista externa");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (rs!=null) rs.close();
				if (pstm!=null) pstm.close();
				if (conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;

	}

	@Override
	public List<FutBean> getDetalleFut(int id) throws Exception {
		System.out.println("Factoria MYSQLFut  - Detalle Fut");
		List<FutBean> lista=new ArrayList<FutBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_FUT_DETA"));
			pstm.setInt(1,id);
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			FutBean bean=null;
			while (rs.next()) {
				bean=new FutBean();
				bean.setIdSolicitud(rs.getInt(1));
				bean.setCodCont(rs.getString(2));
				bean.setDni(rs.getString(3));
				bean.setSolicitante(rs.getString(4));
				bean.setMailSolicitante(rs.getString(5));
				bean.setIdestado(rs.getInt(6));
				bean.setMedio(rs.getString(7));
				bean.setMotivo(rs.getString(8));
				bean.setEntidad(rs.getString(9));
				bean.setFundamentacion(rs.getString(10));
			
				lista.add(bean);
			}
			System.out.println("listado correcto Detalle Fut");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (rs!=null) rs.close();
				if (pstm!=null) pstm.close();
				if (conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

	@Override
	public List<FutBean> getDetalleFutExt(int id) throws Exception {
		System.out.println("Factoria MYSQLFut  - Detalle Fut Externo");
		List<FutBean> lista=new ArrayList<FutBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_DETA_EXT"));
			pstm.setInt(1,id);
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			FutBean bean=null;
			while (rs.next()) {
				bean=new FutBean();
				bean.setIdSolicitud(rs.getInt(1));
				bean.setCodSoli(rs.getString(2));
				bean.setMotivo(rs.getString(3));
				bean.setFechaini(rs.getString(4));
				bean.setCodExpe(rs.getString(5));
				bean.setFundamentacion(rs.getString(6));
			
				lista.add(bean);
			}
			System.out.println("listado correcto Detalle Fut");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (rs!=null) rs.close();
				if (pstm!=null) pstm.close();
				if (conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

	@Override
	public String getNewidFUt() {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="select max(idSolicitud)+1 from fut";
		
		String id=null;
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			System.out.println("Conexion correcta");
			while (rs.next()) {
				id=(""+rs.getInt(1));
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
			System.out.println("Error");
			return null;
		}else{
			return id;
		}
	}

	@Override
	public List<FutBean> getHistorial(int id) throws Exception {
		
		System.out.println("Factoria MYSQLFut  - Historial");
		List<FutBean> lista=new ArrayList<FutBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement("call verhistorial(?);");
			pstm.setInt(1,id);
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			FutBean bean=null;
			while (rs.next()) {
				bean=new FutBean();
				bean.setCodSoli(rs.getString(1));
				bean.setCodExpe(rs.getString(2));
				bean.setAccionH(rs.getString(5));
				bean.setEntidad(rs.getString(6));
				bean.setFechaini(rs.getString(8));
				bean.setFundamentacion(rs.getString(9));
				bean.setUsermodificador(rs.getString(10));
				
				lista.add(bean);
			}
			System.out.println("listado correcto Detalle Fut");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (rs!=null) rs.close();
				if (pstm!=null) pstm.close();
				if (conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

}
