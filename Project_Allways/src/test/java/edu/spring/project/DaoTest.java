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

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.Board;
import edu.spring.project.domain.User;
import edu.spring.project.persistence.AllwaiserDao;
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
	@Autowired private AllwaiserDao allwaiserDao;
	
	@Test
	public void test() {
		//userDaoTest();
		test1();
		//allwaiserDaoTest();
	}
	/*
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
	}*/
	
	private void test1() {
		logger.info("test1() 실행");
		
		//List<Board> myTimeLineList = boardDao.readMyTimeLine(1, 0);
		
		List<Board> searchList = boardDao.searchByKeyword(1, "공개", 0);
		
		if(searchList != null && searchList.size() > 0) {
			for(Board b : searchList) {
				logger.info(b.toString());
			}
		}
	}
	
//	private void allwaiserDaoTest() {
//		logger.info("allwaiserDaoTest() 호출");
//		
//		Allwaiser allwaiser = new Allwaiser();
//		
//		allwaiser.setUno(9);
//		allwaiser.setAllwaiser_uno(10);
//		
//		int result = allwaiserDao.existAllwaiser(allwaiser);
//		
//		if(result == 1) {
//			logger.info("결과 : 구독중!");
//		} else {
//			logger.info("결과 : 구독중이 아님!");
//		}
//	}
}
