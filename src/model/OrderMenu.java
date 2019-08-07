package model;

public class OrderMenu {
	private int mNum;
	private int oNum;
	private int count;
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "OrderMenu [mNum=" + mNum + ", oNum=" + oNum + ", count=" + count + "]";
	}
	
}
