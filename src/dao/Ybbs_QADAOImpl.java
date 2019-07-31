package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

			preparedStatement.setString(1, ybbs.getQasubject());
			preparedStatement.setString(2, ybbs.getQacomment());
			preparedStatement.setString(3, ybbs.getUserid());

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
				ybbs.setQanumber(resultSet.getInt("qanumber"));
				ybbs.setQasubject(resultSet.getString("qasubject"));
				ybbs.setUserid(resultSet.getString("userid"));
				ybbs.setQadate(resultSet.getString("qadate"));
				ybbs.setQagroup(resultSet.getInt("qagroup"));
				ybbs.setQalevel(resultSet.getInt("qalevel"));
				ybbs.setQavisited(resultSet.getInt("qavisited"));

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
	public Ybbs_QA selectByNo(int qanumber) {
		Ybbs_QA ybbs = new Ybbs_QA();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTBYNO_SQL);
			preparedStatement.setInt(1, qanumber);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				if (resultSet.getInt("qanumber") == qanumber)
				ybbs.setQanumber(resultSet.getInt("qanumber"));
				ybbs.setUserid(resultSet.getString("userid"));
				ybbs.setQasubject(resultSet.getString("qasubject"));
				ybbs.setQacomment(resultSet.getString("qacomment"));
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

			preparedStatement.setString(1, ybbs.getQasubject());
			preparedStatement.setString(2, ybbs.getQacomment());
			preparedStatement.setInt(3, ybbs.getQagroup());
			preparedStatement.setString(4, ybbs.getUserid());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);

		}

	}

	@Override
	public void delete(int qanumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_DELETE_SQL);
			preparedStatement.setInt(1, qanumber);

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
			preparedStatement.setString(1, ybbs.getQasubject());
			preparedStatement.setString(2, ybbs.getQacomment());
			preparedStatement.setInt(3, ybbs.getQanumber());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public void updateVisited(int qanumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_VISITED);
			preparedStatement.setInt(1, qanumber);
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


				ybbs.setQanumber(resultSet.getInt("qanumber"));
				ybbs.setQasubject(resultSet.getString("qasubject"));
				ybbs.setUserid(resultSet.getString("userid"));
				ybbs.setQadate(resultSet.getString("qadate"));
				ybbs.setQagroup(resultSet.getInt("qagroup"));
				ybbs.setQalevel(resultSet.getInt("qalevel"));
				ybbs.setQavisited(resultSet.getInt("qavisited"));

				ybbsList.add(ybbs);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbsList;
	}
}
