package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Ebook.Curd.UserCurdImpl;
import Ebook.DB.DBconnect;
import Ebook.Entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			UserCurdImpl dao=new UserCurdImpl(DBconnect.getConn());
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			if("admin123@gmail.com".equals(email)&&"admin123".equals(password)) {
				
			
				 User u = new User(); 
				 u.setUsername("Admin");
				 session.setAttribute("AdminObj" ,u);
				 
				resp.sendRedirect("Admin/AdminHome.jsp");

			}else {
				User us=dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userObj" ,us);
					session.setAttribute("LoginSuccMsg" ,"Login Successfull..!");
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMssg" ,"Email & Password Invalid");
					resp.sendRedirect("register.jsp");
				}	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
