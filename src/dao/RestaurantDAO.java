package dao;

import java.util.List;

import model.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> selectAll();
	List<Restaurant> selectByName(String name);
	
	boolean insertRestaurant(Restaurant restaurant);
	boolean updateRestaurant(Restaurant restaurant);
	boolean deleteRestaurant(int rNum);
	
}
