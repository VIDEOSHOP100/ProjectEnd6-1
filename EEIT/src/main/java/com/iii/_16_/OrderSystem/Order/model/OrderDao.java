package com.iii._16_.OrderSystem.Order.model;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;

public interface OrderDao {
	OrderBean insert(OrderBean order) throws SQLException;

	OrderBean update(OrderBean order) throws SQLException;

	OrderBean delete(OrderBean order) throws SQLException;

	OrderBean findbyPrimaryKey(Integer order) throws SQLException;
	
	OrderBean findbyProductSeqNo(Integer id) throws SQLException;
	
	List<OrderBean> findbyAccount(String account) throws SQLException;
	
	List<OrderBean> getALL() throws SQLException;
	
	int insertGetId(OrderBean order);

	OrderBean findbyCartId(Integer id) throws SQLException; 
}
