package page;

public class PageRowResult {

	private int rowStartNumber; //���������� ��µǴ� ROWNUM ���� ��
	private int rowEndNumber; //���������� ��µǴ� ROWNUM ������ ��

	public int getRowStartNumber() {
		return rowStartNumber;
	}

	public void setRowStartNumber(int rowStartNumber) {
		this.rowStartNumber = rowStartNumber;
	}

	public int getRowEndNumber() {
		return rowEndNumber;
	}

	public void setRowEndNumber(int rowEndNumber) {
		this.rowEndNumber = rowEndNumber;
	}
	
}
