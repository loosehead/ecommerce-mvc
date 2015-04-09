package com.monyLady.myapp.metiers;

import javax.transaction.Transactional;

import com.monyLady.myapp.dao.UsersDAO;
import com.monyLady.myapp.model.Users;

public class UsersManagerImpl implements UsersManager {
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
		usersDAO.saveUser(user);

		return user;
	}

}
