package com.iii.global.bean.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListService;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
import com.iii._19_.messageFile.model.MessageFileBean;
import com.iii._19_.messageImage.model.MessageImageBean;
import com.iii._19_.messageVideo.model.MessageVideoBean;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	private ProCartListService procartlistservice;
	@Autowired
	private ProductSaleService productsaleservice;
	@ModelAttribute
	public void getAttribute(Map<String,Object> map,HttpSession session) {
		map.put("messageImageBean", new MessageImageBean());
		map.put("messageFileBean", new MessageFileBean());
		map.put("messageVideoBean", new MessageVideoBean());
		MemberBean memberbean = (MemberBean)session.getAttribute("LoginOK");
		if(memberbean != null) {
			
		String account = memberbean.getAccount();
		List<ProCartListBean> list = null;
		try {
			list = procartlistservice.getByAccountStatus(account);
			for(ProCartListBean bean :list) {
				bean.setProductbean(productsaleservice.getBySeqNo(bean.getProductSeqNo()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			map.put("cartDetailList", list);
		}
		
	}
}
