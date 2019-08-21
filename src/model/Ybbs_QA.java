package model;

public class Ybbs_QA {
	private int qaNumber;
	private String qaSubject;
	private String qaComment;
	private String qaDate;
	private int qaVisited;
	private String userId;
	private int qaGroup;
	private int qaLevel;
	public int getQaNumber() {
		return qaNumber;
	}
	public void setQaNumber(int qaNumber) {
		this.qaNumber = qaNumber;
	}
	public String getQaSubject() {
		return qaSubject;
	}
	public void setQaSubject(String qaSubject) {
		this.qaSubject = qaSubject;
	}
	public String getQaComment() {
		return qaComment;
	}
	public void setQaComment(String qaComment) {
		this.qaComment = qaComment;
	}
	public String getQaDate() {
		return qaDate;
	}
	public void setQaDate(String qaDate) {
		this.qaDate = qaDate;
	}
	public int getQaVisited() {
		return qaVisited;
	}
	public void setQaVisited(int qaVisited) {
		this.qaVisited = qaVisited;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getQaGroup() {
		return qaGroup;
	}
	public void setQaGroup(int qaGroup) {
		this.qaGroup = qaGroup;
	}
	public int getQaLevel() {
		return qaLevel;
	}
	public void setQaLevel(int qaLevel) {
		this.qaLevel = qaLevel;
	}
	@Override
	public String toString() {
		return "Ybbs_QA [qaNumber=" + qaNumber + ", qaSubject=" + qaSubject + ", qaComment=" + qaComment + ", qaDate="
				+ qaDate + ", qaVisited=" + qaVisited + ", userId=" + userId + ", qaGroup=" + qaGroup + ", qaLevel="
				+ qaLevel + "]";
	}
}


