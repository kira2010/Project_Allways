package edu.spring.project.domain;

import java.util.Date;

public class Board {
	private int bno;
	private int uno;
	private String userId;
	private String content;
	private Date regDate;
	private int privacy_bounds;
	private String photo;
	private String hashTag;
	private String pf_photo;
	
	public Board() {}
	
	public Board(
			int bno,
			int uno, 
			String userId, 
			String content, 
			Date regDate, 
			int privacy_bounds, 
			String photo,
			String hashTag,
			String pf_photo) {
		this.bno = bno;
		this.uno = uno;
		this.userId = userId;
		this.content = content;
		this.regDate = regDate;
		this.privacy_bounds = privacy_bounds;
		this.photo = photo;
		this.hashTag = hashTag;
		this.pf_photo = pf_photo;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getPrivacy_bounds() {
		return privacy_bounds;
	}

	public void setPrivacy_bounds(int privacy_bounds) {
		this.privacy_bounds = privacy_bounds;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	
	public String getPf_photo() {
		return pf_photo;
	}

	public void setPf_photo(String pf_photo) {
		this.pf_photo = pf_photo;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", uno=" + uno + ", userId=" + userId + ", content=" + content + ", regDate="
				+ regDate + ", privacy_bounds=" + privacy_bounds + ", photo=" + photo + ", hashTag=" + hashTag
				+ ", pf_photo=" + pf_photo + "]";
	}
}
