package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Users;
import sql.Sql;

public class UsersDAOImpl extends BaseDAO implements UsersDAO {

	@Override
	public boolean insert(Users users) {
		boolean result = false;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_INSERT_SQL);

			preparedStatement.setString(1, users.getUserId());
			preparedStatement.setString(2, users.getuPwd());
			preparedStatement.setString(3, users.getuName());
			preparedStatement.setString(4, users.getuAddr());
			preparedStatement.setString(5, users.getuPhonenum());

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
	public Users selectByUserIdPwd(String userId, String uPwd) {
		Users users = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_SELECT_BY_USERID_PWD_SQL);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, uPwd);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				users = new Users();

				users.setUserId(resultSet.getString("userId"));
				users.setuPwd(resultSet.getString("uPwd"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
				users.setAuthority(resultSet.getInt("authority"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return users;
	}

	@Override
	public Users selectByuNameuPhonenum(String uName, String uPhonenum) {
		Users users = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_SELECT_BY_UNAME_UPHONE_SQL);
			preparedStatement.setString(1, uName);
			preparedStatement.setString(2, uPhonenum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				users = new Users();

				users.setUserId(resultSet.getString("userId"));
				users.setuPwd(resultSet.getString("uPwd"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return users;
	}

	@Override
	public Users selectByuserIduNameuPhonenum(String userId, String uName, String uPhonenum) {
		Users users = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_SELECT_BY_USERID_UNAME_UPHONE_SQL_SQL);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, uName);
			preparedStatement.setString(3, uPhonenum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				users = new Users();

				users.setUserId(resultSet.getString("userId"));
				users.setuPwd(resultSet.getString("uPwd"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return users;
	}

	@Override
	public boolean update_pwd(Users users) {
		boolean result = false;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_UPDATE_PWD_SQL);

			preparedStatement.setString(1, users.getuPwd());
			preparedStatement.setString(2, users.getUserId());

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

	public boolean check_userId(String userId) {
		boolean result = false;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_SELECT_BY_USERID);

			preparedStatement.setString(1, userId);

			resultSet = preparedStatement.executeQuery();

			result = resultSet.next();
		} catch (SQLException e) {
			/* System.out.println("check_userId err : " + e); */
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean deleteByUserId(String userId) {
		boolean result = false;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_DELETE_SQL);

			preparedStatement.setString(1, userId);
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean update(Users users) {
		boolean result = false;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_UPDATE_SQL);

			preparedStatement.setString(1, users.getuName());
			preparedStatement.setString(2, users.getuAddr());
			preparedStatement.setString(3, users.getuPhonenum());
			preparedStatement.setString(4, users.getUserId());

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
	public boolean confirmuPwd(String userId, String uPwd) {
		boolean result = false;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_SELECT_BY_USERID_PWD_SQL);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, uPwd);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return result;
	}

	public int selectAuthorityByUserId(String userId){	
		
		int authority = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try
		{
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_AUTHORITY_SQL);
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next())
			{
				authority = resultSet.getInt("authority");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return authority;
	}

	@Override
	public Users selectByUserId(String userId){
		Users users = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERS_SELECT_BY_USERID_SQL);
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				users = new Users();

				users.setUserId(resultSet.getString("userId"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return users;
	}
}
