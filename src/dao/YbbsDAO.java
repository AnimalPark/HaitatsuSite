package dao;

import java.util.List;

import model.Ybbs;

public interface YbbsDAO {

	boolean Insert(Ybbs ybbs);

	List<Ybbs> selectAll();
	List<Ybbs> selectAll(int rowStartNumber , int rowEndNumber);
	
	Ybbs selectByNo(int no);

	void insertReply(Ybbs ybbs);

	void update(Ybbs ybbs);

	void delete(int no);

	void updateVisited(int no);
}
