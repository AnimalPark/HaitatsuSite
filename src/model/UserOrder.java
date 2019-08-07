package model;

public class UserOrder {
	private int oNum;
	private int userId;
	private int oDate;
	private int deliChk;
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getoDate() {
		return oDate;
	}
	public void setoDate(int oDate) {
		this.oDate = oDate;
	}
	public int getDeliChk() {
		return deliChk;
	}
	public void setDeliChk(int deliChk) {
		this.deliChk = deliChk;
	}
	@Override
	public String toString() {
		return "UserOrder [oNum=" + oNum + ", userId=" + userId + ", oDate=" + oDate + ", deliChk=" + deliChk + "]";
	}
	
}
