package edu.spring.project.service;

import java.util.List;

import edu.spring.project.domain.Favorite;

public interface FavoriteService {

	int insert(Favorite favorite);
	List<Favorite> select(int uno);
	int update(Favorite favorite);
	int delete(int itr_no);
	
}
