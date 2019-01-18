package edu.spring.project.domain;

import java.util.Date;

public class Reply {
	private int rno;
	private int bno;
	private int uno;
	private String userId;
	private String reply_content;
	private Date regDate;
	private String pf_photo;
	
	public Reply() {}
	
	public Reply(
			int rno, 
			int bno, 
			int uno, 
			String userId, 
			String reply_content, 
			Date regDate,
			String pf_photo) {
		this.rno = rno;
		this.bno = bno;
		this.uno = uno;
		this.userId = userId;
		this.reply_content = reply_content;
		this.regDate = regDate;
		this.pf_photo = pf_photo;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getPf_photo() {
		return pf_photo;
	}

	public void setPf_photo(String pf_photo) {
		this.pf_photo = pf_photo;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", bno=" + bno + ", uno=" + uno + ", userId=" + userId + ", reply_content="
				+ reply_content + ", regDate=" + regDate + ", pf_photo=" + pf_photo + "]";
	}
}
