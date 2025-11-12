package Ebook.AdminServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Ebook.Curd.BookCurdImp;
import Ebook.DB.DBconnect;
import Ebook.Entity.BookDetails;

@WebServlet("/editBook")
public class EditBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
	        int id = Integer.parseInt(req.getParameter("bookid"));
			String bookName=req.getParameter("bookName");
			String authorName=req.getParameter("authorName");
			double price=Double.parseDouble(req.getParameter("price"));
			String status=req.getParameter("bookStatus");
			
			BookDetails bd=new BookDetails();
			bd.setBookId(id);
			bd.setBookname(bookName);
			bd.setAuthor(authorName);
			bd.setPrice(price);
			bd.setBookStatus(status);
			
			BookCurdImp b=new BookCurdImp(DBconnect.getConn());
			boolean f=b.updateBook(bd);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("updateSuccMsg", "BookUpdate Seccussfully");
				resp.sendRedirect("Admin/allBooks.jsp");
			}else {
				session.setAttribute("updateFailedMsg", "Something wrong on Server...!");
				resp.sendRedirect("Admin/allBooks.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
