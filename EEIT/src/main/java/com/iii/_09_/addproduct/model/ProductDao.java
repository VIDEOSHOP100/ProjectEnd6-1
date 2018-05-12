package com.iii._09_.addproduct.model;

import java.sql.SQLException;



public interface ProductDao {
	
	ProductBean insert(ProductBean prd) throws SQLException;

	ProductBean update(ProductBean prd) throws SQLException;
	
	ProductBean delete(ProductBean prd) throws SQLException;
	
	ProductBean findbyPrimaryKey(ProductBean prd) throws SQLException;
	

}
