package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.City;
import model.Menu;
import model.Restaurant;
import model.Town;
import sql.Sql;

public class MenuDAOImpl extends BaseDAO implements MenuDAO {

	@Override
	public List<Restaurant> selectByCategory(int category) {
		List<Restaurant> lists = new ArrayList<Restaurant>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_CATEGORY_SQL);
			preparedStatement.setInt(1, category);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Restaurant restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getInt("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));

				lists.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<City> selectAllCity() {
		List<City> lists = new ArrayList<City>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.CITY_SELECT_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				City city = new City();

				city.setCitynum(resultSet.getInt("CITYNUM"));
				city.setCityname(resultSet.getString("CITYNAME"));

				lists.add(city);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<Town> selectAllTown() {
		List<Town> lists = new ArrayList<Town>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.TOWN_SELECT_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Town town = new Town();

				town.setCitynum(resultSet.getInt("CITYNUM"));
				town.setTownnum(resultSet.getInt("TOWNNUM"));
				town.setTownname(resultSet.getString("TOWNNAME"));

				lists.add(town);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<Restaurant> selectByTownnum(String cityname, String townname) {
		List<Restaurant> lists = new ArrayList<Restaurant>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_TOWNNUM_SQL);
			preparedStatement.setString(1, cityname);
			preparedStatement.setString(2, townname);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Restaurant restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getInt("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));

				lists.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<Menu> selectAllMenu() {
		List<Menu> menus = new ArrayList<Menu>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_ALL_MENU_SQL);
			
			while (resultSet.next()) {
				Menu menu = new Menu();
				
				menu.setmNum(resultSet.getInt("mNum"));
				menu.setrNum(resultSet.getInt("rNum"));
				menu.setmName(resultSet.getString("mName"));
				menu.setmPrice(resultSet.getInt("mPrice"));
				menu.setmSales(resultSet.getInt("mSales"));
				
				menus.add(menu);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return menus;
	}

	@Override
	public Menu selectByMnum(int mNum) {
		Menu menu = new Menu();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_MNUM_SQL);
			preparedStatement.setInt(1, mNum);
			resultSet = preparedStatement.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return menu;
	}

	@Override
	public boolean insertMenu(Menu menu) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_INSERT_MENU_SQL);
			
			preparedStatement.setInt(1, menu.getrNum());
			preparedStatement.setString(2, menu.getmName());
			preparedStatement.setInt(3, menu.getmPrice());
			preparedStatement.setInt(4, menu.getmSales());
			
			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		
		return result;
	}

	@Override
	public boolean updateMenu(Menu menu) {

		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_UPDATE_MENU_SQL);
			
			preparedStatement.setInt(1, menu.getrNum());
			preparedStatement.setString(2, menu.getmName());
			preparedStatement.setInt(3, menu.getmPrice());
			preparedStatement.setInt(4, menu.getmSales());
			preparedStatement.setInt(5, menu.getmNum());
			
			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		
		return result;
	}

	@Override
	public boolean deleteMenu(int mNum) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_DELETE_MENU_SQL);
			preparedStatement.setInt(1, mNum);
			
			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	public Restaurant selectByRnum(int rnum) {
		Restaurant restaurant = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_RNUM_SQL);
			preparedStatement.setInt(1, rnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getInt("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));
				restaurant.setrAddr(resultSet.getString("RADDR"));
				restaurant.setrPhoneNum(resultSet.getString("RPHONENUM"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return restaurant;
	}

	@Override
	public List<Menu> menuSelectByRnum(int rnum) {
		List<Menu> lists = new ArrayList<Menu>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_RNUM_SQL);
			preparedStatement.setInt(1, rnum);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Menu menu = new Menu();

				menu.setmNum(resultSet.getInt("mNum"));
				menu.setrNum(resultSet.getInt("rNum"));
				menu.setmName(resultSet.getString("mName"));
				menu.setmPrice(resultSet.getInt("mPrice"));
				menu.setmSales(resultSet.getInt("mSales"));
				
				lists.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}
}
