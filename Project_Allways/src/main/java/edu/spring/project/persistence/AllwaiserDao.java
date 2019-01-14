package edu.spring.project.persistence;

import java.util.List;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.User;

public interface AllwaiserDao {
	// 추가, 친구목록, 삭제, 검색
	
	// 친구목록 불러오기
	List<User> readMyAllwaisers(int uno);
	
	int countMyAllwaisers(int uno);
	
	// 친구 추가
	int followAllwaiser(Allwaiser allwaiser);
	
	// 친구 이름으로 검색
	List<User> searchByName(String userName, int uno);
	
	// 삭제
	int unfollowAllwaiser(int uno);
}
