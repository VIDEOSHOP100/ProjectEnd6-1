package com.iii._14_.forum.model.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService{
	
    @Autowired
	ArticleDAO articleDAO;
    
	@Override
	public ArticleBean insert(ArticleBean ab) {
		return articleDAO.insert(ab);
	}

	@Override
	public ArticleBean update(ArticleBean ab) {
		return articleDAO.update(ab);
	}

	@Override
	public ArticleBean delete(ArticleBean ab) {
		return articleDAO.delete(ab);
	}

	@Override
	public ArticleBean findByPk(ArticleBean ab) {
		return articleDAO.findByPk(ab);
	}

	@Override
	public List<ArticleBean> getArticle() {
		return articleDAO.getArticle();
	}

}
