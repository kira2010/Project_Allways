package edu.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class jinyongController {
	
	@RequestMapping(value="home")
	public void home() {}
	
	@RequestMapping(value="home2")
	public void home2() {}
	
	@RequestMapping(value="home3")
	public void home3() {}
	

}
