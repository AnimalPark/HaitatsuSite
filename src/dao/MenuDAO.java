package dao;

import java.util.List;

import model.City;
import model.Menu;
import model.Restaurant;
import model.Town;

public interface MenuDAO {
	List<Restaurant> selectByCategory(int category);
	List<Restaurant> selectByTownnum(String cityname, String townname);	
	Restaurant selectByRnum(int rnum);	
	List<City> selectAllCity();
	List<Town> selectAllTown();
	
	Menu menuSelectByMnum(int mnum);
	List<Menu> menuDetailSelectByRnum(int rNum);
	List<Menu> menuSelectByRnum(int rnum);
	List<Menu> selectAllMenu();
	Menu selectByMnum(int mNum);
	
	public String MnumToMname(int mnum);
	public int priceOfMenu(int mnum);
	
	boolean insertMenu(Menu menu);
	boolean updateMenu(Menu menu);
	boolean deleteMenu(int mNum);
}
