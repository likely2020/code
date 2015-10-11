package cn.code.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Article;
import cn.code.service.ArticleService;

@Service
@Transactional
public class ArticleServiceImpl extends BaseDaoImpl<Article> implements
    ArticleService {

	@SuppressWarnings("unchecked")
	public List<Article> getArticleListBycategoryName(String categoryName) {
		return getSession().createQuery(//
		    "FROM Article a WHERE a.category.name = ? ORDER BY id DESC")//
		    .setParameter(0, categoryName)//
		    .list();
	}

}
