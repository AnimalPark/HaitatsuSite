package model;

public class Users
{
	private String userId;
	private String uPwd;
	private String uName;
	private String uAddr;
	private String uPhonenum;
	
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
	
	@Override
	public String toString() {
		return "Users [userId=" + userId + ", uPwd=" + uPwd + ", uName=" + uName + ", uAddr=" + uAddr + ", uPhonenum="
				+ uPhonenum + "]";
	}
}
