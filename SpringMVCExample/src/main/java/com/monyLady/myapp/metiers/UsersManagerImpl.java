package com.monyLady.myapp.metiers;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.monyLady.myapp.dao.UsersDAO;
import com.monyLady.myapp.ligth.UsersLight;
import com.monyLady.myapp.model.Users;
@Service
public class UsersManagerImpl implements UsersManager {
	
	@Autowired
	private UsersDAO usersDAO;

	public UsersDAO getUsersDAO() {
		return usersDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	@Override
	public Users getUserByLogin(String login, String pass) {
		Users user = usersDAO.getUsersByLogin(login, pass);
		return user;
	}

	@Override
	@Transactional
	public Users saveUser(Users user) {
		return usersDAO.saveUser(user);
		
	}
	
	public Users toUsers(UsersLight userLight){
		Users user = new Users();
		user.setFirstName(userLight.getFirstName());
		user.setLastName(userLight.getLastName());
		user.setMail(userLight.getMail());
		user.setPassword(userLight.getPassword());
		
		return user;
	}

	public UsersLight toUserLight(Users user){
		UsersLight userLight = new UsersLight();
		userLight.setFirstName(user.getFirstName());
		userLight.setLastName(user.getLastName());
		userLight.setMail(user.getMail());
		userLight.setPassword(user.getPassword());
		
		return userLight;
	}
}
