package edu.spring.project.persistence;

import edu.spring.project.domain.User;

public interface UserDao {
	User loginCheck(User user);
	
	boolean checkUser(String userId);
	
	int insertUser(User user);
	
	int updateUser(User user);
	
	int deleteUser(int uno);
}
