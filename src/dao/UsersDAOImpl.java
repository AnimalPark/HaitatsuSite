package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Users;

public class UsersDAOImpl extends BaseDAO implements UsersDAO
{
	private static final String USERS_INSERT_SQL
	= "INSERT INTO users VALUES(?, ?, ?, ?, ?)";
	
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

}
