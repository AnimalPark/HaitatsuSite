package model;

public class Ybbs_QA {
	private int qanumber;
	private String qasubject;
	private String qacomment;
	private String qadate;
	private int qavisited;
	private String userid;
	private int qagroup;
	private int qalevel;
	
	public int getQanumber() {
		return qanumber;
	}
	public void setQanumber(int qanumber) {
		this.qanumber = qanumber;
	}
	public String getQasubject() {
		return qasubject;
	}
	public void setQasubject(String qasubject) {
		this.qasubject = qasubject;
	}
	public String getQacomment() {
		return qacomment;
	}
	public void setQacomment(String qacomment) {
		this.qacomment = qacomment;
	}
	public String getQadate() {
		return qadate;
	}
	public void setQadate(String qadate) {
		this.qadate = qadate;
	}
	public int getQavisited() {
		return qavisited;
	}
	public void setQavisited(int qavisited) {
		this.qavisited = qavisited;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getQagroup() {
		return qagroup;
	}
	public void setQagroup(int qagroup) {
		this.qagroup = qagroup;
	}
	public int getQalevel() {
		return qalevel;
	}
	public void setQalevel(int qalevel) {
		this.qalevel = qalevel;
	}
	
	@Override
	public String toString() {
		return "Ybbs_QA [qanumber=" + qanumber + ", qasubject=" + qasubject + ", qacomment=" + qacomment + ", qadate="
				+ qadate + ", qavisited=" + qavisited + ", userid=" + userid + ", qagroup=" + qagroup + ", qalevel="
				+ qalevel + "]";
	}
	
}
