package model;

public class City {
	private int citynum;
	private String cityname;
	public int getCitynum() {
		return citynum;
	}
	public void setCitynum(int citynum) {
		this.citynum = citynum;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	@Override
	public String toString() {
		return "City [citynum=" + citynum + ", cityname=" + cityname + "]";
	}
	
}
