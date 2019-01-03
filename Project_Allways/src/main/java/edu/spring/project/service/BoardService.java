package edu.spring.project.service;

import java.util.List;

import edu.spring.project.domain.Board;

public interface BoardService {
	
	/**
	 * @param service_bounds
	 * 1: ,2: ,3: ,4:
	 * @return
	 */
	List<Board> select(int service_bounds);
	Board selectOne();
	int insert(Board board);
	int update(Board board);
	int delete(int bno);
	
}
