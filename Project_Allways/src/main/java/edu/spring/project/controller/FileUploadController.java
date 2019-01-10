package edu.spring.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
   
  @RequestMapping("/1")
  public String testform1() {
	  return "fileUpload";
  }
  
  @RequestMapping(value = "/upload", method = RequestMethod.POST )
  public ResponseEntity<List<String>> upload(MultipartHttpServletRequest req) {
    
	List<MultipartFile> mf = req.getFiles("uploadfile");
	String s = req.getParameter("Str1"); 
	System.out.println(s);
	// 로그인 UNO
	int uno = 0;
	List<String> imageUrls = new ArrayList<String>();
	
	for(MultipartFile m : mf) {		
		String url = fileUploadService.restore(m, uno);
		imageUrls.add(url);
	}

	ResponseEntity<List<String>> entity=
			new ResponseEntity<List<String>>(imageUrls, HttpStatus.OK); 
	
    return entity;
  
  }
}
