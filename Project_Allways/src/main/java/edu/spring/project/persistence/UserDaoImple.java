package edu.spring.project.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.project.domain.User;

@Repository
public class UserDaoImple implements UserDao {

	private static final String USER_MAPPER =
		"edu.spring.project.mappers.UserMapper";
	
	private final Logger logger = LoggerFactory.getLogger(UserDaoImple.class);
	
	@Autowired private SqlSession session;
	
	// 로그인 여부 확인
	public User loginCheck(User user) {
		logger.info("loginCheck({}) 호출", user);
		
		return session.selectOne(USER_MAPPER + ".loginCheck", user);
	}

	// 회원가입시 ID 중복여부 확인
	public boolean checkUser(String userId) {
		boolean result = false;
		
		logger.info("checkUser({}) 호출", userId);
		
		String newId = session.selectOne(USER_MAPPER + ".existUserId", userId);
		
		if (newId != null && !newId.isEmpty()) {
			result = true;
		}
		
		return result;
	}
	
	// 회원번호 찾기
	public int findUno(User user) {
		int uno = 0;
		
		logger.info("findUno({}) 호출", user);
		
		int result = session.selectOne(USER_MAPPER + ".findUno", user);
		
		if (result != 0) {
			uno = result;
		}
		
		return uno;
	}
	
	// 이름으로 회원 찾기
	public List<User> findUserByName(String userName) {
		logger.info("findUserByName({}) 호출", userName);
		
		return session.selectList(USER_MAPPER + ".findUserByName", userName);
	}
	
	// 출신학교로 회원 찾기
	public List<User> findUserByGraduation(String graduation) {
		logger.info("findUserByGraduation({}) 호출", graduation);
		
		return session.selectList(USER_MAPPER + ".findUserByGraduation", graduation);
	}

	// 신규 회원가입
	public int createUser(User user) {	
		logger.info("insertUser({}) 호출", user);
		
		return session.insert(USER_MAPPER + ".registUser", user);
	}

	// 회원 정보 수정
	public int updateUser(User user) {
		logger.info("updateUser({}) 호출", user);
		return session.update(USER_MAPPER + ".updateUser", user);
	}

	// 회원 탈퇴
	public int deleteUser(int uno) {
		
		return session.delete(USER_MAPPER + ".quitUser", uno);
	}
}  // end class UserDaoImple
