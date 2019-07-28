package model;

public class Town {
	private int townnum;
	private int citynum;
	private String townname;
	public int getTownnum() {
		return townnum;
	}
	public void setTownnum(int townnum) {
		this.townnum = townnum;
	}
	public int getCitynum() {
		return citynum;
	}
	public void setCitynum(int citynum) {
		this.citynum = citynum;
	}
	public String getTownname() {
		return townname;
	}
	public void setTownname(String townname) {
		this.townname = townname;
	}
	@Override
	public String toString() {
		return "Town [townnum=" + townnum + ", citynum=" + citynum + ", townname=" + townname + "]";
	}
}
