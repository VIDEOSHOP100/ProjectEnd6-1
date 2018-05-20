package com.iii._16_.ProductSale.PayType.model;

import java.sql.SQLException;
import java.util.List;




public interface PayTypeDao {
	PayTypeBean insert(PayTypeBean pay) throws SQLException;

	PayTypeBean update(PayTypeBean pay) throws SQLException;

	PayTypeBean delete(PayTypeBean pay) throws SQLException;

	PayTypeBean findbyPrimaryKey(int payNum) throws SQLException;

	List<PayTypeBean> getALL() throws SQLException;

}
