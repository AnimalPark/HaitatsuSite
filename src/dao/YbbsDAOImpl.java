package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Ybbs;
import sql.Sql;

public class YbbsDAOImpl extends BaseDAO implements YbbsDAO {

	
	@Override

	public boolean Insert(Ybbs ybbs) {

		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_INSERT_SQL);

			preparedStatement.setString(1, ybbs.getSubject());
			preparedStatement.setString(2, ybbs.getContent());
			preparedStatement.setString(3, ybbs.getId());

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
	public List<Ybbs> selectAll() {

		List<Ybbs> ybbsList = new ArrayList<Ybbs>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Ybbs ybbs = new Ybbs();
				ybbs.setNo(resultSet.getInt("no"));
				ybbs.setSubject(resultSet.getString("subject"));
				ybbs.setId(resultSet.getString("id"));
				ybbs.setWdate(resultSet.getString("wdate"));
				ybbs.setGrp(resultSet.getInt("grp"));
				ybbs.setLvl(resultSet.getInt("lvl"));
				ybbs.setVisited(resultSet.getInt("visited"));

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
	public Ybbs selectByNo(int no) {
		Ybbs ybbs = new Ybbs();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_SELECTBYNO_SQL);
			preparedStatement.setInt(1, no);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				if (resultSet.getInt("no") == no)
					ybbs.setNo(resultSet.getInt("no"));
				ybbs.setId(resultSet.getString("id"));
				ybbs.setSubject(resultSet.getString("subject"));
				ybbs.setContent(resultSet.getString("content"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return ybbs;
	}

	@Override
	public void insertReply(Ybbs ybbs) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_INSERT_REPLY_SQL);

			preparedStatement.setString(1, ybbs.getSubject());
			preparedStatement.setString(2, ybbs.getContent());
			preparedStatement.setInt(3, ybbs.getGrp());
			preparedStatement.setString(4, ybbs.getId());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);

		}

	}

	@Override
	public void delete(int no) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_DELETE_SQL);
			preparedStatement.setInt(1, no);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public void update(Ybbs ybbs) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_SQL);
			preparedStatement.setString(1, ybbs.getSubject());
			preparedStatement.setString(2, ybbs.getContent());
			preparedStatement.setInt(3, ybbs.getNo());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public void updateVisited(int no) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.YBBS_UPDATE_VISITED);
			preparedStatement.setInt(1, no);
			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public List<Ybbs> selectAll(int rowStartNumber, int rowEndNumber) {
		
		List<Ybbs> ybbsList = new ArrayList<Ybbs>();

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

				Ybbs ybbs = new Ybbs();
				ybbs.setNo(resultSet.getInt("no"));
				ybbs.setSubject(resultSet.getString("subject"));
				ybbs.setId(resultSet.getString("id"));
				ybbs.setWdate(resultSet.getString("wdate"));
				ybbs.setGrp(resultSet.getInt("grp"));
				ybbs.setLvl(resultSet.getInt("lvl"));
				ybbs.setVisited(resultSet.getInt("visited"));

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
