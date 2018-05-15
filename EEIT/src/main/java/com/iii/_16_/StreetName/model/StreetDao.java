package com.iii._16_.StreetName.model;

import java.sql.SQLException;
import java.util.List;



public interface StreetDao {
	StreetBean insert(StreetBean sb) throws SQLException;

	StreetBean update(StreetBean sb) throws SQLException;

	StreetBean delete(StreetBean sb) throws SQLException;

	StreetBean findbyPrimaryKey(StreetBean sb) throws SQLException;

	List<StreetBean> getALL() throws SQLException;
}
