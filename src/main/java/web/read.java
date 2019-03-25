package web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import dao.MailDao;
import dao.MailDaoImp;
import dao.UserDao;
import dao.UserDaoImp;
import entity.Email;
import entity.Lianxi;
import entity.User;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class read
 */
public class read extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Email email=new Email();
		UserDao ud=new UserDaoImp();
		MailDao ma=new MailDaoImp();
		List<Email> list=null;
		PrintWriter pw=null;
		
		Integer sendid=new Integer(0);
		User user=null;
		if(req.getSession().getAttribute("user") instanceof User) {
			user=(User)req.getSession().getAttribute("user");
		}
		
		if(req.getParameter("see")!=null&&"readEm".equals(req.getParameter("see"))) {
			res.setContentType("application/json;charset=utf-8");
			System.out.println(1);
			int id=Integer.parseInt(req.getParameter("id"));
			email=ma.find(id);
			if(email!=null) {
				req.getSession().setAttribute("emailt", email);
				/*req.setAttribute("emailt", email);
				req.getRequestDispatcher("read.jsp").forward(req, res);*/
				String[] str= {"OK"};
				JSONArray jsonArray=JSONArray.fromObject(str);
				pw=res.getWriter();
				pw.print(jsonArray.toString());
				pw.flush();
				pw.close();
				
			}else {
				String[] str= {"False"};
				JSONArray jsonArray=JSONArray.fromObject(str);
				pw=res.getWriter();
				pw.print(jsonArray.toString());
				pw.close();
				/*res.getWriter().print("Aaaa");*/
			}
			return;
		}
		else if (req.getParameter("lianxi")!=null&&"view".equals(req.getParameter("lianxi"))) {
			res.setContentType("application/json;charset=utf-8");
			List<Lianxi> list1=null;
			String name=req.getParameter("user");
			list1=ma.findAllLian(name);
			if(list1!=null) {
				JSONArray jsonArray=JSONArray.fromObject(list1);
				pw=res.getWriter();
				pw.print(jsonArray.toString());
				pw.close();
			}else {
				String[] str= {"False"};
				JSONArray jsonArray=JSONArray.fromObject(str);
				pw=res.getWriter();
				pw.print(jsonArray.toString());
				pw.close();
			}
		}else if (req.getParameter("shanchu")!=null&&"delian".equals(req.getParameter("shanchu"))) {
			res.setContentType("application/json;charset=utf-8");
			String id=req.getParameter("id");
			System.out.println(id);
			String[] strs=id.split(",");
			String[] str=new String[strs.length];
			for (int i = 0; i < strs.length; i++) {
				if(ma.deleteLian(Integer.parseInt(strs[i]))) {
					str[i]="OK";
				}
				else {
					str[i]="False";
				}
			}
			if(str!=null) {
				JSONArray jsonArray=JSONArray.fromObject(str);
				pw=res.getWriter();
				pw.print(jsonArray.toString());
				pw.close();
			}
			return ;
		}
	}
}
