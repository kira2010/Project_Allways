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
	
	// 내가 작성한 모든 게시글 가져오기
	public List<Board> readAll(int uno) {
		logger.info("read(uno : {}) 호출");
		
		return session.selectList(BOARD_MAPPER + ".selectMyAll", uno);
	}

	// 게시글 자세히 보기
	public Board read(int bno) {
		logger.info("read(bno : {}) 호출", bno);
		
		return session.selectOne(BOARD_MAPPER + ".selectByBno", bno);
	}
	
	// 내용 기반 검색
	public List<Board> searchByKeyword(int type, String keyword) {
		logger.info("searchByKeyword(type : {}, keyword : {}) 호출", type, keyword);
		
		// TODO : 쿼리 작성 후 수정 예정!!!!
		return null;
	}
	
	// 내가 저정한 즐겨찾기 목록 중 공개범위 0/1 인 모든 게시글 가져오기
	public List<Board> readMyFavorite(int uno) {
		logger.info("readMyFavorite(uno : {}) 호출", uno);
		
		return session.selectList(BOARD_MAPPER + ".selectMyFavorite", uno);
	}
	
	// 내가 등록한 Allwaiser가 작성한 게시글 목록 중 공개범위 0/1인 모든 게시글 가져오기
	public List<Board> readMyAllwaisersPost(int uno) {
		logger.info("readMyAllwaisersPost(uno : {}) 호출", uno);
		
		return session.selectList(BOARD_MAPPER + ".selectMyAllwaisersPost", uno);
	}
	
	// 내가 등록한 Allwaiser가 작성한 게시글 목록 중 공개범위 0/1인 모든 게시글의 갯수 세기
	public int countMyAllwaisersPost(int uno) {
		logger.info("countMyAllwaisersPost(uno : {}) 호출", uno);
		
		return session.selectOne(BOARD_MAPPER + ".countMyALlwaisersPost", uno);
	}
	
	// 게시글 작성하기
	public int createBoard(Board board) {
		logger.info("createBoard({}) 호출", board);
		
		return session.insert(BOARD_MAPPER + ".createBoard", board);
	}
	
	// 게시글 수정하기
	public int updateBoard(Board board) {
		logger.info("updateBoard({}) 호출", board);
		
		return session.update(BOARD_MAPPER + ".updateBoard", board);
	}
	
	// 게시글 삭제하기
	public int deleteBoard(int bno) {
		logger.info("deleteBoard({}) 호출", bno);
		
		return session.delete(BOARD_MAPPER + ".deleteBoard", bno);
	}
}
