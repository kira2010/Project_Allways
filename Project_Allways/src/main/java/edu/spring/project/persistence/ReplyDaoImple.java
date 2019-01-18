package edu.spring.project.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.project.domain.Reply;

@Repository
public class ReplyDaoImple implements ReplyDao {
	
	private static final String REPLY_MAPPER = 
			"edu.spring.project.mappers.ReplyMapper";
	
	private final Logger logger = LoggerFactory.getLogger(ReplyDaoImple.class);
	
	@Autowired private SqlSession session;
	
	// bno를 통해  board에 붙은 모든 reply 리스트 가져오기
	public List<Reply> readReplyList(int bno) {
		logger.info("readReplyList(bno : {}) 호출", bno);
		
		return session.selectList(REPLY_MAPPER + ".selectReplyByBno", bno);
	}
	
	// bno를 통해  board에 붙은 모든 reply 리스트의 개수 count
	public int countReplyList(int bno) {
		logger.info("countReplyList(bno : {}) 호출", bno);
		
		return session.selectOne(REPLY_MAPPER + ".countReplyByBno", bno);
	}
	
	// reply 생성
	public int createReply(Reply reply) {
		logger.info("createReply({}) 호출", reply);
		
		return session.insert(REPLY_MAPPER + ".registReply", reply);
	}
	
	// 사용자가 프로필 사진을 변경할 때 reply의 프로필 갱신
	public int changePFPhoto(int uno) {
		logger.info("changePFPhoto() 호출");
		
		return session.update(REPLY_MAPPER + ".changeProfile", uno);
	}
	
	// reply 삭제
	public int deleteReply(int rno) {
		logger.info("deleteReply(rno : {}) 호출", rno);
		
		return session.delete(REPLY_MAPPER + ".deleteReply", rno);
	}
}
