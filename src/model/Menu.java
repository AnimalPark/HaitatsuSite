package model;

public class Menu {
	private int mNum;
	private int rNum;
	private String mName;
	private int mPrice;
	private int mSales;

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getmPrice() {
		return mPrice;
	}

	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}

	public int getmSales() {
		return mSales;
	}

	public void setmSales(int mSales) {
		this.mSales = mSales;
	}

	@Override
	public String toString() {
		return "Menu [mNum=" + mNum + ", rNum=" + rNum + ", mName=" + mName + ", mPrice=" + mPrice + ", mSales="
				+ mSales + "]";
	}

}
