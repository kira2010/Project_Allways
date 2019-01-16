package edu.spring.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.Board;
import edu.spring.project.persistence.BoardDao;
import edu.spring.project.persistence.UserDao;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired private BoardDao boardDao;
	@Autowired private UserDao userDao;
	
	public List<Board> select(int service_bounds, int page) {
		// test
		List<Board> list1 = boardDao.readAll(2, page);
		
		return list1;
	}

	public Board selectOne(int bno) {
		// TODO Auto-generated method stub
		return null;
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

}
