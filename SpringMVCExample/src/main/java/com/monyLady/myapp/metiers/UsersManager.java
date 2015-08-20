package com.monyLady.myapp.metiers;

import javax.mail.MessagingException;

import com.monyLady.myapp.ligth.UsersLight;
import com.monyLady.myapp.model.Users;

public interface UsersManager {
	
	public Users getUserByLogin(String login, String pass);
	public Users saveUser(Users users) throws MessagingException;
	public UsersLight toUserLight(Users user);
	public Users toUsers(UsersLight userLight);

}
