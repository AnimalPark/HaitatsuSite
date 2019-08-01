package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.City;
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

			if(resultSet.next()) {
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

}
