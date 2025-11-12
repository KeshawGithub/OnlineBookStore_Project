package Ebook.Entity;


import java.sql.Timestamp;

public class Order {
	
	private int orderId;
	private String useremail;
	private String bookId;
	private int count;
	private float totalPrice;
	private String ModeOfPayment;
	private Timestamp orderDate;

	public Timestamp getOrderDate() {
	    return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
	    this.orderDate = orderDate;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(int orderId, String useremail, String bookId, int count, float totalPrice, String modeOfPayment) {
		this.orderId = orderId;
		this.useremail = useremail;
		this.bookId = bookId;
		this.count = count;
		this.totalPrice = totalPrice;
		ModeOfPayment = modeOfPayment;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getModeOfPayment() {
		return ModeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		ModeOfPayment = modeOfPayment;
	}
	
	
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", useremail=" + useremail + ", bookId=" + bookId + ", count=" + count
				+ ", totalPrice=" + totalPrice + ", ModeOfPayment=" + ModeOfPayment + "]";
	}
	
	
	
	
}
