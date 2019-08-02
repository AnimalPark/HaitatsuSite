package dao;

import java.util.List;

import model.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> selectAll();
	List<Restaurant> selectByName(String rName);
	Restaurant selectByNum(int rNum);
	
	boolean insertRestaurant(Restaurant restaurant);
	boolean updateRestaurant(Restaurant restaurant);
	boolean deleteRestaurant(int rNum);
	
}
