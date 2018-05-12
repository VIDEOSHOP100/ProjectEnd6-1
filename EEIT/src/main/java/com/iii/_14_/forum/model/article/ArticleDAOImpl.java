package com.iii._14_.forum.model.article;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDAOImpl implements ArticleDAO{
	@Autowired
	SessionFactory factory;	
	
	@Override
	public ArticleBean insert(ArticleBean ab) {
		Session session = factory.getCurrentSession();
		ArticleBean temp = session.get(ArticleBean.class, ab.getArticleSeqNo());
		if(temp==null) {
			session.save(ab);
			return ab;
		}
		return null;
	}

	@Override
	public ArticleBean update(ArticleBean ab) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(ab);
		return ab;
	}

	@Override
	public ArticleBean delete(ArticleBean ab) {
		Session session = factory.getCurrentSession();
		ArticleBean temp = session.get(ArticleBean.class, ab.getArticleSeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}

	@Override
	public ArticleBean findByPk(ArticleBean ab) {
		Session session = factory.getCurrentSession();
		return session.get(ArticleBean.class, ab.getArticleSeqNo());
	}

	@Override
	public List<ArticleBean> getArticle() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from ArticleBean");
		return (List<ArticleBean>) query.list();
	}

}
