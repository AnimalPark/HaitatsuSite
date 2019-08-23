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

public class Ybbs_QADAOImpl extends BaseDAO implements Ybbs_QADAO {

	@Override

	public boolean Insert(Ybbs_QA ybbs) {

		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_INSERT_SQL);

			preparedStatement.setString(1, ybbs.getQaSubject());
			preparedStatement.setString(2, ybbs.getQaComment());
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
	public List<Ybbs_QA> selectAll() {

		List<Ybbs_QA> ybbsList = new ArrayList<Ybbs_QA>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Ybbs_QA ybbs = new Ybbs_QA();
				ybbs.setQaNumber(resultSet.getInt("qaNumber"));
				ybbs.setQaSubject(resultSet.getString("qaSubject"));
				ybbs.setUserId(resultSet.getString("userId"));
				ybbs.setQaDate(resultSet.getString("qaDate"));
				ybbs.setQaGroup(resultSet.getInt("qaGroup"));
				ybbs.setQaLevel(resultSet.getInt("qaLevel"));
				ybbs.setQaVisited(resultSet.getInt("qaVisited"));

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
	public Ybbs_QA selectByNo(int qaNumber) {
		Ybbs_QA ybbs = new Ybbs_QA();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTBYNO_SQL);
			preparedStatement.setInt(1, qaNumber);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				if (resultSet.getInt("qaNumber") == qaNumber)
				ybbs.setQaNumber(resultSet.getInt("qaNumber"));
				ybbs.setUserId(resultSet.getString("userId"));
				ybbs.setQaSubject(resultSet.getString("qaSubject"));
				ybbs.setQaComment(resultSet.getString("qaComment"));
				ybbs.setQaGroup(resultSet.getInt("qaGroup"));
				ybbs.setQaLevel(resultSet.getInt("qaLevel"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbs;
	}

	@Override
	public void insertReply(Ybbs_QA ybbs) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_INSERT_REPLY_SQL);

			preparedStatement.setString(1, ybbs.getQaSubject());
			preparedStatement.setString(2, ybbs.getQaComment());
			preparedStatement.setString(3, ybbs.getUserId());
			preparedStatement.setInt(4, ybbs.getQaGroup());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);

		}

	}

	@Override
	public void delete(int qaGroup) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_DELETE_SQL);
			preparedStatement.setInt(1, qaGroup);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}public void deleteReply(int qaNumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_DELETE_REPLY_SQL);
			preparedStatement.setInt(1, qaNumber);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public void update(Ybbs_QA ybbs) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_SQL);
			preparedStatement.setString(1, ybbs.getQaSubject());
			preparedStatement.setString(2, ybbs.getQaComment());
			preparedStatement.setInt(3, ybbs.getQaNumber());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public void updateVisited(int qaNumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_VISITED);
			preparedStatement.setInt(1, qaNumber);
			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public List<Ybbs_QA> selectAll(int rowStartNumber, int rowEndNumber) {

		List<Ybbs_QA> ybbsList = new ArrayList<Ybbs_QA>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_PAGE_SQL);
			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Ybbs_QA ybbs = new Ybbs_QA();

				ybbs.setQaNumber(resultSet.getInt("qaNumber"));
				ybbs.setQaSubject(resultSet.getString("qaSubject"));
				ybbs.setUserId(resultSet.getString("userId"));
				ybbs.setQaDate(resultSet.getString("qaDate").substring(2, 16));
				ybbs.setQaGroup(resultSet.getInt("qaGroup"));
				ybbs.setQaLevel(resultSet.getInt("qaLevel"));
				ybbs.setQaVisited(resultSet.getInt("qaVisited"));

				ybbsList.add(ybbs);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbsList;

	}

	public List<Ybbs_Event> selectAllEvent() {

		List<Ybbs_Event> ybbsList = new ArrayList<Ybbs_Event>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECT_ALL_EVENT_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Ybbs_Event ybbs = new Ybbs_Event();
				ybbs.setEvNumber(resultSet.getInt("evNumber"));
				ybbs.setEvSubject(resultSet.getString("qaSubject"));
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
	public String validChk(int qaNumber) {

		String id = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_CHK_VALID);
			preparedStatement.setInt(1, qaNumber);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				id = resultSet.getString("userId");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return id;
	}

	public List<Integer> selectById(String userId) {

		List<Integer> ybbsList = new ArrayList<Integer>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTBY_ID_SQL);
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Integer ybbs = new Integer(resultSet.getInt("qaNumber"));
				ybbsList.add(ybbs);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbsList;
	}

	public void deleteByGroup(List<Integer> qagroup) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_DELETE_BY_GROUP_SQL);

			for (int i = 0; i < qagroup.size(); i++) {
				preparedStatement.setInt(1, i);
				preparedStatement.executeUpdate();

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

}
