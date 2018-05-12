package com.iii._16_.BuyCart.ProCart.model;

import java.sql.SQLException;
import java.util.List;



public interface ProCartDao {
	ProCartBean insert(ProCartBean cartbean) throws SQLException;

	ProCartBean update(ProCartBean cartbean) throws SQLException;

	ProCartBean delete(ProCartBean cartbean) throws SQLException;

	ProCartBean findbyPrimaryKey(int id) throws SQLException;
	
	List<ProCartBean> findbyAccount(String account) throws SQLException;
	
	List<ProCartBean> getALL() throws SQLException;
	
	int insertGetId(ProCartBean cartbean); 
}
