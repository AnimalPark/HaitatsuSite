package model;

public class Users {
	private String userid;
	private String upwd;
	private String uname;
	private String uaddr;
	private String uphonenum;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUaddr() {
		return uaddr;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	public String getUphonenum() {
		return uphonenum;
	}
	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}
	@Override
	public String toString() {
		return "Users [userid=" + userid + ", upwd=" + upwd + ", uname=" + uname + ", uaddr=" + uaddr + ", uphonenum="
				+ uphonenum + "]";
	}
}
