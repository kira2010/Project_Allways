package edu.spring.project.controller;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import edu.spring.project.domain.Board;
import edu.spring.project.domain.User;
import edu.spring.project.service.BoardService;
import edu.spring.project.service.FileUploadService;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired public BoardService boardService;
	@Autowired public FileUploadService fileUploadService;	
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ResponseEntity<Integer> insert(MultipartHttpServletRequest req, HttpSession session) {
		
		Board board = new Board();
		
		User loginUser =  (User) session.getAttribute("check");
		board.setUno(loginUser.getUno());
		board.setUserId(loginUser.getUserId());
		
		String content = req.getParameter("content");
		String privacy_bounds = req.getParameter("privacy_bounds");
		
		board.setContent(content);
		board.setPrivacy_bounds(Integer.parseInt(privacy_bounds));
		
		// 파일 업
		List<MultipartFile> mf = req.getFiles("uploadfile");
		List<String> imageUrls = new ArrayList<String>();
		
		for(MultipartFile m : mf) {		
			String url = fileUploadService.restore(m, loginUser.getUno());
			imageUrls.add(url);
		}
		StringBuffer buffer = new StringBuffer();
		for(String url : imageUrls) {
			buffer.append(url).append(",");
		}
		
		String urls = buffer.toString();
		if(urls.length()>0){
			urls = urls.substring(0, urls.length()-1);
			System.out.println(urls);
		}
		board.setPhoto(urls);
		
		int result = boardService.insert(board);
		ResponseEntity<Integer> entity = null;

		if(result == 1 ) {
			entity = new ResponseEntity<Integer>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result , HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	@RequestMapping(value = "searchPage", method = RequestMethod.GET)
	public String searchPage(String searchKeyword, int searchBounds, Model model) {
		
		
		List<Board> result = boardService.selectKeyword(searchKeyword, searchBounds, 0);
		
		Gson gson = new Gson();
		
		String jsonResult = gson.toJson(result);
		
		model.addAttribute("boardList", jsonResult);		
		
		return  "searchPage";
		
	}
	
	@RequestMapping(value = "searchKeyword", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> searchKeyword(String searchKeyword, int searchBounds, int page) {
		
		
		List<Board> result = boardService.selectKeyword(searchKeyword, searchBounds, page);
				
		ResponseEntity<List<Board>> entity = null;
		if(result != null) {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Board>>(result , HttpStatus.BAD_REQUEST);
		}
		
		return  entity;
		
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
		User pageUser = (User)session.getAttribute("userInfo");
		
		// 나 일때 하고 친구 일때가 다름 수정!!!
		List<Board> result = null;
	
		if(user.getUno() == pageUser.getUno()) {
			result = boardService.selectMyPosting(user.getUno(), page);
		}else {
			result = boardService.selectPosting(user.getUno(), page);
		}
			
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
