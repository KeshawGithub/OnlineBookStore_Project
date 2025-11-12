package Ebook.Curd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Ebook.Entity.Order;

public class OrderCurdImp implements OrderCurdInterface{
	private Connection conn;

    public OrderCurdImp(Connection conn) {
        this.conn = conn;
    }

    /*
    CREATE TABLE book_order (
    	    order_id NUMBER PRIMARY KEY,
    	    user_email VARCHAR2(100) NOT NULL,
    	    cart_ids VARCHAR2(255) NOT NULL,
    	    count_of_book NUMBER NOT NULL,
    	    total_amount NUMBER(10,2) NOT NULL,
    	    mode_of_payment VARCHAR2(50) NOT NULL,
    	    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    	    CONSTRAINT fk_user_email FOREIGN KEY (user_email)
    	        REFERENCES bookuser(email)
    	        ON DELETE CASCADE
    	);

    	CREATE SEQUENCE book_order_seq
    	START WITH 1
    	INCREMENT BY 1
    	NOCACHE;

		  CREATE OR REPLACE TRIGGER book_order_trigger
		BEFORE INSERT ON book_order
		FOR EACH ROW
		BEGIN
		    IF :NEW.order_id IS NULL THEN
		        SELECT book_order_seq.NEXTVAL INTO :NEW.order_id FROM dual;
		    END IF;
		END;
		/
*/
    
    @Override
    public boolean addOrder(Order order) {
        boolean f = false;
        try {
            String sql = "INSERT INTO book_order (user_email, book_ids, count_of_book, total_amount, mode_of_payment) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, order.getUseremail());
            ps.setString(2, order.getBookId());
            ps.setInt(3, order.getCount());
            ps.setDouble(4, order.getTotalPrice());
            ps.setString(5, order.getModeOfPayment());
          

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    // ✅ Get all orders (Admin View)
    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_order ORDER BY order_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUseremail(rs.getString("user_email"));
                o.setBookId(rs.getString("book_ids"));
                o.setCount(rs.getInt("count_of_book"));
                o.setTotalPrice(rs.getFloat("total_amount"));
                o.setModeOfPayment(rs.getString("mode_of_payment"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Get orders by User Email
    @Override
    public List<Order> getOrdersByEmail(String userEmail) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_order WHERE user_email = ? ORDER BY order_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUseremail(rs.getString("user_email"));
                o.setBookId(rs.getString("book_ids"));
                o.setCount(rs.getInt("count_of_book"));
                o.setTotalPrice(rs.getFloat("total_amount"));
                o.setModeOfPayment(rs.getString("mode_of_payment"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
