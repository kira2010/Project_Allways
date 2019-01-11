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

import edu.spring.project.domain.User;
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
	
	@Test
	public void test() {
		userDaoTest();
	}
	
	private void userDaoTest() {
		logger.info("userDaoTest 실행");
		
		User user = new User();
		
		user.setUserName("김민재");
		user.setGraduation("수원대학교");
		
		List<User> searchList = userDao.findUserByNameAndGraduation(user);
		
		if(searchList != null && searchList.size() > 0) {
			for(User u : searchList) {
				logger.info(u.toString());
			}
		}
	}
}
