package model;

public class Category {
	private int cnum;
	private String cname;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Category [cnum=" + cnum + ", cname=" + cname + "]";
	}
}
