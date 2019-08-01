package dao;

import java.util.List;

import model.Ybbs_Event;

public interface Ybbs_EventDAO {

	List<Ybbs_Event> selectAllEvent(int rowStartNumber , int rowEndNumber);
	
	Ybbs_Event selectByNo(int evNumber);
	void updateVisited(int evNumber);
	
	boolean Insert(Ybbs_Event ybbs);
	void update(Ybbs_Event ybbs);
	void delete(int evNumber);
}
