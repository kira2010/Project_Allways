package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.Board;

public interface BoardDao {
	List<Board> readAll(int uno, int page);
	
	int countMyAll(int uno);
	
	List<Board> readAllBoard(int uno, int page);
	
	Board read(int bno);
	
	List<Board> searchByKeyword(int type, String keyword, int page);
	
	List<Board> readMyFavorite(int uno, int page);
	
	int countMyFavorite(int uno);
	
	List<Board> readMyAllwaisersPost(int uno, int page);
	
	int countMyAllwaisersPost(int uno);
	
	List<Board> readAllwaiserPost(Allwaiser allwaiser, int page);
	
	List<Board> readTimeLine(Allwaiser allwaiser, int page);
	
	int createBoard(Board board);
	
	int changePFPhoto(int uno);
	
	int updateBoard(Board board);
	
	int deleteBoard(int bno);
}
