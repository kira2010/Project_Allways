package edu.spring.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.Board;
import edu.spring.project.domain.Favorite;
import edu.spring.project.domain.User;
import edu.spring.project.persistence.FavoriteDao;

@RestController
@RequestMapping(value = "favorite")
public class FavoriteController {

	@Autowired
	private FavoriteDao dao;
	
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ResponseEntity<Integer> insertBookMark(@RequestBody Favorite favorite, HttpSession session) {
		
		User loginUser =  (User) session.getAttribute("check");
		favorite.setUno(loginUser.getUno());
		int result = dao.registFavorite(favorite);

		ResponseEntity<Integer> entity = null;
		
		if(result != 0) {
			entity = new ResponseEntity<Integer>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result , HttpStatus.BAD_REQUEST);
		}
		return  entity;	
	}
	
	@RequestMapping(value = "list" , method = RequestMethod.POST)
	public ResponseEntity<List<Board>> favoriteList(@RequestBody User user) {
		
		int uno = user.getUno();
		
		List<Board> list = dao.readMyFavorite(uno, 0);
		
		ResponseEntity<List<Board>> entity = null;
		if (list != null) {
			entity = new ResponseEntity<List<Board>>(list, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<List<Board>>(list, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "delete" , method = RequestMethod.POST)
	public ResponseEntity<Integer> favoriteDelete(@RequestBody Favorite fav) {
		
		
		
		int itr_no = dao.findItr_no(fav);
		
		int result = dao.deleteFavorite(itr_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	
}
