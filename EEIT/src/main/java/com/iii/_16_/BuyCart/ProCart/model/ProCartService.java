package com.iii._16_.BuyCart.ProCart.model;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service
public class ProCartService {
	@Autowired
	private ProCartDaoImpl dao;

	@Transactional
	public ProCartBean insert(ProCartBean bean) throws SQLException {
		ProCartBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	
}
