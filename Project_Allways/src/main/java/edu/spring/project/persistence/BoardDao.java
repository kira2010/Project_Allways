package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.Board;

public interface BoardDao {
	List<Board> readAll(int uno);
	
	int countMyAll(int uno);
	
	Board read(int bno);
	
	List<Board> searchByKeyword(int type, String keyword);
	
	List<Board> readMyFavorite(int uno);
	
	int countMyFavorite(int uno);
	
	List<Board> readMyAllwaisersPost(int uno);
	
	int countMyAllwaisersPost(int uno);
	
	int createBoard(Board board);
	
	int updateBoard(Board board);
	
	int deleteBoard(int bno);
}
