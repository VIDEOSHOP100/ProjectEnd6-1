package com.iii._16_.ProductSale.TransportType.model;

import java.sql.SQLException;
import java.util.List;



public interface TransportTypeDao {
	TransportTypeBean insert(TransportTypeBean ship) throws SQLException;

	TransportTypeBean update(TransportTypeBean ship) throws SQLException;

	TransportTypeBean delete(TransportTypeBean ship) throws SQLException;

	TransportTypeBean findbyPrimaryKey(int shipNum) throws SQLException;

	List<TransportTypeBean> getALL() throws SQLException;
}
