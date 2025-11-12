package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutAdmin")
public class LogoutServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			session.removeAttribute("AdminObj");
			
			HttpSession session1=req.getSession();
			session1.setAttribute("succMsg", "LogOut Successfull..");
			resp.sendRedirect("register.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
