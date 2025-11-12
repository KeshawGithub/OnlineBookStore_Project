package Ebook.AdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Ebook.Curd.BookCurdImp;
import Ebook.DB.DBconnect;

@WebServlet("/deleteBook")
public class DeleteBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			int id=Integer.parseInt(req.getParameter("bookid"));
			BookCurdImp b=new BookCurdImp(DBconnect.getConn());
			boolean f=b.deleteBook(id);
			System.out.println(id);

			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("deleteSuccMsg", "Book Delete Seccussfull..!");
				resp.sendRedirect("Admin/allBooks.jsp");
			}else {
				session.setAttribute("deleteFailedMsg", "Something wrong on Server...!");
				resp.sendRedirect("Admin/allBooks.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
