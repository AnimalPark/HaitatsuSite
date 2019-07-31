package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Restaurant;
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
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Restaurant restaurant = new Restaurant();
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

}
