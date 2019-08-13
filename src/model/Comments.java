package model;

public class Comments {
	private int commnum;
	private int rnum;
	private String userid;
	private String commcontents;
	private int star;
	private String commaddr;
	public String getCommaddr() {
		return commaddr;
	}
	public void setCommaddr(String commaddr) {
		this.commaddr = commaddr;
	}
	public int getCommnum() {
		return commnum;
	}
	public void setCommnum(int commnum) {
		this.commnum = commnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCommcontents() {
		return commcontents;
	}
	public void setCommcontents(String commcontents) {
		this.commcontents = commcontents;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "Comments [commnum=" + commnum + ", rnum=" + rnum + ", userid=" + userid + ", commcontents="
				+ commcontents + ", star=" + star + ", commaddr=" + commaddr + "]";
	}

	
}
