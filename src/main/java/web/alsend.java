package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MailDao;
import dao.MailDaoImp;
import dao.UserDao;
import dao.UserDaoImp;
import entity.Email;
import entity.User;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class alsend
 */
public class alsend extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		res.setContentType("application/json;charset=utf-8");

		
		Email email=new Email();
		UserDao ud=new UserDaoImp();
		MailDao ma=new MailDaoImp();
		List<Email> list=null;
	
		Integer sendid=new Integer(0);
		User user=null;
		if(req.getSession().getAttribute("user") instanceof User) {
			user=(User)req.getSession().getAttribute("user");
		}
		
		if(req.getParameter("send")!=null&&"already".equals(req.getParameter("send"))) {
			System.out.println(1);
			String name=req.getParameter("user");
			list=ma.findAllSen(name);
			System.out.println(list);
			if(list!=null) {
				req.setAttribute("emps", list);
				/*req.getRequestDispatcher("recieve.jsp").forward(req, res);*/
				JSONArray jsonArray=JSONArray.fromObject(list);
				res.getWriter().print(jsonArray.toString());
			}else {
				String[] str= {"False"};
				JSONArray jsonArray=JSONArray.fromObject(str);
				res.getWriter().print(jsonArray.toString());	
			}
			return;
		}else if (req.getParameter("send1")!=null&&"alrDe".equals(req.getParameter("send1"))) {
			String id=req.getParameter("id");
			String[] strs=id.split(",");
			String[] str=new String[strs.length];
			for (int i = 0; i < strs.length; i++) {
				if(ma.deleteSen(Integer.parseInt(strs[i]))) {
					str[i]="OK";
				}
				else {
					str[i]="False";
				}
			}
			if(str!=null) {
				JSONArray jsonArray=JSONArray.fromObject(str);
				res.getWriter().println(jsonArray.toString());
			}
			return ;
		}
	}
}
