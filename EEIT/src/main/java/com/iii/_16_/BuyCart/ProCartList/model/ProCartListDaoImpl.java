package com.iii._16_.BuyCart.ProCartList.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.BuyCart.ProCart.model.ProCartBean;
import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
@Repository
public class ProCartListDaoImpl implements ProCartListDao{
	@Autowired	
	SessionFactory factory;

	@Override
	public ProCartListBean insert(ProCartListBean cartlist) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(cartlist);
		return cartlist;
	}

	@Override
	public ProCartListBean update(ProCartListBean cartlist) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(cartlist);
		return cartlist;
	}

	@Override
	public int delete(String account) throws SQLException {
		Session session = factory.getCurrentSession();
		List<ProCartListBean> templist = this.findbyAccount(account);
		if(templist.size()!=0) {
			for(ProCartListBean temp:templist) {
			session.delete(temp);
			}
			return 1;
		}
		return 0;
	}

	@Override
	public List<ProCartListBean> findbyAccount(String account) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProCartListBean WHERE account = :account",ProCartListBean.class).setParameter("account", account).list();
	}

	@Override
	public List<ProCartListBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGetId(ProCartListBean cartlist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProCartListBean findbyCartId(int id) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.get(ProCartListBean.class,  id);
	}

	@Override
	public ProCartListBean findbyProductSeqNo(int id) throws SQLException {
		Session session = factory.getCurrentSession();
		return null;
	}
	public List<ProCartListBean> findbyaccountProductSeqNo(int productSeqNo,String account) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProCartListBean WHERE account = :account and productSeqNo = :productSeqNo",ProCartListBean.class).setParameter("account", account).setParameter("productSeqNo", productSeqNo).list();
	}

	@Override
	public ProCartListBean findbyPrimaryKey(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
