package dao;

import java.util.List;

import model.Ybbs_QA;

public interface Ybbs_QADAO {

	boolean Insert(Ybbs_QA ybbs);

	List<Ybbs_QA> selectAll();
	List<Ybbs_QA> selectAll(int rowStartNumber , int rowEndNumber);
	List<Integer> selectById(String userid);
	String validChk(int qanumber);
	
	Ybbs_QA selectByNo(int no);

	void insertReply(Ybbs_QA ybbs);

	void update(Ybbs_QA ybbs);

	void delete(int qanumber);
	void deleteByGroup(List<Integer> qagroup);
	
	void updateVisited(int qanumber);
}
