package edu.spring.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Board> readAll(int uno, int page) {
		logger.info("readAll(uno : {}) 호출");
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		
		params.put("uno", uno);
		params.put("start", page * 10);		
		
		return session.selectList(BOARD_MAPPER + ".selectMyAll", params);
	}
	
	// 내가 작성한 모든 게시글 수 count
	public int countMyAll(int uno) {
		logger.info("countMyAll() 호출");
		
		return session.selectOne(BOARD_MAPPER + ".countMyAll", uno);
	}
	
	// 내가 쓴 게시물 + 친구가 쓴 게시물중 전체/친구 공개 게시물 + 그 외 전체 공개 게시물 가져오기
	public List<Board> readAllBoard(int uno, int page) {
		logger.info("readAllBoard(uno : {}) 호출");
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		
		params.put("uno", uno);
		params.put("start", page * 10);
		
		return session.selectList(BOARD_MAPPER + ".selectAllBoard", params);
	}

	// 게시글 자세히 보기
	public Board read(int bno) {
		logger.info("read(bno : {}) 호출", bno);
		
		return session.selectOne(BOARD_MAPPER + ".selectByBno", bno);
	}
	
	// 내용/작성자ID/hashTag 검색
	public List<Board> searchByKeyword(int type, String keyword, int page) {
		logger.info("searchByKeyword(type : {}, keyword : {}) 호출", type, keyword);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("start", page * 10);
		
		return session.selectList(BOARD_MAPPER + ".searchByKeyword", params);
	}
	
	// 내가 저정한 즐겨찾기 목록 중 공개범위 0/1 인 모든 게시글 가져오기
	public List<Board> readMyFavorite(int uno, int page) {
		logger.info("readMyFavorite(uno : {}) 호출", uno);
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		
		params.put("uno", uno);
		params.put("start", page * 10);
		
		return session.selectList(BOARD_MAPPER + ".selectMyFavorite", params);
	}
	
	// 내가 저정한 즐겨찾기 목록 중 공개범위 0/1 인 모든 게시글 count
	public int countMyFavorite(int uno) {
		logger.info("countMyFavorite(uno : {}) 호출", uno);
		
		return session.selectOne(BOARD_MAPPER + ".countMyFavorite", uno);
	}
	
	// 내가 등록한 Allwaiser가 작성한 게시글 목록 중 공개범위 0/1인 모든 게시글 가져오기
	public List<Board> readMyAllwaisersPost(int uno, int page) {
		logger.info("readMyAllwaisersPost(uno : {}) 호출", uno);
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		
		params.put("uno", uno);
		params.put("start", page * 10);
		
		return session.selectList(BOARD_MAPPER + ".selectMyAllwaisersPost", params);
	}
	
	// 내가 등록한 Allwaiser가 작성한 게시글 목록 중 공개범위 0/1인 모든 게시글의 갯수 세기
	public int countMyAllwaisersPost(int uno) {
		logger.info("countMyAllwaisersPost(uno : {}) 호출", uno);
		
		return session.selectOne(BOARD_MAPPER + ".countMyAllwaisersPost", uno);
	}
	
	// 내 타임라인 가져오기
	public List<Board> readMyTimeLine(int uno, int page) {
		logger.info("readMyTimeLine() 호출");
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("uno", uno);
		params.put("start", page * 10);
		
		return session.selectList(BOARD_MAPPER + ".selectMyAndAllwaisersPost", params);
	}
	
	// 게시글 작성하기
	public int createBoard(Board board) {
		logger.info("createBoard({}) 호출", board);
		
		return session.insert(BOARD_MAPPER + ".createBoard", board);
	}
	
	// 사용자가 프로필 사진을 변경할 때 board의 프로필 갱신
	public int changePFPhoto(int uno) {
		logger.info("changePFPhoto() 호출");
		
		return session.update(BOARD_MAPPER + ".changeProfile", uno);
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
