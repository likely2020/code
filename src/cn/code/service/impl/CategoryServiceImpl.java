package cn.code.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Category;
import cn.code.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl extends BaseDaoImpl<Category> implements
    CategoryService {

}
