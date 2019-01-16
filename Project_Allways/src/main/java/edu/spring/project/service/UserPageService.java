package edu.spring.project.service;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.User;

public interface UserPageService {
	
	
	User check(int uno);
	
	int updateEmo(User user);
	
	int existAllwaiser(Allwaiser allwaiser);
}
