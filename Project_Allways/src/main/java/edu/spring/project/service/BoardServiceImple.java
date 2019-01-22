package edu.spring.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.Board;
import edu.spring.project.persistence.BoardDao;
import edu.spring.project.persistence.UserDao;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired private BoardDao boardDao;
	@Autowired private UserDao userDao;
	
	public List<Board> select(int uno, int page) {
		
		List<Board> result = boardDao.readAllBoard(uno, page);
		
		return result;
	}

	public List<Board> selectTimeLine(Allwaiser allwaiser, int page) {
		
		return boardDao.readTimeLine(allwaiser, page);
	}

	public List<Board> selectPosting(Allwaiser allwaiser, int page) {
		
		return boardDao.readAllwaiserPost(allwaiser, page);
	}

	public List<Board> selectFavorite(int uno, int page) {

		return boardDao.readMyFavorite(uno, page);
	}
	
	public Board selectOne(int bno) {
		return boardDao.read(bno);
	}

	public int insert(Board board) {
		
		return boardDao.createBoard(board);
	}

	public int update(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int bno) {

		return boardDao.deleteBoard(bno);
	}

	public List<Board> selectKeyword(String searchKeyword, int serchBounds, int page) {
		return boardDao.searchByKeyword(serchBounds, searchKeyword, page);
	}

	public List<Board> selectMyPosting(int uno, int page) {
		
		return boardDao.readAll(uno, page);
	}



}
