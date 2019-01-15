package edu.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.Reply;
import edu.spring.project.persistence.ReplyDao;

@Service
public class ReplyServiceImple implements ReplyService {

	@Autowired private ReplyDao replyDao;
	
	public int insert(Reply reply) {
		return replyDao.createReply(reply);
	}

	public List<Reply> selectByBno(int bno) {
		
		return replyDao.readReplyList(bno);
	}

	public List<Reply> selectByUno(int uno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int update(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int rno) {
		
		return replyDao.deleteReply(rno);
	}

}
