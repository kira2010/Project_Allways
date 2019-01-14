package edu.spring.project.service;

import java.util.List;

import edu.spring.project.domain.Reply;

public interface ReplyService {

	int insert(Reply reply);
	
	List<Reply> selectByBno(int Bno);
	List<Reply> selectByUno(int uno);
	
	int update(Reply reply);
	int delete(int rno);
}
