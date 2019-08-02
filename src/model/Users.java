package model;

public class Users
{
	private String userId;
	private String uPwd;
	private String uName;
	private String uAddr;
	private String uPhonenum;
	private int authority;
<<<<<<< HEAD
	
=======
>>>>>>> 3c1991270be441e7616a5d7823b6204bbb59a1ff
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuAddr() {
		return uAddr;
	}
	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}
	public String getuPhonenum() {
		return uPhonenum;
	}
	public void setuPhonenum(String uPhonenum) {
		this.uPhonenum = uPhonenum;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "Users [userId=" + userId + ", uPwd=" + uPwd + ", uName=" + uName + ", uAddr=" + uAddr + ", uPhonenum="
				+ uPhonenum + ", authority=" + authority + "]";
	}
	
	
}
