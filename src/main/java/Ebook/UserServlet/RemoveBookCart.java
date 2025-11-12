package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Ebook.Curd.CartCurdImp;
import Ebook.DB.DBconnect;

@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cartId=Integer.parseInt(req.getParameter("cartId"));
		String useremail=req.getParameter("userEmail");
		CartCurdImp dao=new CartCurdImp(DBconnect.getConn());
		boolean f=dao.removeBookCart(cartId, useremail);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("RemoveSucc", "Book Remove from Cart...");
			resp.sendRedirect("allCart.jsp");
		}else {
			session.setAttribute("RemoveFaield", "Something wrong on server...");
			resp.sendRedirect("allCart.jsp");
		}
	}

}
