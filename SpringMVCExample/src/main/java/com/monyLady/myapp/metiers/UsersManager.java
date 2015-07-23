package com.monyLady.myapp.metiers;

import com.monyLady.myapp.ligth.UsersLight;
import com.monyLady.myapp.model.Users;

public interface UsersManager {
	
	public Users getUserByLogin(String login, String pass);
	public Users saveUser(Users users);
	public UsersLight toUserLight(Users user);
	public Users toUsers(UsersLight userLight);

}
