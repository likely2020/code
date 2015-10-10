package cn.code.service.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Temp;
import cn.code.service.TempService;

@Service
@Transactional
public class TempServiceImpl extends BaseDaoImpl<Temp> implements TempService {

	public void cleanTemp() {
		Query query = getSession().createQuery(//
		    "DELETE FROM Temp");
		query.executeUpdate();
	}

}
