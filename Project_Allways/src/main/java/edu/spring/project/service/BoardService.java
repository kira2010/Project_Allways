package edu.spring.project.service;

import java.util.List;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.Board;


public interface BoardService {
	
	/**
	 * @param service_bounds
	 * 1: ,2: ,3: ,4:
	 * @return
	 */
	List<Board> select(int uno, int page);
	List<Board> selectTimeLine(Allwaiser allwaiser, int page);
	List<Board> selectPosting(Allwaiser allwaiser, int page);
	List<Board> selectFavorite(int uno, int page);
	List<Board> selectKeyword(String searchKeyword, int serchBounds, int page);
	List<Board> selectMyPosting(int uno, int page);
	Board selectOne(int bno);
	int insert(Board board);
	int update(Board board);
	int delete(int bno);
	
}
