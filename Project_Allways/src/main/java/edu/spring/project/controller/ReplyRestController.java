package edu.spring.project.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.Reply;
import edu.spring.project.domain.User;
import edu.spring.project.service.ReplyService;

@RestController
@RequestMapping(value = "replies")
public class ReplyRestController {
		
	
	
	@Autowired private ReplyService replyService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> createReply(
			@RequestBody Reply reply, HttpSession session) {
	
		User loginUser = (User)session.getAttribute("check");
		
		reply.setUno(loginUser.getUno());
		reply.setUserId(loginUser.getUserId());
		
		System.out.println(reply);
		
		int result = replyService.insert(reply);
		
		ResponseEntity<Integer> entity = null;
		if (result == 1) { // 댓글 생성 성공
			entity = new ResponseEntity<Integer>(result, 
					HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, 
					HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	@RequestMapping(value = "all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> readReplies(
			@PathVariable(name="bno") int bno) {

		List<Reply> list = replyService.selectByBno(bno);
		ResponseEntity<List<Reply>> entity =
				new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "{rno}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateReply(
			@PathVariable(name="rno") int rno,
			@RequestBody Reply reply) {

		reply.setRno(rno);
		
		int result = replyService.update(reply);
		ResponseEntity<Integer> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<Integer>(
					result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(
					result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(
			@PathVariable(name="rno") int rno) {
		
		int result = replyService.delete(rno);
		
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>(
					"success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(
					"fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	

	
}
