package dao;

import java.util.List;

import model.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> selectAll();
	List<Restaurant> selectByName(String name);
	Restaurant selectByNum(int rnum);
	
	boolean insertRestaurant(Restaurant restaurant);
	boolean updateRestaurant(Restaurant restaurant);
	boolean deleteRestaurant(int rNum);
	
}
