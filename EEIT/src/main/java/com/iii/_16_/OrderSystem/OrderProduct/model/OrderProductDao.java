package com.iii._16_.OrderSystem.OrderProduct.model;

import java.sql.SQLException;
import java.util.List;



public interface OrderProductDao {
	OrderProductBean insert(OrderProductBean order) throws SQLException;

	OrderProductBean update(OrderProductBean order) throws SQLException;

	OrderProductBean delete(OrderProductBean order) throws SQLException;

	OrderProductBean findbyPrimaryKey(int order) throws SQLException;
	
	OrderProductBean findbyProductSeqNo(int id) throws SQLException;
	
	List<OrderProductBean> findbyAccount(String account) throws SQLException;
	
	List<OrderProductBean> getALL() throws SQLException;
	
	int insertGetId(OrderProductBean order);

	OrderProductBean findbyCartId(int id) throws SQLException; 
}
