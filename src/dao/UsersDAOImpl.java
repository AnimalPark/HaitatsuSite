package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Users;

public class UsersDAOImpl extends BaseDAO implements UsersDAO
{
	private static final String USERS_INSERT_SQL
	= "INSERT INTO users VALUES(?, ?, ?, ?, ?)";
	
	private static final String USERS_SELECT_BY_USERID_PWD_SQL
	= "SELECT userId, uPwd, uName, uAddr, uPhonenum, authority FROM users WHERE userId = ? AND uPwd = ?";
	
	private static final String USERS_SELECT_BY_UNAME_UPHONE_SQL
	= "SELECT * FROM users WHERE uName = ? AND uPhonenum = ?";
	
	private static final String USERS_SELECT_BY_USERID_UNAME_UPHONE_SQL_SQL
	= "SELECT * FROM users WHERE userId= ? AND uName= ? AND uPhonenum = ?";
	
	private static final String USERS_UPDATE_PWD_SQL
	= "UPDATE users SET uPwd = ? WHERE userId = ?";
	
	/*private static final String USERS_SELECT_ALL_SQL
	= "SELECT * FROM users WHERE userId = ?";*/
	
	@Override
	public boolean insert(Users users)
	{
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try
		{
			connection = getConnection();
			preparedStatement = connection.prepareStatement(USERS_INSERT_SQL);
						
			preparedStatement.setString(1, users.getUserId());
			preparedStatement.setString(2, users.getuPwd());
			preparedStatement.setString(3, users.getuName());
			preparedStatement.setString(4, users.getuAddr());
			preparedStatement.setString(5, users.getuPhonenum());
				
			int rowCount = preparedStatement.executeUpdate();
				
			if(rowCount > 0)
			{
				result = true;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public Users selectByUserIdPwd(String userId, String uPwd)
	{
		Users users = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try
		{
			connection = getConnection();
			preparedStatement = connection.prepareStatement(USERS_SELECT_BY_USERID_PWD_SQL);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, uPwd);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next())
			{
				users = new Users();
				
				users.setUserId(resultSet.getString("userId"));
				users.setuPwd(resultSet.getString("uPwd"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
				users.setAuthority(resultSet.getInt("authority"));
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
		return users;
	}

	@Override
	public Users selectByuNameuPhonenum(String uName, String uPhonenum)
	{
		Users users = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try
		{
			connection = getConnection();
			preparedStatement = connection.prepareStatement(USERS_SELECT_BY_UNAME_UPHONE_SQL);
			preparedStatement.setString(1, uName);
			preparedStatement.setString(2, uPhonenum);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next())
			{
				users = new Users();
				
				users.setUserId(resultSet.getString("userId"));
				users.setuPwd(resultSet.getString("uPwd"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
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
		return users;
	}

	@Override
	public Users selectByuserIduNameuPhonenum(String userId, String uName, String uPhonenum)
	{
		Users users = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try
		{
			connection = getConnection();
			preparedStatement = connection.prepareStatement(USERS_SELECT_BY_USERID_UNAME_UPHONE_SQL_SQL);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, uName);
			preparedStatement.setString(3, uPhonenum);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next())
			{
				users = new Users();
				
				users.setUserId(resultSet.getString("userId"));
				users.setuPwd(resultSet.getString("uPwd"));
				users.setuName(resultSet.getString("uName"));
				users.setuAddr(resultSet.getString("uAddr"));
				users.setuPhonenum(resultSet.getString("uPhonenum"));
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
		return users;
	}
	

	@Override
	public boolean update(Users users)
	{
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try
		{
			connection = getConnection();
			preparedStatement = connection.prepareStatement(USERS_UPDATE_PWD_SQL);
			
			preparedStatement.setString(1, users.getuPwd());
			preparedStatement.setString(2, users.getUserId());
			
			int rowCount = preparedStatement.executeUpdate();
			
			if(rowCount > 0)
			{
				result = true;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	public int registerCheck(String userId)
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection connection = null;
		String SQL = "SELECT * FROM users WHERE userId = ?";
		
		try
		{
			connection = getConnection();
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next() || userId.equals(""))
			{
				return 0; //이미 존재하는 회원
			}
			else
			{
				return 1; //가입 가능한 회원 아이디
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
}
