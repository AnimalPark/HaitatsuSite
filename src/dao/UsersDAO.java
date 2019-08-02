package dao;

import model.Users;

public interface UsersDAO
{	
	boolean insert(Users users);
	
	Users selectByUserIdPwd(String userId, String uPwd);
	Users selectByuNameuPhonenum(String uName, String uPhonenum);
	Users selectByuserIduNameuPhonenum(String userId, String uName, String uPhonenum);
	
	boolean update(Users users);
}
