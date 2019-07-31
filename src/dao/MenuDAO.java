package dao;

import java.util.List;

import model.Category;
import model.City;
import model.Restaurant;
import model.Town;

public interface MenuDAO {
	List<Restaurant> selectByCategory(int category);
	List<City> selectAllCity();
	List<Town> selectAllTown();
}
