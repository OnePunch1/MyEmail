package web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Down
 */
public class Down extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		 String path=req.getParameter("fileName");
	       File file=new File(path);
	       res.setContentType("application/octet-stream;charset=utf-8");
	       res.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(file.getName(),"UTF-8")); 
	       res.setContentLength((int) file.length());
	      /* res.addHeader("Content-dispositio", "attachment;filename=zheng.png");*/
	       /*res.setContentType(getServletContext().getMimeType(file.getName()));*/
	       ServletOutputStream outputStream = res.getOutputStream();
	        FileInputStream fis = new FileInputStream(file);  
	        int len = 0;  
	        byte[] b = new byte[1024];  
	        while ((len = fis.read(b)) != -1) { 
	            outputStream.write(b, 0, len);
	        }  
	        fis.close(); 
	        outputStream.flush();
	        outputStream.close();
	       
	       /* String[] str= {"OK"};
			JSONArray jsonArray=JSONArray.fromObject(str);
			pw=res.getWriter();
			pw.print(jsonArray.toString());
			pw.close();*/
	        return ;
	}
	
}
