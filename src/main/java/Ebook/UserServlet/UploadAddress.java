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

@WebServlet("/UploadAddress")
public class UploadAddress extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String Address = req.getParameter("Address");
			String Email = req.getParameter("email");
			String Landmark = req.getParameter("Landmark");
			String City = req.getParameter("city");
			String State = req.getParameter("state");
			String PinCode=req.getParameter("pincode");
			
			User us=new User();
			
			us.setEmail(Email);
			us.setAddress(Address);
			us.setLandmark(Landmark);
			us.setCity(City);
			us.setState(State);
			us.setPincode(PinCode);
			
			HttpSession session=req.getSession();
			UserCurdImpl dao=new UserCurdImpl(DBconnect.getConn());
			boolean f=dao.UploadAddress(us);

			if(f) {
					session.setAttribute("succMsg", "Address Upload Successfully..");
					resp.sendRedirect("AddAddress.jsp");
					session.setAttribute("Msg", "Please Logout to Make Change In your Address");
					resp.sendRedirect("AddAddress.jsp");

			}else {
				session.setAttribute("FailedMsgMsg", "Something wrong on server");
				resp.sendRedirect("AddAddress.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
