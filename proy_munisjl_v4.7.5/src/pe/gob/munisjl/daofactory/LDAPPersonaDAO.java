package pe.gob.munisjl.daofactory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import pe.gob.munisjl.java.bean.PersonaBean;
import pe.gob.munisjl.java.util.ConexionLDAP;

public class LDAPPersonaDAO implements PersonaDAO {
	
	private ResourceBundle rb=ResourceBundle.getBundle("infoLDAP");
	private String INITCTX =rb.getString("INITCTX");
    private String MY_AD =rb.getString("MY_AD");
    
	@Override
	public PersonaBean Authenticate(String user, String pass) {
		
        //Hashtable<String, String> env = new Hashtable<String, String>();
        if (pass.compareTo("") == 0 || user.compareTo("") == 0){
        	System.out.println("null");return null;
        }  
        
		System.out.println("testing");
		System.out.println("Accediendo a Fabrica LDAP");
		DirContext ctx = new ConexionLDAP().getContexto(user, pass);
		if(ctx!=null){
			System.out.println("Conexión correcta");
			System.out.println("Authentification Successful");
			PersonaBean person=new PersonaBean();
			person.setUserid(user);
			System.out.println(person.getUserid());
	        return person; 
		}else{
			System.out.println("Authentification Failed");
	        return null; 
		}
		
	}
	
	@Override
	public List<PersonaBean> search(String user) throws Exception {
	    
        
        List<PersonaBean> lista=new ArrayList<PersonaBean>();
    	PersonaBean person=null;
    	try {
    		Properties env = new Properties();
        	env.put(Context.INITIAL_CONTEXT_FACTORY,INITCTX);
        	env.put(Context.PROVIDER_URL,MY_AD);
        	env.put(Context.SECURITY_AUTHENTICATION, "simple");
        	env.put(Context.SECURITY_PRINCIPAL,rb.getString("DOMAIN")+"\\"+rb.getString("USER"));
        	env.put(Context.SECURITY_CREDENTIALS,rb.getString("PASS"));
        	System.out.println("testing");
        	
        	/* Limitamos el número de entradas obtenidas para evitar el error
        	   por límite de tamaño del servidor*/
        	env.put(Context.BATCHSIZE, "1000");
        	
        	// Activamos el pool de conexiones
        	env.put("com.sun.jndi.ldap.connect.pool", "true");
        	
        LdapContext context = new InitialLdapContext(env, null);
        
        System.out.println("Accediendo a Fabrica LDAP");
        System.out.println("Conexión correcta");
        
        // Leer usuario
    	String filter = "(sAMAccountName="+user+")";

    	NamingEnumeration<SearchResult> searchResult = null;

    	SearchControls cons = new SearchControls();
    	cons.setSearchScope(SearchControls.SUBTREE_SCOPE);
    	String[] attrsSearch = new String[] { "displayName"};
    	searchResult = context.search("dc="+rb.getString("DOMAIN")+",dc="+rb.getString("DC"),filter, attrsSearch, cons);

    	if (searchResult != null && searchResult.hasMore()) {

    	    List<SearchResult> listResult = Collections.list(searchResult);
    	    Iterator<SearchResult> itListResult = listResult.iterator();
    	    while (itListResult.hasNext()) {

    	        SearchResult entry = (SearchResult) itListResult.next();
    	        Attributes attrsEntry = entry.getAttributes();
    	        Attribute att = attrsEntry.get("description");
    	        Attribute displayname=attrsEntry.get("displayName");
    	        Attribute samaccountname=attrsEntry.get("sAMAccountName");
    	        Attribute mail=attrsEntry.get("mail");
    	        Attribute department=attrsEntry.get("department");
    	        Attribute distinguishedname=attrsEntry.get("DistinguishedName");
    	        Attribute userAccountControl=attrsEntry.get("userAccountControl");
    	        if (att != null) {
    	        	String description = (String) att.get();
    	            String fullname=(String)displayname.get();
    	            String username = (String)samaccountname.get();
    	            String email=(String)mail.get();
    	            String dn=(String)distinguishedname.get();
    	            String active=(String) userAccountControl.get();
    	            String area=(String)department.get();
    	            person=new PersonaBean();
    	            person.setUserid(username);
    	            person.setFullname(fullname);
    	            person.setDescription(description);
    	            person.setEmail(email);
    	            person.setDn(dn);
    	            person.setArea(area);
    	            if (active.equals("66048")) {
    	            	person.setActive("Si");
					}else {
						person.setActive("No");
					}
    	            lista.add(person);
    	            //consola
    	            System.out.println(username);
    	            System.out.println(fullname);
    	            System.out.println(description);
    	            System.out.println(email);
    	            System.out.println(area);
    	            System.out.println(dn);
    	            System.out.println(active);
    	            System.out.println("Cuenta Activa: "+person.getActive());
    	        }
    	    }
    	}
    	searchResult.close();
        context.close();
        
    	}catch (NamingException e) {
        	System.out.println("User No encontrado");
            e.printStackTrace();
            return null;
        }
		return lista; 
	}

	@Override
	public List<PersonaBean> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int create(PersonaBean bean, String entidad) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(PersonaBean bean, String entidad) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id, String entidad) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PersonaBean> listActivo(String entidad) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonaBean> listInactivo(String entidad) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNewCod(String entidad) {
		// TODO Auto-generated method stub
		return null;
	}



}
