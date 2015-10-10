package cn.code.service;

import cn.code.dao.BaseDao;
import cn.code.domain.Temp;

public interface TempService extends BaseDao<Temp> {
	public void cleanTemp();
}
