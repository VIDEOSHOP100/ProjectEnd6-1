package com.iii._09_.QuesList.model;


import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




@Service
public class QuesListService {
	
	@Autowired
	private QuesListDaoImpl dao;
	
	@Transactional
	public QuesListBean insert(QuesListBean bean) throws SQLException {
		QuesListBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	
	
	
//	@Transactional
//	public ProductBean select(ProductBean pro) throws SQLException {
//		ProductBean result = null;
//		result = dao.findbyPrimaryKey(pro);
//		if (result != null) {
//			return result;
//		}
//		return null;
//	}
//	

	
		
}
	


