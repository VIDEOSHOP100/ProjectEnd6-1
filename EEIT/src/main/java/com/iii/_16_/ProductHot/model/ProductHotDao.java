package com.iii._16_.ProductHot.model;

import java.sql.SQLException;
import java.util.List;



public interface ProductHotDao {
	ProductHotBean insert(ProductHotBean hotbean) throws SQLException;

	ProductHotBean update(ProductHotBean hotbean) throws SQLException;

	ProductHotBean delete(ProductHotBean hotbean) throws SQLException;

	ProductHotBean findbyPrimaryKey(int seqno) throws SQLException;

	List<ProductHotBean> getALL() throws SQLException;
}
