package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import sql.Sql;

public class MenuDAOImpl extends BaseDAO implements MenuDAO {

	public List<Category> selectAll() {

		List<Category> lists = new ArrayList<Category>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Category categorys = new Category();
				categorys.setCnum(resultSet.getInt("CNUM"));
				categorys.setCname(resultSet.getString("CNAME"));
				lists.add(categorys);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

}
