package edu.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.project.domain.Board;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insert(@RequestBody Board board) {
		
		
	}
	
	@RequestMapping(value = "boardTest", method = RequestMethod.GET)
	public String test() {
		
		
		return "boardTest";
	}
}
