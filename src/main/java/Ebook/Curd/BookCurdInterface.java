package Ebook.Curd;

import java.util.List;

import Ebook.Entity.BookDetails;

public interface BookCurdInterface {
	public boolean addBooks(BookDetails bd);
	public List<BookDetails> getAllBooks(); 
	public BookDetails getBookById(int bookId);
	public boolean updateBook(BookDetails b);
	public boolean deleteBook(int bookId);
	public List<BookDetails> getNewBook();
	public List<BookDetails> getRecentBook();
	public List<BookDetails> getOldBook();
	public List<BookDetails> getAllNewBook();
	public List<BookDetails> getAllOldBook();
	public List<BookDetails> getAllRecentBook();
	public List<BookDetails> getAllUploadedBookByUser(String email);
	public boolean removeOldBook(int bookId,String userEmail);
	
}
