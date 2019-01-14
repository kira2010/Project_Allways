package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.User;

public interface UserDao {
	User loginCheck(User user);
	
	boolean checkUser(String userId);
	
	int findUnoFromId(String userId);
	
	User findUserByUno(int uno);
	
	List<User> findUserByName(String userName);
	
	List<User> findUserByGraduation(String graduation);
	
	List<User> findUserByNameAndGraduation(User user);
	
	String findUserId(User user);
	
	int findUserPwd(User user);
	
	int createUser(User user);
	
	int updateUser(User user);
	
	int updateEmotion(User user);
	
	int resetUserPwd(int uno);
	
	int deleteUser(int uno);
}
