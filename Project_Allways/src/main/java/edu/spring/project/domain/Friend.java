package edu.spring.project.domain;

public class Friend {
	private int f_no;
	private int uno;
	private String friend_id;
	private String friend_name;
	
	public Friend() {}

	public Friend(int f_no, int uno, String friend_id, String friend_name) {
		this.f_no = f_no;
		this.uno = uno;
		this.friend_id = friend_id;
		this.friend_name = friend_name;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getFriend_id() {
		return friend_id;
	}

	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}

	public String getFriend_name() {
		return friend_name;
	}

	public void setFriend_name(String friend_name) {
		this.friend_name = friend_name;
	}
	
	@Override
	public String toString() {
		String friend = String.format(
				"FRIEND:{f_no : %d, uno : %d, friend_id : %s, friend_name : %s}",
				f_no, uno, friend_id, friend_name);
		
		return friend;
	}
}
