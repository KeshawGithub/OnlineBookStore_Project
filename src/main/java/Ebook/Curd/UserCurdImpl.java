package Ebook.Curd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import Ebook.Entity.User;

public class UserCurdImpl implements UserCurdInterface {

	private Connection conn;
	
	public UserCurdImpl(Connection conn) {
		super();
		this.conn=conn;
	}
/*CREATE TABLE bookuser (
    username VARCHAR2(50) UNIQUE NOT NULL,
    email VARCHAR2(50) PRIMARY KEY,
    mobileNo VARCHAR2(11) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    address VARCHAR2(50),
    landmark VARCHAR2(50),
    city VARCHAR2(50),
    state VARCHAR2(50),
    pincode VARCHAR2(50)
);*/
	@Override
	public String userRegister(User us) {
		String f="false";
		try {
			String qry="insert into bookuser(username,email,mobileNo,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, us.getUsername());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobileNo());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f="true";
			}
		} catch (SQLIntegrityConstraintViolationException e) {
		    f="Duplicate";
		    e.printStackTrace();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public User login(String email, String password) {
		User u=null;
		
		try {
			String sql="select * from bookuser where email=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				u=new User();
				u.setUsername(rs.getString(1));
				u.setEmail(rs.getString(2));
				u.setMobileNo(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setAddress(rs.getString(5));
				u.setLandmark(rs.getString(6));
				u.setCity(rs.getString(7));
				u.setState(rs.getString(8));
				u.setPincode(rs.getString(9));
			}
			
		}catch(Exception e) {
			
		}

		return u;
	}
	@Override
	public boolean checkPassword(String email, String password) {
	boolean f=false;
	try {
		String qry="select * from bookuser where email=? and password=?";
		PreparedStatement ps= conn.prepareStatement(qry);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			f=true;
			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return f;
	}
	@Override
	public boolean UpdateProfile(User us) {
		boolean f=false;
		try {
			String qry="Update bookuser set username=? ,mobileNo=? where email=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, us.getUsername());
			ps.setString(2, us.getMobileNo());
			ps.setString(3, us.getEmail());
			
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
	public boolean UploadAddress(User us) {
		boolean f=false;
		try {
			String qry="Update bookuser set address=?, landmark=?, city=?, state=?, pincode=? where email=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, us.getAddress());
			ps.setString(2, us.getLandmark());
			ps.setString(3, us.getCity());
			ps.setString(4, us.getState());
			ps.setString(5, us.getPincode());
			ps.setString(6, us.getEmail());
			
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
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        User user = null;
        try {
            String sql = "SELECT * FROM bookuser";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setMobileNo(rs.getString("mobileNo"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setLandmark(rs.getString("landmark"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPincode(rs.getString("pincode"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
