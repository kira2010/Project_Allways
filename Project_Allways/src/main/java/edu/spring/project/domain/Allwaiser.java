package edu.spring.project.domain;

public class Allwaiser {
	private int f_no;
	private int uno;
	private int allwaiser_uno;
	
	public Allwaiser() {}

	public Allwaiser(int f_no, int uno, int allwaiser_uno) {
		this.f_no = f_no;
		this.uno = uno;
		this.allwaiser_uno = allwaiser_uno;
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

	public int getAllwaiser_uno() {
		return allwaiser_uno;
	}

	public void setAllwaiser_uno(int allwaiser_uno) {
		this.allwaiser_uno = allwaiser_uno;
	}
	
	@Override
	public String toString() {
		String allwaiser = String.format(
				"Allwaiser:{f_no : %d, uno : %d, allwaiser_uno : %d}",
				f_no, uno, allwaiser_uno);
		
		return allwaiser;
	}
}
