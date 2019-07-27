package dao;

import java.util.List;

import model.Category;

public interface MenuDAO {
	List<Category> selectAll();
}
