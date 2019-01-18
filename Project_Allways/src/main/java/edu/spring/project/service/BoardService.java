package edu.spring.project.service;

import java.util.List;

import edu.spring.project.domain.Board;


public interface BoardService {
	
	/**
	 * @param service_bounds
	 * 1: ,2: ,3: ,4:
	 * @return
	 */
	List<Board> select(int uno, int page);
	List<Board> selectTimeLine(int uno, int page);
	List<Board> selectPosting(int uno, int page);
	List<Board> selectFavorite(int uno, int page);
	Board selectOne(int bno);
	int insert(Board board);
	int update(Board board);
	int delete(int bno);
	
}
