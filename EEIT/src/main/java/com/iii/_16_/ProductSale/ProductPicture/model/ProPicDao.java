package com.iii._16_.ProductSale.ProductPicture.model;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;



public interface ProPicDao {
	ProPicBean insert(ProPicBean propicbean) throws SQLException;

	ProPicBean update(ProPicBean propicbean) throws SQLException;

	ProPicBean delete(ProPicBean propicbean) throws SQLException;

	ProPicBean findbyPrimaryKey(ProPicBean propicbean) throws SQLException;

	List<ProPicBean> getALL() throws SQLException;

	List<ProPicBean> findbyProductSeqNo(int productSeqNo) throws SQLException;

	int insertGetId(ProPicBean propicbean);
}
