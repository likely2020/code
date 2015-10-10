package cn.code.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Article;
import cn.code.service.ArticleService;

@Service
@Transactional
public class ArticleServiceImpl extends BaseDaoImpl<Article> implements
    ArticleService {

}
