package com.iii._16_.BuyCart.ProCartList.model;

import java.sql.SQLException;
import java.util.List;



public interface ProCartListDao {
	ProCartListBean insert(ProCartListBean cartlist) throws SQLException;

	ProCartListBean update(ProCartListBean cartlist) throws SQLException;

	int delete(String account) throws SQLException;

	ProCartListBean findbyPrimaryKey(int id) throws SQLException;
	
	ProCartListBean findbyProductSeqNo(int id) throws SQLException;
	
	List<ProCartListBean> findbyAccount(String account) throws SQLException;
	
	List<ProCartListBean> getALL() throws SQLException;
	
	int insertGetId(ProCartListBean cartlist);

	ProCartListBean findbyCartId(int id) throws SQLException; 
}
