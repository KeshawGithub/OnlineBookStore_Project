package Ebook.Curd;

import java.util.List;

import Ebook.Entity.BookCart;


public interface CartCurdInterface {
	public boolean addCart(BookCart c);
	public List<BookCart> getBookByUser(String email);
	public boolean removeBookCart(int cartId, String userEmail);
	public boolean clearCartByUser(String userEmail);
	
}
