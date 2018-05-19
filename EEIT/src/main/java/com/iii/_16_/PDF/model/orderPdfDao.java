package com.iii._16_.PDF.model;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.FAQ.bean.MemberFAQBean;

public interface orderPdfDao {

	orderPdfBean insert(orderPdfBean odpdf) throws SQLException;

	orderPdfBean update(orderPdfBean odpdf) throws SQLException;

	orderPdfBean delete(orderPdfBean odpdf) throws SQLException;

	orderPdfBean findbyPrimaryKey(int orderSeqNo) throws SQLException;

	List<orderPdfBean> getALL() throws SQLException;
}
