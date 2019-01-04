package edu.spring.project.persistence;

import edu.spring.project.domain.User;

public interface UserDao {
	User loginCheck(User user);
	
	boolean checkUser(String userId);
	
	int findUno(User user);
	
	int createUser(User user);
	
	int updateUser(User user);
	
	int deleteUser(int uno);
}
