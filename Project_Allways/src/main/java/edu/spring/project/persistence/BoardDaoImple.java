package edu.spring.project.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.project.domain.Board;

@Repository
public class BoardDaoImple implements BoardDao {

	private static final String BOARD_MAPPER = "edu.spring.project.mappers.BoardMapper";
	
	private final Logger logger = LoggerFactory.getLogger(BoardDaoImple.class);
	
	@Autowired private SqlSession session;
	
	public List<Board> readAll(int uno) {
		logger.info("read() 호출");
		
		return session.selectList(BOARD_MAPPER + ".selectMyAll", uno);
	}

	public Board read(int bno) {
		logger.info("read({}) 호출", bno);
		
		return session.selectOne(BOARD_MAPPER + ".selectByBno", bno);
	}

	public List<Board> searchByKeyword(int type, String keyword) {
		
		return null;
	}

	public int createBoard(Board board) {
		logger.info("createBoard({}) 호출", board);
		
		return session.insert(BOARD_MAPPER + ".createBoard", board);
	}

	public int updateBoard(Board board) {
		logger.info("updateBoard({}) 호출", board);
		
		return session.update(BOARD_MAPPER + ".updateBoard", board);
	}

	public int deleteBoard(int bno) {
		logger.info("deleteBoard({}) 호출", bno);
		
		return session.delete(BOARD_MAPPER + ".deleteBoard", bno);
	}

}
