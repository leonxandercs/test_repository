package pe.gob.munisjl.javax.servlets;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import pe.gob.munisjl.java.bean.FutBean;
import pe.gob.munisjl.java.bean.PersonaBean;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
		  		HttpSession session=request.getSession();
		   		String idcarpeta=(String)session.getAttribute("idcarpeta");
		  		PersonaBean fichero=(PersonaBean)session.getAttribute("usuario_logueado");
		  		String patcarpeta=fichero.getCodigo();
		  
	        if (isMultipart) {
	        	// Create a factory for disk-based file items
	        	FileItemFactory factory = new DiskFileItemFactory();

	        	// Create a new file upload handler
	        	ServletFileUpload upload = new ServletFileUpload(factory);
	 
	            try {
	            	// Parse the request
					List /* FileItem */ items = upload.parseRequest(request);
					Iterator iterator = items.iterator();
	                while (iterator.hasNext()) {
	                    FileItem item = (FileItem) iterator.next();
	                    if (!item.isFormField()) {
	                        String fileName = item.getName();	 
	                        //String root = getServletContext().getRealPath("/");
	                        //File path = new File(root + "/uploads");
	                        try {
	                        	File path=new File("C:/Files/"+patcarpeta+"/"+idcarpeta);
	                        	
	                        	if (path.exists()==false) {
	                        	 // Esto ocurre solo la primera vez que se lanza la aplicacion
	                        	 // puesto que no hay archivo de registros
	                        	 path = new File("C:\\Files\\"+patcarpeta+"\\"+idcarpeta);
	                        	 path.mkdirs();
	                        	 path=new File("C:/Files/"+patcarpeta+"/"+idcarpeta);
	                        	 File uploadedFile = new File(path + "/" + fileName);
     	                         System.out.println(uploadedFile.getAbsolutePath());
     	                         System.out.println(uploadedFile.getPath());
     	                         System.out.println(uploadedFile.getParent());
     	                         System.out.println(uploadedFile.getName());
     	                         System.out.println(uploadedFile.getAbsoluteFile());
     	                         System.out.println(uploadedFile.getParentFile());
     	                        item.write(uploadedFile);
	                        	 
	                        	}else{
	                        		File uploadedFile = new File(path + "/" + fileName);
	     	                        System.out.println(uploadedFile.getAbsolutePath());
	     	                        System.out.println(uploadedFile.getPath());
	     	                        System.out.println(uploadedFile.getParent());
	     	                        System.out.println(uploadedFile.getName());
	     	                        System.out.println(uploadedFile.getAbsoluteFile());
	     	                        System.out.println(uploadedFile.getParentFile());
	     	                        item.write(uploadedFile);
	                        	}
							} catch (Exception e) {
								e.printStackTrace();
								System.out
							     .println("Error al crear la ruta");
							}	     
	                    }
	                }
	            } catch (FileUploadException e) {
	                e.printStackTrace();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	}

}
