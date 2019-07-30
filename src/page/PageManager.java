package page;

public class PageManager {

	private int requestPage;

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public PageManager() {

	}

	public PageManager(int requestPage) {
		this.requestPage = requestPage;
	}

	public PageRowResult getPageRowResult() {

		PageRowResult pageRowResult = new PageRowResult();

		// PageRowResult�� ��ü���� �� ����
		pageRowResult.setRowStartNumber(PageInfo.ROW_COUNT_PRE_PAGE * (requestPage - 1) + 1); // 1 6 11 21
		pageRowResult.setRowEndNumber(PageInfo.ROW_COUNT_PRE_PAGE * (requestPage)); // 5 10 16 22

		return pageRowResult;
	}

	public PageGroupResult getPageGroupResult(String sql) {
		
		PageGroupResult pageGroupResult = new PageGroupResult();

		int requestPageGroupNumber = ((requestPage-1)/PageInfo.SHOW_PAGE_COUNT) + 1;
		
		// PageGroupResult�� ��ü���� �� ����
		pageGroupResult.setGroupStartNumber((PageInfo.SHOW_PAGE_COUNT) * (requestPageGroupNumber - 1) + 1);
		pageGroupResult.setGroupEndNumber((requestPageGroupNumber) * (PageInfo.SHOW_PAGE_COUNT));
		
		
		PageDAO dao = new PageDAOImpl();
		//�� �� �� ��������
		int count = dao.getCount(PageSQL.YBBS_SELECT_ALL_COUNT);
		
		//�Ѹ�ũ ����
		int totalPageNumber = (count - 1) / (PageInfo.ROW_COUNT_PRE_PAGE) + 1;
		
		//last ������ ��ũ�� �����ϱ�
		if(totalPageNumber < pageGroupResult.getGroupEndNumber()) {
			pageGroupResult.setGroupEndNumber(totalPageNumber);
		}
		//before, after ����
	
		if(pageGroupResult.getGroupStartNumber() == 1) {
			
			pageGroupResult.setBeforePage(false);
		}
		
		
		if(pageGroupResult.getGroupEndNumber() == totalPageNumber) {
			
			pageGroupResult.setAfterPage(false);
		}
		
		
		pageGroupResult.setSelectPageNumber(requestPage);
		
		return pageGroupResult;
	}


}
