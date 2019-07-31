package dao;

import java.util.List;

import model.Category;
import model.Restaurant;

public interface MenuDAO {
	List<Restaurant> selectByCategory(int category);
}
