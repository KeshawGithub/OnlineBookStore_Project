package Ebook.UserServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Ebook.Curd.BookCurdImp;
import Ebook.DB.DBconnect;
import Ebook.Entity.BookDetails;

@WebServlet("/sellOldBook")
@MultipartConfig
public class AddOldBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("UserEmail");
			String bookName=req.getParameter("bookName");
			String authorName=req.getParameter("authorName");
			double price=Double.parseDouble(req.getParameter("price"));
			String categories="Old";
			String status="Active";
			Part part=req.getPart("BookImage");
			String fileName=part.getSubmittedFileName();

			BookDetails bd=new BookDetails(bookName,authorName,price,categories,status,fileName, email);
			BookCurdImp b=new BookCurdImp(DBconnect.getConn());
			
		
			
			boolean f=b.addBooks(bd);
			HttpSession session=req.getSession();
			if(f) {
				String path=getServletContext().getRealPath("")+"bookImg";
				File file=new File(path);
				part.write(path+ File.separator + fileName);
				session.setAttribute("bookSuccMsg", "BookAdded Seccussfully");
				resp.sendRedirect("SellOldBook.jsp");
			}else {
				session.setAttribute("bookFailedMsg", "Something wrong on Server...!");
				resp.sendRedirect("SellOldBook.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
