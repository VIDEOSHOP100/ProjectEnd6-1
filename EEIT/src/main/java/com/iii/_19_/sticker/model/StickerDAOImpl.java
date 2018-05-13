package com.iii._19_.sticker.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class StickerDAOImpl implements StickerDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<StickerBean> getAllSticker() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM StickerBean WHERE StickerStatus = '1'",StickerBean.class).list();
	}

	@Override
	public StickerBean getStickerBySeqNo(Integer stickerSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM StickerBean WHERE StickerStatus = '1' and stickerSeqNo = :stickerSeqNo",StickerBean.class).setParameter("stickerSeqNo", stickerSeqNo).uniqueResult();
	}

	@Override
	public int saveSticker(StickerBean stickerBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(stickerBean);
	}

	@Override
	public void updateSticker(StickerBean stickerBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(stickerBean);
	}

	@Override
	public void deleteSticker(StickerBean stickerBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(stickerBean);
	}

}

