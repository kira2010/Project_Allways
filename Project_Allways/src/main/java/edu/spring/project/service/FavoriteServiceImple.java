package edu.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.spring.project.domain.Favorite;
import edu.spring.project.persistence.FavoriteDao;

public class FavoriteServiceImple implements FavoriteService {
	
	@Autowired
	private FavoriteDao favoriteDao;
	
	public int insert(Favorite favorite) {
		// TODO Auto-generated method stub
		return favoriteDao.registFavorite(favorite);
	}

	public List<Favorite> select(int uno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int update(Favorite favorite) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int itr_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
