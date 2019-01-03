package edu.spring.project.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import edu.spring.project.domain.User;

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
		logger.info("checkUser({}) 호출", userId);
		
		session.selectOne(USER_MAPPER + ".existUserId", userId);
		
		return false;
	}

	// 신규 회원가입
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원 정보 수정
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원 탈퇴
	public int deleteUser(int uno) {
		// TODO Auto-generated method stub
		return 0;
	}
}  // end class UserDaoImple
