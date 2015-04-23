package pe.gob.munisjl.daofactory;

public abstract class Factory {
	
	public static final int TIPO_MYSQL=0;
	public static final int TIPO_LDAP=1;
	
	public abstract PersonaDAO getPersonaDAO();
	public abstract TramiteDAO getTramiteDAO();
	public abstract FutDAO getFutDAO();
	public abstract ExpedienteDAO getExpedienteDAO();
	
	public static Factory  getTipo(int tipo){
		switch (tipo) {
		case TIPO_MYSQL:
			return new MysqlFactory();
		default:
			return new LDAPFactory();
		}
		
	}
	
}
