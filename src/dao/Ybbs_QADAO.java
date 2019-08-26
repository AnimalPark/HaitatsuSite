package dao;

import java.util.List;

import model.Ybbs_QA;

public interface Ybbs_QADAO {

	boolean Insert(Ybbs_QA ybbs);

	List<Ybbs_QA> selectAll();
	List<Ybbs_QA> selectAll(int rowStartNumber , int rowEndNumber);
	List<Integer> selectById(String userId);
	String validChk(int qaNumber);
	
	Ybbs_QA selectByNo(int qaNumber);

	void insertReply(Ybbs_QA ybbs);

	void update(Ybbs_QA ybbs);

	void delete(int qaGroup);
	void deleteReply(int qaNumber);
	void deleteByGroup(List<Integer> qaGroup);
	
	void updateVisited(int qaNumber);
}
