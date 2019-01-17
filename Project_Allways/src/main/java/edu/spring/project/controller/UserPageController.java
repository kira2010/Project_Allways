package edu.spring.project.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.User;
import edu.spring.project.persistence.AllwaiserDao;
import edu.spring.project.service.AllwaiserService;
import edu.spring.project.service.FileUploadService;
import edu.spring.project.service.UserPageService;


@Controller
public class UserPageController {
	
	private static Logger logger =
			LoggerFactory.getLogger(UserPageController.class);

	@Autowired FileUploadService fileUploadService;
	
	@Autowired
	private UserPageService userPageService;
	
	
	@RequestMapping(value = "/userPage", method = RequestMethod.GET)
	public String userPage(int uno, HttpSession session) {
		
		User user = userPageService.check(uno);
		
		session.setAttribute("userInfo", user);
		return "allwaiserPage";
	}
	
	@RequestMapping(value = "/userPage", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateEmo(@RequestBody User user) {
		
		int result = userPageService.updateEmo(user);
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/userPage", method = RequestMethod.POST)
	public ResponseEntity<Integer> existAllwaiser(
			@RequestBody Allwaiser allwaiser) {
		
		System.out.println(allwaiser);
		
		int result = userPageService.existAllwaiser(allwaiser);
		System.out.println(result);
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} 
		
		
		return entity;
	}
	
	  @RequestMapping(value = "userPage/bimg", method = RequestMethod.POST )
	  public ResponseEntity<Integer> bimgUpload(MultipartHttpServletRequest req) {
	    
		List<MultipartFile> mf = req.getFiles("uploadfile");
		String uno = req.getParameter("uno");
	
		List<String> imageUrls = new ArrayList<String>();
		
		for(MultipartFile m : mf) {		
			String url = fileUploadService.restore(m, Integer.parseInt(uno));
			imageUrls.add(url);
		}

		User user = new User();
		user.setUno(Integer.parseInt(uno));
		user.setBg_photo(imageUrls.get(0));
		
		int result = userPageService.updateBGPhoto(user);
		
		ResponseEntity<Integer> entity=
				new ResponseEntity<Integer>(result, HttpStatus.OK); 
		
	    return entity;
	  
	  }
	    
	  @RequestMapping(value = "userPage/pimg", method = RequestMethod.POST )
	  public ResponseEntity<Integer> pimgUpload(MultipartHttpServletRequest req) {
	    
		List<MultipartFile> mf = req.getFiles("uploadfile");
		String uno = req.getParameter("uno");
	
		List<String> imageUrls = new ArrayList<String>();
		
		for(MultipartFile m : mf) {		
			String url = fileUploadService.restore(m, Integer.parseInt(uno));
			imageUrls.add(url);
		}

		User user = new User();
		user.setUno(Integer.parseInt(uno));
		user.setPf_photo(imageUrls.get(0));
		
		int result = userPageService.updatePFPhoto(user);
		
		ResponseEntity<Integer> entity=
				new ResponseEntity<Integer>(result, HttpStatus.OK); 
		
	    return entity;
	  
	  }
	  
	
}










