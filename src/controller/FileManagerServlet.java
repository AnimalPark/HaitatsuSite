package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/filemanager/*" })
public class FileManagerServlet extends HttpServlet {

	private static final long serialVersionUID = 5811070291955786316L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");		
		String filename = uri.substring(lastIndex + 1);		

		String imgpath = getServletContext().getRealPath("/WEB-INF") + "\\" + filename;

		File file = new File(imgpath);
		
		if(file.exists()) {
			
			response.setContentType("image/jpg");
			ServletOutputStream servletOutputStream = response.getOutputStream();
			
			FileInputStream fileInputStream = new FileInputStream(file);
			
			int length=0;		
			byte[] buffer = new byte[1024];
			
			while ((length = fileInputStream.read(buffer)) != -1) {
				servletOutputStream.write(buffer, 0, length);
			}
			fileInputStream.close();
			servletOutputStream.close();
		}
	}
}