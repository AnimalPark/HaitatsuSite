package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import model.Users;

public interface UsersDAO
{	
	boolean insert(Users users);

	Users selectByUserIdPwd(String userId, String uPwd);
	Users selectByuNameuPhonenum(String uName, String uPhonenum);
	Users selectByuserIduNameuPhonenum(String userId, String uName, String uPhonenum);
	int selectAuthorityByUserId(String userId);
	
	boolean update_pwd(Users users);
	boolean update(Users users);
	
	boolean check_userId(String userId);
	
	boolean deleteByUserId(String userId);
	
	boolean confirmuPwd(String userId, String uPwd);
	
	
}