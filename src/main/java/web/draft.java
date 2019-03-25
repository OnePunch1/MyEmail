package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MailDao;
import dao.MailDaoImp;
import entity.Email;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class draft
 */
public class draft extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		res.setContentType("application/json;charset=utf-8");

		MailDao ma=new MailDaoImp();
		List<Email> list=null;
	
		User user=null;
		if(req.getSession().getAttribute("user") instanceof User) {
			user=(User)req.getSession().getAttribute("user");
		}
		if(req.getParameter("draft1")!=null&&"xianshi".equals(req.getParameter("draft1"))) {
			String name=req.getParameter("user");
			list=ma.findDraftAll(name);
			if(list!=null) {
				JSONArray jsonArray=JSONArray.fromObject(list);
				res.getWriter().print(jsonArray.toString());
			}else {
				String[] str= {"False"};
				JSONArray jsonArray=JSONArray.fromObject(str);
				res.getWriter().print(jsonArray.toString());	
			}
			return;
		}else if(req.getParameter("draft2")!=null&&"delete".equals(req.getParameter("draft2"))) {
			String id=req.getParameter("id");
			String[] strs=id.split(",");
			String[] str=new String[strs.length];
			for (int i = 0; i < strs.length; i++) {
				if(ma.deleteDraft(Integer.parseInt(strs[i]))) {
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
