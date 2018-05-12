package com.iii._09_.QuesList.model;

import java.sql.SQLException;
import java.util.List;

import com.iii._16_.ProductSale.ProductPicture.model.ProPicBean;



public interface QuesListDao {
		
		QuesListBean insert(QuesListBean qb) throws SQLException;

		QuesListBean update(QuesListBean qb) throws SQLException;
		
		QuesListBean delete(QuesListBean qb) throws SQLException;
		
		QuesListBean findbyPrimaryKey(QuesListBean qb) throws SQLException;
		
		List<QuesListBean> getALL() throws SQLException;
		
		List<QuesListBean> findbyqueSeqNo(int queSeqNo) throws SQLException;
}
