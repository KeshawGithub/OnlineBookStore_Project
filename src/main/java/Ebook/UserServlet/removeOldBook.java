package Ebook.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Ebook.Curd.BookCurdImp;
import Ebook.DB.DBconnect;

@WebServlet("/removeOldBook")
public class removeOldBook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookId=Integer.parseInt(req.getParameter("bookId"));
		String useremail=req.getParameter("email");
		BookCurdImp dao=new BookCurdImp(DBconnect.getConn());
		boolean f=dao.removeOldBook(bookId, useremail);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("RemoveSucc", "Book Remove Successfully...");
			resp.sendRedirect("SellOldBook.jsp");
		}else {
			session.setAttribute("RemoveFaield", "Something wrong on server...");
			resp.sendRedirect("SellOldBook.jsp");
		}
	}
}
