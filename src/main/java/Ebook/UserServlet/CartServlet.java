package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Ebook.Curd.BookCurdImp;
import Ebook.Curd.CartCurdImp;
import Ebook.DB.DBconnect;
import Ebook.Entity.BookCart;
import Ebook.Entity.BookDetails;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bookId=Integer.parseInt(req.getParameter("bookId"));
			String userEmail=req.getParameter("userEmail");
			
			BookCurdImp dao=new BookCurdImp(DBconnect.getConn());
			BookDetails b=dao.getBookById(bookId);
			BookCart c=new BookCart();
			c.setBookId(bookId);
			c.setUserEmail(userEmail);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(b.getPrice());
			c.setTotalPrice(b.getPrice());
			
			CartCurdImp dao1=new CartCurdImp(DBconnect.getConn());
			boolean f=dao1.addCart(c);
			
			HttpSession session=req.getSession();
			if(f) {
				
				session.setAttribute("addCart", "Book Added Successfully..");
				resp.sendRedirect("index.jsp");
			}else {
				session.setAttribute("notAdded", "Book Not Added..");
				resp.sendRedirect("index.jsp");
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
