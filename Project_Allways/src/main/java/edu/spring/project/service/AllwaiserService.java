package edu.spring.project.service;

import java.util.List;

import edu.spring.project.domain.Allwaiser;

public interface AllwaiserService {

	int add(Allwaiser allwaiser);
	
	int delete(int f_no);
	
	List<Allwaiser> select(int uno);
	
}
