package pe.gob.munisjl.daofactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pe.gob.munisjl.java.bean.TramiteBean;
import pe.gob.munisjl.java.util.ConexionDB;

public class MysqlTramiteDAO implements TramiteDAO {

	@Override
	public int create(TramiteBean bean) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			String sql="INSERT INTO tramite(`nomTramite`,`precio`,`vigente`,`fec_registro`,`consideraciones`)VALUES(?,?,?,now(),?);";
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setString(1,bean.getNomTramite());
			pstm.setDouble(2, bean.getPrecio());
			pstm.setInt(3, bean.getVigente());
			pstm.setString(4, bean.getConsideraciones());
			System.out.println("Conexion correcta");
			
			pstm.executeUpdate();
            System.out.println("Registro correcto");
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
			System.out.println("Error al Registrar");
			return 0;
		}else{
			return salida;
		}
	}

	@Override
	public int update(TramiteBean bean) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			String sql="UPDATE tramite SET `nomTramite` =?,`precio` =?,`vigente` =?,`fec_registro` =?,`consideraciones` =? WHERE `idTramite` = ?;";
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setString(1,bean.getNomTramite());
			pstm.setDouble(2, bean.getPrecio());
			pstm.setInt(3, bean.getVigente());
			pstm.setString(4, bean.getFec_registro());
			pstm.setString(5, bean.getConsideraciones());
			pstm.setInt(6, bean.getIdTramite());
			System.out.println("Conexion correcta");
			
			pstm.executeUpdate();
            System.out.println("Actualización correcta");
            System.out.println("Update de Tramite:"+bean.getIdTramite());
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
			System.out.println("Error al Actualizar");
			return 0;
		}else{
			return salida;
		}
	}

	@Override
	public List<TramiteBean> read(int id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int id) {
		int salida=0;
		Connection conn=null;
		PreparedStatement pstm=null;
		
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		System.out.println("id optenido: "+id);
		try {
			String sql="delete from tramite where idTramite=?;";
			conn=new ConexionDB().getConexion();
			System.out.println("Conexion correcta");
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1,id);
			pstm.executeUpdate();
            System.out.println("Eliminación correcta");
            System.out.println("Tramite :"+id);
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
			System.out.println("Error al Eliminar");
			return 0;
		}else{
			return salida;
		}
	}

	@Override
	public List<TramiteBean> list() throws Exception {
		int salida=0;
		List<TramiteBean> lista=new ArrayList<TramiteBean>();
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		TramiteBean bean=null;
		System.out.println("Testing");
		System.out.println("Accediento a Fabrica Mysql");
		try {
			String sql="select * from  tramite";
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			System.out.println("Conexion correcta");
			while (rs.next()) {
				bean=new TramiteBean();
				bean.setIdTramite(rs.getInt("idTramite"));
				bean.setNomTramite(rs.getString("nomTramite"));
				bean.setPrecio(rs.getDouble("precio"));
				bean.setVigente(rs.getInt("vigente"));
				bean.setFec_registro(rs.getString("fec_registro"));
				bean.setConsideraciones(rs.getString("consideraciones"));
				lista.add(bean);
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
			System.out.println("No hay Tramites Registrados");
			return null;
		}else{
			return lista;
		}
	}



}
