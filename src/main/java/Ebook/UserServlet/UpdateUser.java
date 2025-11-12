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

@WebServlet("/EditUser")
public class UpdateUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String username = req.getParameter("userName");
			String email = req.getParameter("email");
			String mobileNo = req.getParameter("mobileNo");
			String password = req.getParameter("password");
			
			User us=new User();
			us.setEmail(email);
			us.setUsername(username);
			us.setMobileNo(mobileNo);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			UserCurdImpl dao=new UserCurdImpl(DBconnect.getConn());
			boolean f=dao.checkPassword(email, password);

			if(f) {
				boolean f2=dao.UpdateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", "Update Successfully..");
					resp.sendRedirect("EditProfile.jsp");
					session.setAttribute("Msg", "Please Logout to Make Change In your Account");
					resp.sendRedirect("EditProfile.jsp");
				}else {
					session.setAttribute("FailedMsg", "Somthing wrong on server");
					resp.sendRedirect("EditProfile.jsp");
				}
			}else {
				session.setAttribute("FailedMsgMsg", "Your Password is Incorrect");
				resp.sendRedirect("EditProfile.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
