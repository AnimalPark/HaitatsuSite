package model;

public class UserOrderListSub {
	private String rName;
	private int rNum;
	private String mName;
	private int count;
	private int mPrice;
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	@Override
	public String toString() {
		return "UserOrderListSub [rName=" + rName + ", rNum=" + rNum + ", mName=" + mName + ", count=" + count
				+ ", mPrice=" + mPrice + "]";
	}
}
