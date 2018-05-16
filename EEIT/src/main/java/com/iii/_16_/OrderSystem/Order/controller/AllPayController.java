//package com.iii._16_.OrderSystem.Order.controller;
//
//import java.sql.SQLException;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.iii._01_.Member.bean.MemberBean;
//import com.iii._16_.OrderSystem.Order.model.OrderBean;
//import com.iii._16_.OrderSystem.Order.model.OrderService;
//
//import allPay.payment.integration.AllInOne;
//import allPay.payment.integration.domain.AioCheckOutALL;
//import allPay.payment.integration.domain.InvoiceObj;
//
//
//
//
//
//@Controller
//@RequestMapping("/allpay")
//public class AllPayController {
//	@Autowired
//	private OrderService orderservice;
//	@RequestMapping(value="/checkout",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
//	public @ResponseBody String checkOutAllPay(HttpSession session) throws SQLException {
//		
//		System.out.println("allapy");
//		MemberBean member = (MemberBean) session.getAttribute("LoginOK");
//		String account = member.getAccount();
//		AllInOne all = new AllInOne("");
//		AioCheckOutALL chkall = new AioCheckOutALL();
//		InvoiceObj invoice = new InvoiceObj();
//		//不指定付款方式 用null
//		invoice=null;
//		//設定訂單編號
//		
//		List<OrderBean> orderlist = orderservice.findByAccountForPay(account, 1);
//		
//		return null;
//	}
//}
