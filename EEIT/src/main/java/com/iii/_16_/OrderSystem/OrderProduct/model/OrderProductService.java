package com.iii._16_.OrderSystem.OrderProduct.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderDaoImpl;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

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
		//用訂單流水號搜尋商品
	@Transactional
	public List<OrderProductBean> getByorderSeqNo(Integer orderSeqNo) throws SQLException {
		 return dao.findbyOrderSeqNo(orderSeqNo);
	}
	// 把product放進去 才能抓到產品詳細資料
		@Transactional
		public int update(OrderProductBean bean) throws SQLException {
			 dao.update(bean);
			 return 1;
		}
}
