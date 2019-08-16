package model;

public class UserOrderList {
	private int oNum;
	private String userId;
	private String oDate;
	private int deliChk;
	private int comment_chk;
	private String orderRName;
	private int orderRNum;
	private String orderListName;
	private int totalPrice;
	public int getComment_chk() {
		return comment_chk;
	}
	public void setComment_chk(int comment_chk) {
		this.comment_chk = comment_chk;
	}
	public int getOrderRNum() {
		return orderRNum;
	}
	public void setOrderRNum(int orderRNum) {
		this.orderRNum = orderRNum;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public int getDeliChk() {
		return deliChk;
	}
	public void setDeliChk(int deliChk) {
		this.deliChk = deliChk;
	}
	public String getOrderRName() {
		return orderRName;
	}
	public void setOrderRName(String orderRName) {
		this.orderRName = orderRName;
	}
	public String getOrderListName() {
		return orderListName;
	}
	public void setOrderListName(String orderListName) {
		this.orderListName = orderListName;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "UserOrderList [oNum=" + oNum + ", userId=" + userId + ", oDate=" + oDate + ", deliChk=" + deliChk
				+ ", comment_chk=" + comment_chk + ", orderRName=" + orderRName + ", orderRNum=" + orderRNum
				+ ", orderListName=" + orderListName + ", totalPrice=" + totalPrice + "]";
	}
}
