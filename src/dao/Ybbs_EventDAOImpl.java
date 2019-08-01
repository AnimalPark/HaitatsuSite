package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Ybbs_Event;
import model.Ybbs_QA;
import sql.Sql;

public class Ybbs_EventDAOImpl extends BaseDAO implements Ybbs_EventDAO {

	@Override
	public List<Ybbs_Event> selectAllEvent(int rowStartNumber, int rowEndNumber) {

		List<Ybbs_Event> ybbsList = new ArrayList<Ybbs_Event>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_PAGE_EVENT_SQL);
			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Ybbs_Event ybbs = new Ybbs_Event();

				ybbs.setEvNumber(resultSet.getInt("evNumber"));
				ybbs.setEvSubject(resultSet.getString("evSubject"));
				ybbs.setEvComment(resultSet.getString("evComment"));
				ybbs.setEvDate(resultSet.getString("evDate"));
				ybbs.setEvVisited(resultSet.getInt("evVisited"));
				ybbs.setUserId(resultSet.getString("userId"));
				ybbsList.add(ybbs);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbsList;
	}

	@Override
	public Ybbs_Event selectByNo(int evNumber) {

		Ybbs_Event ybbs = new Ybbs_Event();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTBY_EVNUM_SQL);
			preparedStatement.setInt(1, evNumber);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				if (resultSet.getInt("evNumber") == evNumber)
					ybbs.setEvNumber(resultSet.getInt("evNumber"));
				ybbs.setUserId(resultSet.getString("userId"));
				ybbs.setEvSubject(resultSet.getString("evSubject"));
				ybbs.setEvComment(resultSet.getString("evComment"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbs;
	}

	public void updateVisited(int evNumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_EVENT_VISITED);
			preparedStatement.setInt(1, evNumber);
			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public boolean Insert(Ybbs_Event ybbs) {

		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_INSERT_EVENT_SQL);

			preparedStatement.setString(1, ybbs.getEvSubject());
			preparedStatement.setString(2, ybbs.getEvComment());
			preparedStatement.setString(3, ybbs.getUserId());

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;

	}

	@Override
	public void update(Ybbs_Event ybbs) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_EVENT_SQL);
			preparedStatement.setString(1, ybbs.getEvSubject());
			preparedStatement.setString(2, ybbs.getEvComment());
			preparedStatement.setInt(3, ybbs.getEvNumber());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public void delete(int evNumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_DELETE_EVENT_SQL);
			preparedStatement.setInt(1, evNumber);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

}
