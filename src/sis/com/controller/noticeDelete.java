package sis.com.controller;
import java.io.*;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class noticeDelete
 */
public class noticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("name");
		final String UPLOAD_FOLDER = getServletContext().getRealPath("my_Uploads");
		File file = new File(UPLOAD_FOLDER+fileName);
		if(file.exists()){
			file.delete();
		}
		 final String propPath = getServletContext().getRealPath("\\my_notices.properties");
		File file1=new File(propPath);
		Properties prop =new Properties();
		FileReader fr = new FileReader(file1);
		prop.load(fr);
		prop.remove(fileName);
		Writer out = new PrintWriter(file1);
		prop.store(out ,null);
		
		response.sendRedirect("adminNotice.jsp");
	}
       
}
