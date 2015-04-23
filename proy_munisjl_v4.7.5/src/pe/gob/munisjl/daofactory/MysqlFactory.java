package pe.gob.munisjl.daofactory;

public class MysqlFactory extends Factory {

	@Override
	public PersonaDAO getPersonaDAO() {
		return new MysqlPersonaDAO();
	}

	@Override
	public TramiteDAO getTramiteDAO() {
		// TODO Auto-generated method stub
		return new MysqlTramiteDAO();
	}

	@Override
	public FutDAO getFutDAO() {
		// TODO Auto-generated method stub
		return new MysqlFutDAO();
	}

	@Override
	public ExpedienteDAO getExpedienteDAO() {
		// TODO Auto-generated method stub
		return new MysqlExpedienteDAO();
	}

}
