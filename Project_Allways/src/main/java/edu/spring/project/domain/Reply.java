package edu.spring.project.domain;

import java.util.Date;

public class Reply {
	private int rno;
	private int bno;
	private int uno;
	private String userId;
	private String reply_content;
	private Date wr_time;
	
	public Reply() {}
	
	public Reply(
			int rno, 
			int bno, 
			int uno, 
			String userId, 
			String reply_content, 
			Date wr_time) {
		this.rno = rno;
		this.bno = bno;
		this.uno = uno;
		this.userId = userId;
		this.reply_content = reply_content;
		this.wr_time = wr_time;
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

	public Date getWr_time() {
		return wr_time;
	}

	public void setWr_time(Date wr_time) {
		this.wr_time = wr_time;
	}
	
	@Override
	public String toString() {
		String reply = String.format(
				"REPLY:{rno : %d, bno : %d, uno : %d, "
				+ "userId : %s, reply_content : %s, wr_time : %s}",
				rno, bno, uno, userId, reply_content, wr_time);
		
		return reply;
	}
}
