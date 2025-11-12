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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String mobileNo = req.getParameter("mobileNo");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// System.out.println(username+" "+email+" "+mobileNo+" "+password+" "+check);
			User us = new User();
			us.setUsername(username);
			us.setEmail(email);
			us.setMobileNo(mobileNo);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			if (check != null) {
				UserCurdImpl dao = new UserCurdImpl(DBconnect.getConn());
				String f = dao.userRegister(us);
				if (f == "true") {
					//System.out.println("User Register Successful..!");
					session.setAttribute("succMsg", "Registration Successfully..");
					resp.sendRedirect("register.jsp");
				} else if (f == "Duplicate") {
					//System.out.println("Duplicate Username and email..!");
					session.setAttribute("duplicate", "User with the same email or username already exists...");
					resp.sendRedirect("register.jsp");
				} else {
					//System.out.println("Something want wrong on server");
					session.setAttribute("failedMsg", "Something wrong on server..");
					resp.sendRedirect("register.jsp");
				}
			}else {
				//System.out.println("Please Check Agree Terms & Condition");
				session.setAttribute("check", "Please Check Agree Terms & Condition");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
