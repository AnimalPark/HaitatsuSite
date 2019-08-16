package model;

public class UserOrder {
	private int oNum;
	private int userId;
	private int oDate;
	private int deliChk;
	private int comment_chk;
	private String order_addr;
	
	public int getComment_chk() {
		return comment_chk;
	}
	public void setComment_chk(int comment_chk) {
		this.comment_chk = comment_chk;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}
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
		return "UserOrder [oNum=" + oNum + ", userId=" + userId + ", oDate=" + oDate + ", deliChk=" + deliChk
				+ ", comment_chk=" + comment_chk + ", order_addr=" + order_addr + "]";
	}

}
