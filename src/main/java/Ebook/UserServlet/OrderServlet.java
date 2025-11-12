package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Ebook.Curd.CartCurdImp;
import Ebook.Curd.OrderCurdImp;
import Ebook.DB.DBconnect;
import Ebook.Entity.Order;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// Get parameters from the form
			String userEmail = req.getParameter("email");
			String bookIds = req.getParameter("bookid");
			int countOfBook = Integer.parseInt(req.getParameter("countOfBook"));
			float totalAmount = Float.parseFloat(req.getParameter("totalAmount"));
			String modeOfPayment = req.getParameter("modeOfPayment");

			// Create order object and set data
			Order order = new Order();
			order.setUseremail(userEmail);
			order.setBookId(bookIds);
			order.setCount(countOfBook);
			order.setTotalPrice(totalAmount);
			order.setModeOfPayment(modeOfPayment);
			

			// Save order to DB using DAO
			OrderCurdImp dao = new OrderCurdImp(DBconnect.getConn());
			boolean f = dao.addOrder(order);

			// Create session and set messages
			HttpSession session = req.getSession();
			if (f) {
				
				// ✅ Clear all books from user's cart after successful order
				CartCurdImp cartDao = new CartCurdImp(DBconnect.getConn());
				boolean cartCleared = cartDao.clearCartByUser(userEmail);
				
				if (cartCleared) {
					session.setAttribute("orderSuccess", "Order placed successfully! Cart has been cleared.");
				} else {
					session.setAttribute("orderSuccess", "Order placed successfully, but could not clear the cart.");
				}
				resp.sendRedirect("allCart.jsp");
			} else {
				session.setAttribute("orderFailed", "Something went wrong! Try again.");
				resp.sendRedirect("Payments.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
