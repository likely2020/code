package cn.code.service;

import java.util.Collection;

import cn.code.dao.BaseDao;
import cn.code.domain.Privilege;

public interface PrivilegeService extends BaseDao<Privilege> {
	public Collection<String> getAllPrivilegeUrls();
}
