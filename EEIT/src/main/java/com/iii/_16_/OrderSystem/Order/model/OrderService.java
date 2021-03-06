package com.iii._16_.OrderSystem.Order.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;



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
	@Transactional
	public int insertGetId(OrderBean bean) throws SQLException {
		int result = 0;
		if (bean != null) {
		result = dao.insertGetId(bean);
			return result;
		}
		return 0;
	}
	@Transactional
	public List<OrderBean> findByAccountForPay(String account , Integer orderstatus) throws SQLException{
		return dao.findbyAccountReadyPay(account, orderstatus);
	}
	@Transactional
	public OrderBean findByorderSeqNo(Integer orderSeqNo) throws SQLException{
		return dao.findbyPrimaryKey(orderSeqNo);
	}
	
	
	// 訂單計算總金額
	@Transactional
	public int update(OrderBean bean) throws SQLException {
		 dao.update(bean);
		 return 1;
	}
	//訂單管理使用
	@Transactional
	public List<OrderBean> findAllByAccount(String account) throws SQLException{
		return dao.findAllbyAccount(account);
	}
}
