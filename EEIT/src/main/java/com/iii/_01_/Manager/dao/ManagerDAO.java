package com.iii._01_.Manager.dao;

import java.sql.SQLException;
import java.util.List;

import com.iii._01_.Manager.bean.ManagerBean;

public interface ManagerDAO {
	ManagerBean getManagerById(String ManagerId);
	
	List<ManagerBean> getAllManager();

	ManagerBean saveMember(ManagerBean bean) throws SQLException;

	void deleteManager(String ManagerId);

	void updateManager(ManagerBean bean) throws SQLException;
	
	

}
