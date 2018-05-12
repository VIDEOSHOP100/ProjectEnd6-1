package com.iii._16_.PersonShop.dao;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.PersonShop.bean.PersonShopBean;







public interface PersonShopDao {
	PersonShopBean insert(PersonShopBean shopbean) throws SQLException;

	PersonShopBean update(PersonShopBean shopbean) throws SQLException;

	PersonShopBean delete(PersonShopBean shopbean) throws SQLException;

	PersonShopBean findbyPrimaryKey(PersonShopBean shopbean) throws SQLException;

	List<PersonShopBean> getALL() throws SQLException;
}
