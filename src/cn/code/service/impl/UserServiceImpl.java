package cn.code.service.impl;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.User;
import cn.code.service.UserService;

@Service
@Transactional
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService {

	public User loginUser(String userName, String passWord) {
		String passWordMd5 = DigestUtils.md5Hex(passWord);
		return (User) getSession().createQuery(//
		    "FROM User u WHERE u.userName=? AND u.passWord=?")//
		    .setParameter(0, userName)//
		    .setParameter(1, passWordMd5)//
		    .uniqueResult();
	}

}
