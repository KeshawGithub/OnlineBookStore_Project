package Ebook.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;   

public class DBconnect {
	private static final String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String user = "ebook";
    private static final String password = "ebook";
    
    private static Connection conn = null;

    public static Connection getConn() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection(db_url, user, password);
              
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Oracle JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Connection failed: " + e.getMessage());
        }
        
        return conn;
    } 
}
