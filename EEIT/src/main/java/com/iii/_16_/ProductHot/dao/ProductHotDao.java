package com.iii._16_.ProductHot.dao;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.ProductHot.bean.ProductHotBean;



public interface ProductHotDao {
	ProductHotBean insert(ProductHotBean hotbean) throws SQLException;

	ProductHotBean update(ProductHotBean hotbean) throws SQLException;

	ProductHotBean delete(ProductHotBean hotbean) throws SQLException;

	ProductHotBean findbyPrimaryKey(ProductHotBean hotbean) throws SQLException;

	List<ProductHotBean> getALL() throws SQLException;
}
