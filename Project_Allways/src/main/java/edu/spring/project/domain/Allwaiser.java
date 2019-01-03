package edu.spring.project.domain;

public class Allwaiser {
	private int f_no;
	private int uno;
	private String allwaiser_id;
	private String allwaiser_name;
	
	public Allwaiser() {}

	public Allwaiser(int f_no, int uno, String allwaiser_id, String allwaiser_name) {
		this.f_no = f_no;
		this.uno = uno;
		this.allwaiser_id = allwaiser_id;
		this.allwaiser_name = allwaiser_name;
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

	public String getAllwaiser_id() {
		return allwaiser_id;
	}

	public void setAllwaiser_id(String allwaiser_id) {
		this.allwaiser_id = allwaiser_id;
	}

	public String getAllwaiser_name() {
		return allwaiser_name;
	}

	public void setAllwaiser_name(String allwaiser_name) {
		this.allwaiser_name = allwaiser_name;
	}
	
	@Override
	public String toString() {
		String friend = String.format(
				"FRIEND:{f_no : %d, uno : %d, allwaiser_id : %s, allwaiser_name : %s}",
				f_no, uno, allwaiser_id, allwaiser_name);
		
		return friend;
	}
}
