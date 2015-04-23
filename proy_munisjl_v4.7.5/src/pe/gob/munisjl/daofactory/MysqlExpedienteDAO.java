package pe.gob.munisjl.daofactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import org.eclipse.jdt.internal.compiler.ast.ParameterizedSingleTypeReference;

import pe.gob.munisjl.java.bean.ExpedienteBean;
import pe.gob.munisjl.java.util.ConexionDB;

public class MysqlExpedienteDAO implements ExpedienteDAO {

	ResourceBundle  rb=ResourceBundle.getBundle("infoSQLStatements");
	
	@Override
	public List<ExpedienteBean> listaTotal() throws Exception {
		
		System.out.println("Factoria MYSQL Expediente");
		List<ExpedienteBean> lista=new ArrayList<ExpedienteBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_EXPEDIENTES_GERENTE"));
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			ExpedienteBean bean=null;
			while (rs.next()) {
				bean=new ExpedienteBean();
				bean.setIdExpediente(rs.getInt(1));
				bean.setCodigoExpediente(rs.getString(2));
				bean.setCodigoSolicitud(rs.getString(3));
				bean.setSolicitante(rs.getString(4));
				bean.setMotivo(rs.getString(5));
				bean.setFechaRegistro(rs.getString(6));
				bean.setEstado(rs.getString(7));
				lista.add(bean);
			}
			System.out.println("lista de expedientes");
			
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
	public List<ExpedienteBean> listaInterna1() throws Exception {

		System.out.println("Factoria MYSQL Expediente");
		List<ExpedienteBean> lista=new ArrayList<ExpedienteBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_EXPEDIENTES_TJFT"));
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			ExpedienteBean bean=null;
			while (rs.next()) {
				bean=new ExpedienteBean();
				bean.setIdExpediente(rs.getInt(1));
				bean.setCodigoExpediente(rs.getString(2));
				bean.setCodigoSolicitud(rs.getString(3));
				bean.setSolicitante(rs.getString(4));
				bean.setMotivo(rs.getString(5));
				bean.setFechaRegistro(rs.getString(6));
				bean.setEstado(rs.getString(7));
				lista.add(bean);
			}
			System.out.println("lista de expedientes");
			
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
	public List<ExpedienteBean> listaInterna2() throws Exception {
		System.out.println("Factoria MYSQL Expediente");
		List<ExpedienteBean> lista=new ArrayList<ExpedienteBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_EXPEDIENTES_TGR"));
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			ExpedienteBean bean=null;
			while (rs.next()) {
				bean=new ExpedienteBean();
				bean.setIdExpediente(rs.getInt(1));
				bean.setCodigoExpediente(rs.getString(2));
				bean.setCodigoSolicitud(rs.getString(3));
				bean.setSolicitante(rs.getString(4));
				bean.setMotivo(rs.getString(5));
				bean.setFechaRegistro(rs.getString(6));
				bean.setEstado(rs.getString(7));
				lista.add(bean);
			}
			System.out.println("lista de expedientes");
			
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
	public String[] create(int idfut,int user) {
		int salida=0;
		String[] expgenerado=new String[2];
		
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_EXPEDIENTE_CREATE"));
			pstm.setInt(1,idfut);
			pstm.setInt(2,user );
			rs=pstm.executeQuery();
			while (rs.next()) {
				salida=rs.getInt("fallo");
				expgenerado[0]=""+rs.getInt("fallo");
				if (salida==0) {
					expgenerado[1]=rs.getString(2);
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
		
		return expgenerado;
	}

	@Override
	public int update(int id,int estado,int user) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_EXPEDIENTE_UPDATE"));
			pstm.setInt(1,id);
			pstm.setInt(2,estado);
			pstm.setInt(3,user);
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

	public List<ExpedienteBean> getDetalle(int id) throws Exception {
		
		System.out.println("Factoria MYSQL Expediente - Detalle");
		List<ExpedienteBean> lista=new ArrayList<ExpedienteBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(rb.getString("SQL_EXPEDIENTE_DETA"));
			pstm.setInt(1, id);
			rs=pstm.executeQuery();
			System.out.println("conexion correcta");
			ExpedienteBean bean=null;
			while (rs.next()) {
				bean=new ExpedienteBean();
				bean.setIdExpediente(rs.getInt(1));
				bean.setCodigoExpediente(rs.getString(2));
				bean.setCodigoSolicitud(rs.getString(3));
				bean.setSolicitante(rs.getString(4));
				bean.setMotivo(rs.getString(5));
				bean.setFechaRegistro(rs.getString(6));
				bean.setIdEstado(rs.getInt(7));
				bean.setMedio(rs.getString(8));
				bean.setFecinisoli(rs.getString(9));
				bean.setCodCont(rs.getString(10));
				bean.setFecactualiza(rs.getString(12));
				bean.setLogusu(rs.getString(13));
				
				lista.add(bean);
			}
			System.out.println("lista de expedientes");
			
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
