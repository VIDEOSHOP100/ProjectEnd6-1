package com.iii._14_.forum.model.article;

import java.util.List;

public interface ArticleService {
	
	ArticleBean insert(ArticleBean ab);
	
	ArticleBean update(ArticleBean ab);
	
	ArticleBean delete(ArticleBean ab);
	
	ArticleBean findByPk(ArticleBean ab);
	
	List<ArticleBean> getArticle(); 
}
