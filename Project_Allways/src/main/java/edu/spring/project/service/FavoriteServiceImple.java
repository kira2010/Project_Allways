package edu.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.Favorite;
import edu.spring.project.persistence.FavoriteDao;

@Service
public class FavoriteServiceImple implements FavoriteService {
	
	@Autowired
	private FavoriteDao favoriteDao;
	
	public int insert(Favorite favorite) {
		int result = 0;
		int exist = favoriteDao.existFavorite(favorite);
		System.out.println(exist+"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		if(exist == 0) {
			// 없을 때
			favoriteDao.registFavorite(favorite);
			result = 1;
		}else {
			// 있을 때
			result = 0;
		}
		return result;
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
