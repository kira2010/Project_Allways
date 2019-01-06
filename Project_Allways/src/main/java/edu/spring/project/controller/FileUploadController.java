package edu.spring.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.spring.project.domain.User;
import edu.spring.project.service.FileUploadService;

@Controller
@RequestMapping(value = "image")
public class FileUploadController {
  @Autowired
  FileUploadService fileUploadService;
   
  
  @RequestMapping("/2")
  public String form2() {
	  return "fileUp";
  }
  
  @RequestMapping("/1")
  public String form1() {
	  return "fileUpload";
  }
  
  @RequestMapping(value = "/upload", method = RequestMethod.POST )
  public String upload(MultipartHttpServletRequest req) {
    
	List<MultipartFile> mf = req.getFiles("uploadfile");
	System.out.println("aaaaaaaa" + mf.size());
	
	int k = 0;
	for(MultipartFile m : mf) { 
		//System.out.println("aaaaaaaa" + m.get);
		User user = new User();
		user.setUno(k);
		k++;
		String url = fileUploadService.restore(m, user);
		//model.addAttribute("url", url);
	}
	

	
    return "aa";
  
  }
}
