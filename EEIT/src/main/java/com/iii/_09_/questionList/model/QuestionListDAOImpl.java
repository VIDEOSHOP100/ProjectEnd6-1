package com.iii._09_.questionList.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class QuestionListDAOImpl implements QuestionListDAO{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Integer saveQuestionList(QuestionListBean questionListBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer)session.save(questionListBean);
	}

	@Override
	public void updateQuestionList(QuestionListBean questionListBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(sessionFactory);
	}

	@Override
	public void deleteQuestionList(QuestionListBean questionListBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(questionListBean);
	}

	@Override
	public QuestionListBean selectQuestionListBySeqNo(Integer questionListSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM QuestionListBean WHERE questionListSeqNo = :questionListSeqNo and questionListStatus = '1'", QuestionListBean.class).setParameter("questionListSeqNo", questionListSeqNo).uniqueResult();
	}

	@Override
	public List<QuestionListBean> selectQuestionList() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM QuestionListBean WHERE questionListStatus = '1'",QuestionListBean.class).list();
	}

}