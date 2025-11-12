package Ebook.Curd;

import Ebook.Entity.User;

import java.util.List;



public interface UserCurdInterface {
	public  String userRegister(User us);
	public User login(String email, String password);
	public boolean checkPassword(String email, String password);
	public boolean UpdateProfile(User us);
	public boolean UploadAddress(User us);
	public List<User> getAllUsers();
}
