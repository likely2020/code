package cn.code.service;

import java.util.List;

import cn.code.dao.BaseDao;
import cn.code.domain.ArticleImage;

public interface ArticleImageService extends BaseDao<ArticleImage> {
	public List<ArticleImage> getArticleImageListByArticleId(Long articleId);
}
