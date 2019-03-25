package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	abstract boolean find(User user);
	abstract boolean findByName(String name);
	abstract List<User> findAll();
	abstract boolean save(User user);
	abstract Integer findMaxId();
}
