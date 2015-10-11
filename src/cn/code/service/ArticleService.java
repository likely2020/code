package cn.code.service;

import java.util.List;

import cn.code.dao.BaseDao;
import cn.code.domain.Article;

public interface ArticleService extends BaseDao<Article> {
	public List<Article> getArticleListBycategoryName(String categoryName);
}
