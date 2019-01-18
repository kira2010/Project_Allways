package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.User;

public interface UserDao {
	User loginCheck(User user);
	
	boolean checkUserId(String userId);
	
	boolean checkUserEmail(String userEmail);
	
	int findUnoFromId(String userId);
	
	User findUserByUno(int uno);
	
	List<User> findUserByName(String userName);
	
	List<User> findUserByGraduation(String graduation);
	
	List<User> findUserByNameAndGraduation(User user);
	
	List<User> recommendedAllwaisers(User user, int page);
	
	String findUserId(User user);
	
	int findUserPwd(User user);
	
	int createUser(User user);
	
	int updateUser(User user);
	
	int updateBGPhoto(User user);
	
	int updatePFPhoto(User user);
	
	int updateEmotion(User user);
	
	int resetUserPwd(int uno);
	
	int deleteUser(int uno);
}
