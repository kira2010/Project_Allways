package edu.spring.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "selectBoard", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> select() {
		
		List<Board> list = boardService.select(1);
		
		ResponseEntity<List<Board>> entity = 
						new ResponseEntity<List<Board>>(list , HttpStatus.OK);
		
		return  entity;
	}
	

	
}
