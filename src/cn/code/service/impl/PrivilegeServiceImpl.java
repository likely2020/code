package cn.code.service.impl;

import java.util.Collection;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Privilege;
import cn.code.service.PrivilegeService;

@Service
@Transactional
public class PrivilegeServiceImpl extends BaseDaoImpl<Privilege> implements
    PrivilegeService {

	@SuppressWarnings("unchecked")
	public Collection<String> getAllPrivilegeUrls() {
		return getSession().createQuery(//
		    "SELECT DISTINCT p.url FROM Privilege p WHERE p.url IS NOT NULL")//
		    .list();
	}
}
