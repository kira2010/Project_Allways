package edu.spring.project.domain;

public class Favorite {
	private int itr_no;
	private int bno;
	private int uno;
	
	public Favorite() {}

	public Favorite(int itr_no, int bno, int uno) {
		this.itr_no = itr_no;
		this.bno = bno;
		this.uno = uno;
	}

	public int getItr_no() {
		return itr_no;
	}

	public void setItr_no(int itr_no) {
		this.itr_no = itr_no;
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
	
	@Override
	public String toString() {
		String favorite = String.format(
				"FAVORITE:{itr_no : %d, bno : %d, uno : %d}", itr_no, bno, uno);
		
		return favorite;
	}
}
