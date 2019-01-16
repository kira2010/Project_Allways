package edu.spring.project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.project.domain.Board;
import edu.spring.project.domain.User;
import edu.spring.project.persistence.BoardDao;
import edu.spring.project.persistence.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {
			"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
			"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	}
)
@WebAppConfiguration
public class DaoTest {
	
	private final Logger logger = LoggerFactory.getLogger(DaoTest.class);
	
	@Autowired private UserDao userDao;
	@Autowired private BoardDao boardDao;
	
	@Test
	public void test() {
		userDaoTest();
	}
	
	private void userDaoTest() {
		logger.info("userDaoTest 실행");
		
		User user = new User();
		
		user.setUserName("김민재");
		user.setUserEmail("kira20105@gmail.com");
		
		
//		StringBuffer buffer = new StringBuffer();
//		
//		buffer.append("kira20105").append("@").append("gmail").append(".").append("com");
		
		//user.setUserEmail(buffer.toString());
		
		String id = userDao.findUserId(user);
		
		if (id != null && !id.isEmpty()) {
			logger.info("ID 찾기 결과 : {}", id);
		}
	}
	/*
	private void test1() {
		logger.info("test1() 실행");
		
		List<Board> readAllBoardList = boardDao.readAllBoard(1, 0);
		
		if(readAllBoardList != null && readAllBoardList.size() > 0) {
			for(Board b : readAllBoardList) {
				
			}
		}
	}*/
}
