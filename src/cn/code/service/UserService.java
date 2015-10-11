package cn.code.service;

import cn.code.dao.BaseDao;
import cn.code.domain.User;

public interface UserService extends BaseDao<User> {
	public User loginUser(String userName, String passWord);
}
