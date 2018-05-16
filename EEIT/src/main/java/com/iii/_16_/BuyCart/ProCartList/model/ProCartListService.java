package com.iii._16_.BuyCart.ProCartList.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Member.bean.MemberBean;

@Service
public class ProCartListService {
	@Autowired
	private ProCartListDaoImpl dao;

	@Transactional
	public ProCartListBean insert(ProCartListBean bean) throws SQLException {
		ProCartListBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}

	// 用account搜尋商品
	@Transactional
	public List<ProCartListBean> getByAccount(String account) throws SQLException {
		List<ProCartListBean> list = dao.findbyAccount(account);
		return list;
	}
	
	//用account搜尋商品  而且 商品狀態是1的
	@Transactional
	public List<ProCartListBean> getByAccountStatus(String account) throws SQLException {
		List<ProCartListBean> list = dao.findbyAccount(account);
		List<ProCartListBean> list2  = new ArrayList<>();
		for(ProCartListBean bean : list) {
			if(bean.getProductStatus()==1) {
				list2.add(bean);
			}
		}
		return list2;
	}
	// 用pk搜尋商品
	@Transactional
	public ProCartListBean getByCartId(int id) throws SQLException {
		return dao.findbyCartId(id);
	}

	// 購物車更改數量
	@Transactional
	public int update(ProCartListBean bean) throws SQLException {
		 dao.update(bean);
		 return 1;
	}

	// 找出有買過 比對帳號及產品序號的資料
	@Transactional
	public List<ProCartListBean> selectToUpdate(int proSeqNo, String account) throws SQLException {
		return dao.findbyaccountProductSeqNo(proSeqNo, account);
	}

	// 刪除購物車商品更改狀態 ，
	@Transactional
	public int deleteProductFromCart(ProCartListBean product, MemberBean member) throws SQLException {
		if (product.getAccount().equals(member.getAccount())) {
			dao.update(product);
			return 1;
		}
		return 0;
	}
	//訂單成立 刪除該帳號所有商品
	@Transactional
	public int deleteAllByAccount(String account) throws SQLException {
		return dao.delete(account);
	}
}
