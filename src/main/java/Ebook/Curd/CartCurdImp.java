package Ebook.Curd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Ebook.Entity.BookCart;
import Ebook.Entity.BookDetails;

public class CartCurdImp implements CartCurdInterface {

	
	/*-- Create a sequence for auto-incrementing cart_id
	CREATE SEQUENCE cart_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	
	-- Create the Cart table
	CREATE TABLE bookcart (
	    cart_id NUMBER PRIMARY KEY,
	    bookID NUMBER REFERENCES BookDetails(bookId) ON DELETE CASCADE,
	    userEmail VARCHAR2(50) REFERENCES bookuser(email) ON DELETE CASCADE,
	    bookName VARCHAR2(50),
	    author VARCHAR2(50),
	    price DOUBLE PRECISION,
	    totalPrice DOUBLE PRECISION
	);
	
	-- Create a trigger to auto-increment cart_id
	CREATE OR REPLACE TRIGGER cart_trigger
	BEFORE INSERT ON bookcart
	FOR EACH ROW
	BEGIN
	    IF :NEW.cart_id IS NULL THEN
	        SELECT cart_seq.NEXTVAL INTO :NEW.cart_id FROM DUAL;
	    END IF;
	END;
	/*/
	private Connection conn;
	public CartCurdImp(Connection conn) {
		super();
		this.conn=conn;
	}
	
	@Override
	public boolean addCart(BookCart c) {
		Boolean f=false;
		try {
			String qry="INSERT INTO bookcart (bookId, userEmail, bookName, author, price, totalPrice) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, c.getBookId());
			ps.setString(2, c.getUserEmail());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
//			System.out.println(c.getBookId());
//			System.out.println(c.getUserEmail());
//			System.out.println(c.getBookName());
//			System.out.println(c.getBookName());
//			System.out.println(c.getAuthor());
//			System.out.println(c.getPrice());
			
			
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
	public List<BookCart> getBookByUser(String email) {
		List<BookCart> list=new ArrayList<BookCart>();
		BookCart bc=null;
		Double totalPrice=0.0;
		try {
			String qry="select * from bookcart where userEmail=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				bc=new BookCart();
				bc.setCartId(rs.getInt(1));
				bc.setBookId(rs.getInt(2));
				bc.setUserEmail(rs.getString(3));
				bc.setBookName(rs.getString(4));
				bc.setAuthor(rs.getString(5));
				bc.setPrice(rs.getDouble(6));
				totalPrice=totalPrice+rs.getDouble(7);
				bc.setTotalPrice(totalPrice);
				
				list.add(bc);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean removeBookCart(int cartId,String userEmail) {
		boolean f=false;
		try {
			String qry="delete from bookcart where cart_id=? and userEmail=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, cartId);
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
	
	@Override
	public boolean clearCartByUser(String userEmail) {
	    boolean f = false;
	    try {
	        String sql = "DELETE FROM bookcart WHERE useremail = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, userEmail);
	        int i = ps.executeUpdate();
	        if (i > 0) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}

	
	
}
