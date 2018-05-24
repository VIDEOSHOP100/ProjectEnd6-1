package com.iii._16_.ProductSale.Product.model;

import java.sql.SQLException;
import java.util.List;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;

public interface ProductSaleDao {
	ProductSaleBean insert(ProductSaleBean pdb) throws SQLException;

	ProductSaleBean update(ProductSaleBean pdb) throws SQLException;

	ProductSaleBean delete(ProductSaleBean pdb) throws SQLException;

	ProductSaleBean findbyPrimaryKey(int id) throws SQLException;
	
	List<ProductSaleBean> findbyAccount(String account) throws SQLException;
	
	List<ProductSaleBean> getALL() throws SQLException;
	
	int insertGetId(ProductSaleBean pdb); 
	
	public List<ProductSaleBean> getAllProByStatus(String account,Integer status);
	
	ProductSaleBean getOneProBySeqNo(Integer ProductSeqNo);
	
	ProductSaleBean  getOneProByAucSeqNo(Integer auctionSeqNo);
	
	ProductSaleBean getOneProBySeqNos1(Integer ProductSeqNo);
	
	List<ProductSaleBean> getAllBySeqNo(Integer ProductSeqNo);
}
