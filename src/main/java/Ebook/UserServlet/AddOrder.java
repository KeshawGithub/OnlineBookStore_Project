package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddOrder extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String cartids=req.getParameter("cartid");
			int coutOfBook=Integer.parseInt(req.getParameter("countOfBook"));
			float totalPrice=Float.parseFloat("totalPrice");
			String modeOfPayment = req.getParameter("modeOfPayment");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
