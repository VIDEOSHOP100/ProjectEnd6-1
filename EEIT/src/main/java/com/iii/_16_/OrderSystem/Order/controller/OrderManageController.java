package com.iii._16_.OrderSystem.Order.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.iii._16_.PDF.model.PdfProduceService;
import com.iii._16_.PDF.model.orderPdfService;

@Controller
@RequestMapping("/orderManage")
public class OrderManageController {
	@Autowired
	private OrderService orderservice;
	@Autowired
	private OrderProductService orderproductservice;
	@Autowired
	private PdfProduceService pdfservice;
	@Autowired
	private orderPdfService orderpdfservice;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(method=RequestMethod.GET)
	public String myOrder() {
		return "OrderSysem/myOrderManage";
	}
	
}
