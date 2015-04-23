package pe.gob.munisjl.java.util;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

public class ConexionLDAP {

	  public ResourceBundle rb=ResourceBundle.getBundle("infoLDAP");
	
      public DirContext getContexto(String user,String pass){
    	  
    	  
	    	Properties env = new Properties();
	      	env.put(Context.INITIAL_CONTEXT_FACTORY,rb.getString("INITCTX"));
	      	env.put(Context.PROVIDER_URL,rb.getString("MY_AD"));
	      	env.put(Context.SECURITY_AUTHENTICATION, "simple");
	      	env.put(Context.SECURITY_PRINCIPAL,rb.getString("DOMAIN")+"\\"+user);
	      	env.put(Context.SECURITY_CREDENTIALS,pass);
	      	System.out.println("testing");
	      	
	      	DirContext ctx = null;
			try {
				ctx = new InitialDirContext(env);
			} catch (NamingException e) {
				e.printStackTrace();
				System.out.println("Conexión Incorrecta");
				System.out.println("ctx null");
                return null;
			}
	      	
	      	return ctx;
	      }
}
