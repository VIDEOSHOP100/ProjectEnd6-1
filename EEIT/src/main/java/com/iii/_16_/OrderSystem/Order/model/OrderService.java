package com.iii._16_.OrderSystem.Order.model;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListDaoImpl;

@Service
public class OrderService {
	@Autowired
	private OrderDaoImpl dao;
	@Transactional
	public OrderBean insert(OrderBean bean) throws SQLException {
		OrderBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
}
