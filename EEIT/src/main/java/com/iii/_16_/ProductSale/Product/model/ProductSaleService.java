package com.iii._16_.ProductSale.Product.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._16_.PersonShop.bean.PersonShopBean;

@Service
public class ProductSaleService {
	@Autowired
	private ProductSaleDaoImpl dao;
	@Transactional
	public ProductSaleBean insert(ProductSaleBean bean) throws SQLException {
		ProductSaleBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	@Transactional
	public int insertGetId(ProductSaleBean bean) throws SQLException {
		int result = 0;
		if (bean != null) {
		result = dao.insertGetId(bean);
			return result;
		}
		return 0;
	}
	@Transactional
	public ProductSaleBean update(ProductSaleBean bean) throws SQLException {
		return dao.update(bean);
	}
	
	
	//用產品流水號搜尋商品
	@Transactional
	public ProductSaleBean getBySeqNo(int productSeqNo) throws SQLException {
		ProductSaleBean bean = dao.findbyPrimaryKey(productSeqNo);
		return bean;
	}
	//用account搜尋商品
	@Transactional
	public List<ProductSaleBean> getByAccount(String account) throws SQLException{
		List<ProductSaleBean> list = dao.findbyAccount(account);
		return list;
	}
	
	//搜尋所有產品
	@Transactional
	public List<ProductSaleBean> selectAllProduct() throws SQLException{
		return dao.getALL();
	}
	
	//搜尋所有auctionStatus=0的商品
	@Transactional
	public List<ProductSaleBean>  getAllProByStatus(String account,Integer status) throws SQLException{
		return dao.getAllProByStatus(account,status);
	}
	//用productSeqNo搜尋一筆商品(status=0)
	@Transactional
	public ProductSaleBean getOneProBySeqNo(Integer productSeqNo) throws SQLException{
		return dao.getOneProBySeqNo(productSeqNo);
	}
	//用AuctionSeqNo搜尋一筆商品
	@Transactional
	public ProductSaleBean getOneProByAucSeqNo(Integer auctionSeqNo) throws SQLException{
	return dao.getOneProByAucSeqNo(auctionSeqNo);
			}	
	//用productSeqNo搜尋一筆商品(status=1)
	@Transactional
	public ProductSaleBean getOneProBySeqNos1(Integer productSeqNo) throws SQLException{
		return dao.getOneProBySeqNos1(productSeqNo);
	}

	//分類搜尋商品
	@Transactional
	public List<ProductSaleBean> getProByType(Integer productType) throws SQLException{
	return dao.getlistProByType(productType);
	}

	
	//用SeqNo搜尋商品
		@Transactional
		public List<ProductSaleBean> getAllBySeqNo(Integer productSeqNo) throws SQLException{
			List<ProductSaleBean> list = dao.getAllBySeqNo(productSeqNo);
			return list;
		}

}
