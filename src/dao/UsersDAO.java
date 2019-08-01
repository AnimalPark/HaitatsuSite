package dao;

import model.Users;

public interface UsersDAO
{	
	boolean insert(Users users);
	Users selectByUserIdPwd(String userId, String uPwd);
}
