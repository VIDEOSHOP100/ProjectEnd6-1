package com.iii._16_.OrderSystem.OrderProduct.model;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderDaoImpl;

@Service
public class OrderProductService {
	@Autowired
	private OrderProductDaoImpl dao;
	@Transactional
	public OrderProductBean insert(OrderProductBean bean) throws SQLException {
		OrderProductBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
}
