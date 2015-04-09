package com.monyLady.myapp.dao;

import com.monyLady.myapp.model.Users;

public interface UsersDAO {
	
	public void addUsers(Users users);
	public Users getUsersByLogin (String login, String passs);
	public Users saveUser(Users user);

	

}
