package web;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Fileload.FileLoad;
import dao.MailDao;
import dao.MailDaoImp;
import dao.UserDao;
import dao.UserDaoImp;
import entity.Email;
import entity.User;
import net.sf.json.JSONArray;


/**
 * Servlet implementation class write
 */
public class write extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		res.setContentType("application/json;charset=utf-8");
		
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
		
		if(req.getParameter("send1")!=null&&"write".equals(req.getParameter("send1"))) {
			/*FileLoad.fileLoad(req);*/
					email=FileLoad.fileLoad(req, email);
					email.setSender(user.getUserName());
					if(ud.findByName(email.getReciever())) {
						if(ma.send(email)&&ma.sendR(email)) {
							String[] str= {"OK"};
							JSONArray jsonArray=JSONArray.fromObject(str);
							pw=res.getWriter();
							pw.print(jsonArray.toString());
							pw.close();
						}
						else {
							String[] str= {"False"};
							JSONArray jsonArray=JSONArray.fromObject(str);
							pw=res.getWriter();
							pw.print(jsonArray.toString());
							pw.close();
						}
					}else {
						String[] str= {"Non"};
						JSONArray jsonArray=JSONArray.fromObject(str);
						pw=res.getWriter();
						pw.print(jsonArray.toString());
						pw.close();
					}
				
			
			return ;
		}else if (req.getParameter("send2")!=null&&"save".equals(req.getParameter("send2"))) {
			Date date=new Date();
			sendid=ma.findDraftMaxId();
			email.setId(++sendid);
			email.setReciever(req.getParameter("reciever"));
			email.setSender(user.getUserName());
			email.setText(req.getParameter("text"));
			email.setTitle(req.getParameter("title"));
			email.setDate(date);
			
			
			if(ma.save(email)) {
				String[] str= {"OK"};
				JSONArray jsonArray=JSONArray.fromObject(str);
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
			return;
		}else if(req.getParameter("recieve1")!=null&&"rehref".equals(req.getParameter("recieve1"))) {
			String name=req.getParameter("user");
			list=ma.findAll(name);
			List<String> list2=null;
			if(list!=null) {
				req.setAttribute("emps", list);
				/*int n=0;
				for (Email email2 : list) {
					if(email2.getFilePath()!=" ") {
						String[] s=email2.getFilePath().split("\\\\");
						list2.add(s[s.length-1]);
					}
				} */
				/*req.getRequestDispatcher("recieve.jsp").forward(req, res);*/
				JSONArray jsonArray=JSONArray.fromObject(list);
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
		}else if (req.getParameter("recieve2")!=null&&"delete".equals(req.getParameter("recieve2"))) {
			String id=req.getParameter("id");
			String[] strs=id.split(",");
			String[] str=new String[strs.length];
			for (int i = 0; i < strs.length; i++) {
				if(ma.delete(Integer.parseInt(strs[i]))) {
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
