package com.iii._16_.PersonShop.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._19_.videoManage.model.VideoBean;
@Repository
public class PersonShopDaoImpl implements PersonShopDao{
	@Autowired	
	SessionFactory factory;
	@Override
	public PersonShopBean insert(PersonShopBean shopbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(shopbean);
		return shopbean;
	}

	@Override
	public PersonShopBean update(PersonShopBean shopbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(shopbean);
		return shopbean;
	}

	@Override
	public PersonShopBean delete(PersonShopBean shopbean) throws SQLException {
		Session session = factory.getCurrentSession();
		PersonShopBean temp = session.get(PersonShopBean.class, shopbean.getPersonShopSeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}

	@Override
	public PersonShopBean findbyPrimaryKey(PersonShopBean shopbean) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.get(PersonShopBean.class,  shopbean.getPersonShopSeqNo());
	}

	@Override
	public List<PersonShopBean> getALL() throws SQLException {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from PersonShopBean ");
		return (List<PersonShopBean>) query.list();
	}
	
	public List<PersonShopBean> getAllShopByAccount(String account) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM PersonShopBean WHERE account = :account",PersonShopBean.class).setParameter("account", account).list();
		
	}

}
