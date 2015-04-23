package pe.gob.munisjl.daofactory;

public class LDAPFactory extends Factory {

	@Override
	public PersonaDAO getPersonaDAO() {
		return new LDAPPersonaDAO();
	}

	@Override
	public TramiteDAO getTramiteDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FutDAO getFutDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExpedienteDAO getExpedienteDAO() {
		// TODO Auto-generated method stub
		return null;
	}

}
