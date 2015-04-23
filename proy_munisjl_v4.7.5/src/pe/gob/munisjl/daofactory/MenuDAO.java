package pe.gob.munisjl.daofactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;

import pe.gob.munisjl.java.bean.MenuBean;
import pe.gob.munisjl.java.util.ConexionDB;

public class MenuDAO {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		String ver=new MenuDAO().getMenu("1");
	}
	
	public String getMenu(String rol){
		ResourceBundle rb=ResourceBundle.getBundle("infoSQLStatements");
		String mainhtml=rb.getString("HTML");
		
		ArrayList<MenuBean> menu=new ArrayList<MenuBean>();
		MenuBean bean=null;
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			String sql="SELECT * FROM menu where padre=0 and perfil like ?";
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setString(1,"%"+rol+"%");
			rs=pstm.executeQuery();
			while (rs.next()) {
				bean=new MenuBean();
				bean.setIdmenu(rs.getInt("idmenu"));
				bean.setUrl(rs.getString("url"));
				bean.setPadre(rs.getInt("padre"));
				bean.setPerfil(rs.getString("perfil"));
				bean.setDescripcion(rs.getString("descripcion"));
				bean.setIcono(rs.getString("icono"));
				menu.add(bean);
				System.out.println(""+rs.getString("descripcion")+rs.getInt("padre"));
			}

			System.out.println("---submenu---");
			for (MenuBean menuBean : menu) {
				
				if (menuBean.getUrl().equals("#")) {
					mainhtml+=rb.getString("L1")+menuBean.getIcono()+"<span>"+menuBean.getDescripcion()+rb.getString("L2");
					mainhtml+=rb.getString("UL");
					ArrayList<MenuBean> submenu=getSubMenu(menuBean.getIdmenu(),rol);
					for (MenuBean menuBean2 : submenu) {
						mainhtml+="<li><a href="+menuBean2.getUrl()+">"+menuBean2.getDescripcion()+"</a></li>";
					}
					mainhtml+="</ul></li>";
				}else {
					mainhtml+="<li><a href="+menuBean.getUrl()+">"+menuBean.getIcono()+"<span>"+menuBean.getDescripcion()+"</span></a></li>";
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mainhtml+=rb.getString("END");
		System.out.println(mainhtml);
		return mainhtml;
	}

	public ArrayList<MenuBean> getSubMenu(int padre,String rol){
		ArrayList<MenuBean> menu=new ArrayList<MenuBean>();
		MenuBean bean=null;
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			String sql="SELECT * FROM menu where padre=? and perfil like ?";
			conn=new ConexionDB().getConexion();
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1,padre);
			pstm.setString(2,"%"+rol+"%");
			rs=pstm.executeQuery();
			while (rs.next()) {
				bean=new MenuBean();
				bean.setIdmenu(rs.getInt("idmenu"));
				bean.setUrl(rs.getString("url"));
				bean.setPadre(rs.getInt("padre"));
				bean.setPerfil(rs.getString("perfil"));
				bean.setDescripcion(rs.getString("descripcion"));
				menu.add(bean);
				System.out.println(""+rs.getString("descripcion")+rs.getInt("padre"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return menu;
	}
	
}
