package edu.spring.project.domain;

import java.util.Date;

public class User {
	private int uno;
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail;
	private Date birthDay;
	private String graduation;
	private String bg_photo;
	private String pf_photo;
	private int emotion;
	
	public User() {}

	public User(
			int uno,
			String userId,
			String userPwd,
			String userName,
			String userEmail,
			Date birthDay,
			String graduation,
			String bg_photo,
			String pf_photo,
			int emotion) {
		this.uno = uno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userEmail = userEmail;
		this.birthDay = birthDay;
		this.graduation = graduation;
		this.bg_photo = bg_photo;
		this.pf_photo = pf_photo;
		this.emotion = emotion;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public String getBg_photo() {
		return bg_photo;
	}

	public void setBg_photo(String bg_photo) {
		this.bg_photo = bg_photo;
	}

	public String getPf_photo() {
		return pf_photo;
	}

	public void setPf_photo(String pf_photo) {
		this.pf_photo = pf_photo;
	}

	public int getEmotion() {
		return emotion;
	}

	public void setEmotion(int emotion) {
		this.emotion = emotion;
	}

	@Override
	public String toString() {
		String user = String.format(
				"USER:{uno : %d, userId : %s, "
				+ "userName : %s, userEmail : %s, "
				+ "birthDay : %s, graduation : %s, bg_photo : %s, "
				+ "pf_photo : %s, emotion : %d}",
				uno, userId, userName, userEmail, birthDay.toString(),
				graduation, bg_photo, pf_photo, emotion);
		
		return user;
	}
}
