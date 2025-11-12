package Ebook.Curd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Ebook.Entity.BookDetails;

public class BookCurdImp implements BookCurdInterface {
	
	private Connection conn;
	public BookCurdImp(Connection conn) {
		super();
		this.conn=conn;
	}
	
//	--------------------SQL CODE------------------
//	CREATE TABLE BookDetails (
//    bookId INT PRIMARY KEY,
//    bookname VARCHAR(255) NOT NULL,
//    author VARCHAR(255) NOT NULL,
//    price DECIMAL(10,2) NOT NULL,
//    bookCategory VARCHAR(50) NOT NULL,
//    bookStatus VARCHAR(50) NOT NULL,
//    photoName VARCHAR(255),
//    email VARCHAR(100) NOT NULL
//	  );

	
//	CREATE SEQUENCE bookDetails_seq
//	START WITH 1
//	INCREMENT BY 1
//	NOCACHE;

	
//	CREATE OR REPLACE TRIGGER bookDetails_trigger
//	BEFORE INSERT ON BookDetails 
//	FOR EACH ROW
//	BEGIN
//	    IF :NEW.bookId IS NULL THEN
//	        SELECT bookDetails_seq.NEXTVAL INTO :NEW.bookId FROM dual;
//	    END IF;
//	END;
//	/	



	@Override
	public boolean addBooks(BookDetails bd) {
		boolean f=false;
		try {
			String qry="INSERT INTO BookDetails (bookname, author, price, bookCategory, bookStatus, photoName, email) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, bd.getBookname());
			ps.setString(2, bd.getAuthor());
			ps.setDouble(3, bd.getPrice());
			ps.setString(4, bd.getBookCategory());
			ps.setString(5, bd.getBookStatus());
			ps.setString(6, bd.getPhotoName());
			ps.setString(7, bd.getEmail());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			String qry="select * from BookDetails order by bookId asc";
			PreparedStatement ps=conn.prepareStatement(qry);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getBookById(int BookId) {
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookId=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, BookId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public boolean updateBook(BookDetails bd) {
		boolean f=false;
		try {
			String qry="update BookDetails set bookname=?,author=?,price=?,bookStatus=? where bookId=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, bd.getBookname());
			ps.setString(2, bd.getAuthor());
			ps.setDouble(3, bd.getPrice());
			
			ps.setString(4, bd.getBookStatus());
			ps.setInt(5, bd.getBookId());
		
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean deleteBook(int bookId) {
		boolean f=false;
		try {
			String qry="delete from BookDetails where bookId=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, bookId);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDetails> getNewBook() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookCategory=? and bookStatus=? order by bookId asc";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookStatus=? order by bookId desc";
			PreparedStatement ps=conn.prepareStatement(qry);
			
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookCategory=? and bookStatus=? order by bookId asc";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookCategory=? and bookStatus=? order by bookId asc";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
		
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookCategory=? and bookStatus=? order by bookId asc";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookStatus=? order by bookId desc";
			PreparedStatement ps=conn.prepareStatement(qry);
			
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllUploadedBookByUser(String email) {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String qry="select * from BookDetails where bookCategory=? and email=? order by bookId desc";
			PreparedStatement ps=conn.prepareStatement(qry);
			
			ps.setString(1, "Old");
			ps.setString(2, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean removeOldBook(int bookId, String userEmail) {
		boolean f=false;
		try {
			String qry="delete from BookDetails where bookId=? and email=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, bookId);
			ps.setString(2, userEmail);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}


	
	
	

}
