package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.User;

public interface UserDao {
	User loginCheck(User user);
	
	boolean checkUser(String userId);
	
	int findUno(User user);
	
	List<User> findUserByName(String userName);
	
	List<User> findUserByGraduation(String graduation);
	
	int createUser(User user);
	
	int updateUser(User user);
	
	int deleteUser(int uno);
}
