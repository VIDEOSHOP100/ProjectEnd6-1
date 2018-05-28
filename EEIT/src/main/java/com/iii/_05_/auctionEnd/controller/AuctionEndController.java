package com.iii._05_.auctionEnd.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.auctionEnd.model.AuctionEndBean;
import com.iii._05_.auctionEnd.model.AuctionEndService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutALL;
import allPay.payment.integration.domain.InvoiceObj;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class AuctionEndController {

	@Autowired
	AuctionEndService auctionEndService;
	@Autowired
	ProductSaleService ProductSaleService;
	@RequestMapping(value="/AuctionEnd",method=RequestMethod.GET)
	public String getInsertAllLiveStreamList(Map<String, Object> map, HttpSession session) throws SQLException {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<AuctionEndBean> AllAuctionList = auctionEndService.getAuctionEndByAccount(account);
		
		
		map.put("AllAuctionList", AllAuctionList);

		return "AuctionEnd/AuctionEnd";

	}
	
	@RequestMapping(value = "/frontEnd/aioCheckOut/aioCheckOutALL/{account}", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody String aioCheckOutALL(@PathVariable String account,HttpSession session) {
		AllInOne all = new AllInOne("");
		AioCheckOutALL aio = new AioCheckOutALL();
		InvoiceObj invoice = new InvoiceObj();
		// 不指定付款方式，給nulls
		invoice = null;
		// 設定訂單編號，20碼。可自訂
		aio.setMerchantTradeNo(UUID.randomUUID().toString().replace("-", "").substring(0, 20));
		//帳號+取得BEAN
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		account = memberBean.getAccount();
		List<AuctionEndBean> AllAuctionList = auctionEndService.getAuctionEndByAccount(account);
		String proName = "";
		Integer proPrice = 0;
		for(AuctionEndBean ab: AllAuctionList) {
			
			 proName += ab.getProName()+ " "+ ab.getProPrice()+"元 X1"+"#";
			 
			 proPrice += ab.getProPrice();
		
		}
		
		System.out.println(proName);
		System.out.println(proPrice);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        //Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		// 設定交易時間
		aio.setMerchantTradeDate(sdf.format(date));	
		// 商品名稱＋單價＋數量
		aio.setItemName(proName);
		// 交易金額
		aio.setTotalAmount(Integer.toString(proPrice));
		// 交易描述
		aio.setTradeDesc("工三小");
		aio.setHoldTradeAMT("0");
		// 顯示付款成功的頁面（預設
		aio.setReturnURL("https://developers.opay.tw/AioMock/MerchantReturnUrl");
		// 付款成功後轉跳的頁面
		// aio.setClientBackURL("http://localhost:8080/EEIT/");
		aio.setClientBackURL("https://eeitdemo10009.southeastasia.cloudapp.azure.com:8443/EEIT");
		try {
			String html = all.aioCheckOut(aio, invoice);
			System.out.println(html);
			return html;
		} catch (AllPayException e) {
			throw new Error(e.getNewExceptionMessage());
		}
	}
	
}
