package cn.code.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.ArticleImage;
import cn.code.service.ArticleImageService;

@Service
@Transactional
public class ArticleImageServiceImpl extends BaseDaoImpl<ArticleImage>
    implements ArticleImageService {

	@SuppressWarnings("unchecked")
	public List<ArticleImage> getArticleImageListByArticleId(Long articleId) {
		return getSession().createQuery(//
		    "FROM ArticleImage a where a.article.id =?")//
		    .setParameter(0, articleId)//
		    .list();
	}
}
