package com.iii._16_.ProductSale.PayType.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class PayTypeService {
	@Autowired
	private PayTypeDaoImpl dao;
		@Transactional
		public PayTypeBean findbyPrimaryKey(Integer SeqNo) throws SQLException {
			 return dao.findbyPrimaryKey(SeqNo);
		}
}
