package edu.spring.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.Board;
import edu.spring.project.domain.User;
import edu.spring.project.service.BoardService;

@RestController
@RequestMapping(value = "board")
public class BoardController {

	@Autowired public BoardService boardService;
	
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insert(@RequestBody Board board, HttpSession session) {
		
		User loginUser =  (User) session.getAttribute("check");
		board.setUno(loginUser.getUno());
		board.setUserId(loginUser.getUserId());
		
		System.out.println("session input: " + board);
		
		boardService.insert(board);
		
	}
		
	@RequestMapping(value = "selectBoard/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> select(@PathVariable(name="page") int page, HttpSession session) {
		
		User user = (User)session.getAttribute("check");
		
		List<Board> result = boardService.select(user.getUno(), page);
				
		ResponseEntity<List<Board>> entity = null;
		if(result != null) {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.BAD_REQUEST);
		}
		return  entity;
	}
	
	@RequestMapping(value = "favorite/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> selectFavorite(@PathVariable(name="page") int page, HttpSession session) {
		
		User user = (User)session.getAttribute("check");
		
		List<Board> result = boardService.selectFavorite(user.getUno(), page);
				
		ResponseEntity<List<Board>> entity = null;
		if(result != null) {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.BAD_REQUEST);
		}
		return  entity;
	}
	
	@RequestMapping(value = "timeLine/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> selectTimeLine(@PathVariable(name="page") int page, HttpSession session) {
		
		User user = (User)session.getAttribute("check");
		
		List<Board> result = boardService.selectTimeLine(user.getUno(), page);
				
		ResponseEntity<List<Board>> entity = null;
		if(result != null) {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.BAD_REQUEST);
		}
		return  entity;
	}
	
	@RequestMapping(value = "posting/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> selectPosting(@PathVariable(name="page") int page, HttpSession session) {
		
		User user = (User)session.getAttribute("check");
		
		List<Board> result = boardService.selectPosting(user.getUno(), page);
				
		ResponseEntity<List<Board>> entity = null;
		if(result != null) {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.BAD_REQUEST);
		}
		return  entity;
	}
	
	
	@RequestMapping(value = "selectBoard/detail/{bno}", method = RequestMethod.GET)
	public ResponseEntity<Board> selectOne(@PathVariable(name="bno") int bno) {
		
		Board result = boardService.selectOne(bno);
				
		ResponseEntity<Board> entity = null;
		if(result != null) {
			entity = new ResponseEntity<Board>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Board>(result , HttpStatus.BAD_REQUEST);
		}
		return  entity;
	}
	
	@RequestMapping(value = "{bno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteBoard(
			@PathVariable(name="bno") int bno) {
		
		int result = boardService.delete(bno);
		
		ResponseEntity<String> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);

		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);			
		}
		
		return  entity;
	}

	
}
