package edu.spring.project.service;

import edu.spring.project.domain.User;

public interface UserService {

	public int insert(User user);
	
	public User login(User user);
	
}
