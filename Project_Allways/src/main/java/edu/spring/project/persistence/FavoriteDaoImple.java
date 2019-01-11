package edu.spring.project.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.project.domain.Board;
import edu.spring.project.domain.Favorite;

@Repository
public class FavoriteDaoImple implements FavoriteDao {
	
	private static final String FAVORITE_MAPPER =
			"edu.spring.project.mappers.FavoriteMapper";
	
	private final Logger logger = LoggerFactory.getLogger(FavoriteDaoImple.class);
	
	@Autowired private SqlSession session;
	
	// 내가 추가한 즐겨찾기 리스트 목록 뽑아오기
	public List<Board> readMyFavorite(int uno) {
		logger.info("readMyFavorite(uno : {}) 호출", uno);
		
		return session.selectList(FAVORITE_MAPPER + ".selectMyFavorite", uno);
	}
	
	// 내개 추가한 즐겨찾기 리스트 저장개수 구하기
	public int countMyFavorite(int uno) {
		logger.info("countMyFavorite(uno : {}) 호출", uno);
		
		return session.selectOne(FAVORITE_MAPPER + ".countMyFavorite", uno);
	}
	
	// 즐겨찾기 추가
	public int registFavorite(Favorite fav) {
		logger.info("registFavorite({}) 호출", fav);
		
		return session.insert(FAVORITE_MAPPER + ".registFavorite", fav);
	}
	
	// 즐겨찾기 삭제
	public int deleteFavorite(int itr_no) {
		logger.info("deleteFavorite(itr_no : {}) 호출", itr_no);
		
		return session.delete(FAVORITE_MAPPER + ".deleteFavorite", itr_no);
	}

}
