package com.iii._16_.ProductHot.model;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;



public interface ProductHotDao {
	ProductHotBean insert(ProductHotBean hotbean) throws SQLException;

	ProductHotBean update(ProductHotBean hotbean) throws SQLException;

	ProductHotBean delete(ProductHotBean hotbean) throws SQLException;

	ProductHotBean findbyPrimaryKey(int seqno) throws SQLException;

	List<ProductHotBean> getALL() throws SQLException;
	
	List<ProductHotBean> getAllByStatus(Integer ProductSeqNo);
}
