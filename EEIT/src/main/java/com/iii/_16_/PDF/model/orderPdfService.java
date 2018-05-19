package com.iii._16_.PDF.model;


import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class orderPdfService {
	@Autowired
	private orderPdfDaoImpl dao;
	@Transactional
	public List<orderPdfBean> selectPdfFileByOrderSeqNo(int orderSeqNo) throws SQLException {
		return dao.findbyOrderKey(orderSeqNo); 
	}
	@Transactional
	public orderPdfBean insert(orderPdfBean orderpdfbean) throws SQLException {
		return dao.insert(orderpdfbean);
	}
}
