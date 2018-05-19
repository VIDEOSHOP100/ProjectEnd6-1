package com.iii._16_.ProductSale.Product.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.PersonShop.bean.PersonShopBean;
@Repository
public class ProductSaleDaoImpl implements ProductSaleDao {
	@Autowired	
	SessionFactory factory;
	@Override
	public ProductSaleBean insert(ProductSaleBean pdb) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(pdb);
		return pdb;
	}
	@Override
	public int insertGetId(ProductSaleBean pdb) {
		Session session = factory.getCurrentSession();
		session.save(pdb);
		int id = pdb.getProductSeqNo();
		return id;
	}
	@Override
	public ProductSaleBean update(ProductSaleBean pdb) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(pdb);
		return pdb;
	}

	@Override
	public ProductSaleBean delete(ProductSaleBean pdb) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductSaleBean findbyPrimaryKey(int productSeqNo) throws SQLException {
		Session session = factory.getCurrentSession();
		ProductSaleBean bean = session.get(ProductSaleBean.class, productSeqNo);
		return bean;
	}

	@Override
	public List<ProductSaleBean> getALL() throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean",ProductSaleBean.class).list();
	}
	@Override
	public List<ProductSaleBean> findbyAccount(String account) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE account = :account",ProductSaleBean.class).setParameter("account", account).list();
	}
	
	
	public List<ProductSaleBean> findbyAuctionNo(String auctionSeqNo) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE auctionSeqNo = :auctionSeqNo",ProductSaleBean.class).setParameter("auctionSeqNo", auctionSeqNo).list();
	}
	@Override
	public List<ProductSaleBean> getAllProByStatus(String account,Integer status) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE account = :account AND auctionStatus = :status",ProductSaleBean.class).setParameter("account", account).setParameter("status", status).list();
	}
	@Override
	public ProductSaleBean getOneProBySeqNo(Integer productSeqNo) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE productSeqNo = :productSeqNo AND auctionStatus = '0'",ProductSaleBean.class).setParameter("productSeqNo", productSeqNo).uniqueResult();
	}
	@Override
	public ProductSaleBean getOneProByAucSeqNo(Integer auctionSeqNo) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE auctionSeqNo = :auctionSeqNo AND auctionStatus = '1'",ProductSaleBean.class).setParameter("auctionSeqNo", auctionSeqNo).uniqueResult();
	}
	@Override
	public ProductSaleBean getOneProBySeqNos1(Integer productSeqNo) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE productSeqNo = :productSeqNo AND auctionStatus = '1'",ProductSaleBean.class).setParameter("productSeqNo", productSeqNo).uniqueResult();
	}
	@Override
	public List<ProductSaleBean> getAllBySeqNo(Integer productSeqNo) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE productSeqNo = :productSeqNo",ProductSaleBean.class).setParameter("productSeqNo", productSeqNo).list();
	}
	
	public List<ProductSaleBean> getlistProByType(Integer proCategorySeqNo) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE proCategorySeqNo = :proCategorySeqNo",ProductSaleBean.class).setParameter("proCategorySeqNo", proCategorySeqNo).list();
	}
	

}
