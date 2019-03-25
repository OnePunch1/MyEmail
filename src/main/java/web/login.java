package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dao.UserDaoImp;
import entity.User;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
/*	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext context=getServletContext();
		context.setAttribute("id", 0);
	}*/

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("html/text;charset=utf-8");

		
		User user=new User();
		UserDao usDao=new UserDaoImp();
/*		user.setId(1);*/
		
		HttpSession session=req.getSession();
		if(req.getParameter("sign")!=null&&req.getParameter("sign").equals("loginsign")) {
			if(req.getParameter("Name")!=null) {
//				id√ª”–…Ë÷√
				user.setUserName(req.getParameter("Name"));
				user.setPassWord(req.getParameter("Password"));
				
				if (usDao.find(user)) {
					session.setAttribute("user", user);
					/*System.out.println(user.getUserName()+" "+user.getPassWord());*/
					/*req.getRequestDispatcher("zhuye.jsp").forward(req, res);*/
					res.sendRedirect("zhuye.jsp");
					return;
				}
			}
			res.sendRedirect("index.jsp");
			return;
		}else if(req.getParameter("act")!=null&&req.getParameter("act").equals("loginout")){
			session.invalidate();
			res.sendRedirect("index.jsp");
			return;
		}else if(req.getParameter("register")!=null&&req.getParameter("register").equals("loginre")) {
			if (req.getParameter("Name")!=null) {
				Integer i=usDao.findMaxId();
				user.setId(++i);				
				user.setUserName(req.getParameter("Name"));
				user.setPassWord(req.getParameter("Password_confirm"));
				if(usDao.save(user)) {
					res.sendRedirect("index.jsp");
					return;
				}
			}
		}
		
		
		

/*		if(req.getParameter("Name")==null) {
			Cookie[] cookies=req.getCookies();
			if(cookies!=null) {
				for (Cookie cookie : cookies) {
					if("Name".equals(cookie.getName())) {
						user.setId(null);
						user.setUserName(cookie.getValue());
					}
					if("PassWord".equals(cookie.getName())) {
						user.setPassWord(cookie.getValue());
					}
				}
			}
			
		}else {	
			user.setId(null);
			user.setUserName(req.getParameter("Name"));
			user.setPassWord(req.getParameter("PassWord"));
		}
		if(usDao.find(user)) {
			Cookie cookName=new Cookie("Name", user.getUserName());
			cookName.setMaxAge(60*60*24*7);
			res.addCookie(cookName);
			Cookie cookPw=new Cookie("PassWord", user.getPassWord());
			cookPw.setMaxAge(60*60*24*7);	
			res.addCookie(cookPw);
			res.sendRedirect("zhuye.jsp");
		}else {
			res.sendRedirect("index.jsp");
		}*/
	}
	
}
