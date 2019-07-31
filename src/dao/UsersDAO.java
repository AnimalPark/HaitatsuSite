package dao;

import model.Users;

public interface UsersDAO {
	
	Users selectById(String id);
}
