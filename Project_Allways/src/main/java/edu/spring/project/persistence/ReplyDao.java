package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.Reply;

public interface ReplyDao {
	List<Reply> readReplyList(int bno);
	
	int countReplyList(int bno);
	
	int createReply(Reply reply);
	
	int changePFPhoto(int uno);
	
	int deleteReply(int rno);
}
