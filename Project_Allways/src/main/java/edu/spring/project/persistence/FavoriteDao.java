package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.Board;
import edu.spring.project.domain.Favorite;

public interface FavoriteDao {
	List<Board> readMyFavorite(int uno, int page);
	
	int countMyFavorite(int uno);
	
	int findItr_no(Favorite fav);
	
	int registFavorite(Favorite fav);
	
	int deleteFavorite(int itr_no);
}
