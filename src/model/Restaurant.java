package model;

public class Restaurant {
	private int rNum;
	private String rName;
	private String rPhoneNum;
	private int cNum;
	private int townNum;
	private float starAvg;
	private String rAddr;
	private String fileName;

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

	public String getrPhoneNum() {
		return rPhoneNum;
	}

	public void setrPhoneNum(String rPhoneNum) {
		this.rPhoneNum = rPhoneNum;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public int getTownNum() {
		return townNum;
	}

	public void setTownNum(int townNum) {
		this.townNum = townNum;
	}

	public float getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(float starAvg) {
		this.starAvg = starAvg;
	}

	public String getrAddr() {
		return rAddr;
	}

	public void setrAddr(String rAddr) {
		this.rAddr = rAddr;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Restaurant [rNum=" + rNum + ", rName=" + rName + ", rPhoneNum=" + rPhoneNum + ", cNum=" + cNum
				+ ", townNum=" + townNum + ", starAvg=" + starAvg + ", rAddr=" + rAddr + "]";
	}

}
