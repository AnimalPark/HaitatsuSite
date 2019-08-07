package model;

public class Selected_menu {
	private int mNum;
	private int count;
	private int price;
	private String mName;
	private int delichk;
	
	public int isDelichk() {
		return delichk;
	}
	public void setDelichk(int delichk) {
		this.delichk = delichk;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	@Override
	public String toString() {
		return "Selected_menu [mNum=" + mNum + ", count=" + count + ", price=" + price + ", mName=" + mName
				+ ", delichk=" + delichk + "]";
	}
	
}
