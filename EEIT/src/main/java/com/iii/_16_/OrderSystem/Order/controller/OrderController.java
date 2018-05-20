package com.iii._16_.OrderSystem.Order.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.hibernate.sql.ordering.antlr.OrderByFragmentRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListService;

import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductBean;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.iii._16_.PDF.model.PdfProduceService;
import com.iii._16_.PDF.model.orderPdfBean;
import com.iii._16_.PDF.model.orderPdfService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

import com.iii._16_.StreetName.model.StreetService;
import com.itextpdf.text.DocumentException;

@Controller
public class OrderController {
	@Autowired
	private ProCartListService procartlistservice;
	@Autowired
	private ProductSaleService productsaleservice;
	@Autowired
	private StreetService streetservice;
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
	@ModelAttribute
	public void getOrderBean(Map<String, Object> map) {
		OrderBean order = new OrderBean();
		OrderProductBean orderproduct = new OrderProductBean();
		map.put("orderBean", order);
		map.put("OrderProductBean", orderproduct);

	}

	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String checkOut(Map<String, Object> map, HttpSession session) throws SQLException {
		System.out.println("checkout");

		// 此方法回傳使用者帳號account Ex.bob放入購物車的物品
		MemberBean memberbean = (MemberBean) session.getAttribute("LoginOK");
		String account = memberbean.getAccount();
		map.put("getMemberBean", memberbean);
		// 先將使用者帳號傳回購物車service方法 用帳號找出所有購物明細
		List<ProCartListBean> list = procartlistservice.getByAccountStatus(account);
		for (ProCartListBean bean : list) {

			bean.setProductbean(productsaleservice.getBySeqNo(bean.getProductSeqNo()));
//			System.out.println("從購物車中撈出bob的購買資訊 = " + bean);
		}
		// 將明細放入Map物件中 由jsp el撈出資料
		map.put("cartlist", list);

		// 準備放入縣市 地區的容器;
		List<String> citylist = new ArrayList<>();

		// 撈出所有縣市名
		List<String> d = streetservice.findcity();
		for (String city : d) {
			citylist.add(city);
		}
		map.put("citylist", citylist);

		return "OrderSystem/checkoutpage";
	}

	@RequestMapping(value="confirmOrder" ,method = RequestMethod.POST)
	public String confirmOrder(@ModelAttribute OrderBean ob, HttpSession session, 
			Map<String,Object> map,BindingResult result) throws SQLException {
		 String[] suppressedFields = result.getSuppressedFields();
		 if (suppressedFields.length > 0) {
		 System.out.println("嘗試輸入不允許的欄位");
		 throw new RuntimeException("嘗試輸入不允許的欄位: " +
		 StringUtils.arrayToCommaDelimitedString(suppressedFields));
		 }
		 MemberBean member=(MemberBean)session.getAttribute("LoginOK");
		
		 System.out.println("bad request");

		 /*----------------------訂單確認開始--------------------------------------*/
		 Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		 ob.setOrderTime(ts);
		 ob.setOrderSeqNo(0);
		 //設定訂單未付款的訂單狀態為1
		 ob.setOrderStatus(1);
		 ob.setAccount(member.getAccount());
		 int orderNum =orderservice.insertGetId(ob);	 
		// 先將使用者帳號傳回購物車service方法 用帳號找出所有購物明細
			List<ProCartListBean> list = procartlistservice.getByAccountStatus(member.getAccount());
			List<OrderProductBean> orderproductlist = new ArrayList<>();
			int ProInCarSeqNo = 0;//購物車商品的編號 用來找商品 放入購物車 以便使用
			int decreasePcs = 0;
			Long productTotalPrice=0L;
			Long orderTotalPrice=0L;
			List<Long> proPriceList = new ArrayList<>();
			//取得一個準備加入訂單的商品bean　用seqno搜尋
			for (ProCartListBean productcartlistbean : list) {
				ProInCarSeqNo = productcartlistbean.getProductSeqNo();
				ProductSaleBean ForUpdateProBean= productsaleservice.getBySeqNo(ProInCarSeqNo);
				productcartlistbean.setProductbean(ForUpdateProBean);
				//確認商品金額 計算後寫入訂單table
				//單向商品總價
				Long procount = Long.valueOf(productcartlistbean.getProductCount());
				
				productTotalPrice = procount*productcartlistbean.getProductbean().getProPrice();
				proPriceList.add(productTotalPrice);//準備加總金額
				OrderProductBean confirmbean = new OrderProductBean(productcartlistbean.getProductSeqNo(), productcartlistbean.getProductCount(), productcartlistbean.getProductbean().getProPrice(), member.getAccount(), orderNum, 0);
				confirmbean.setProductTotal(productTotalPrice);
				
				//找到原來的數量扣掉 購物車內的商品數量
				decreasePcs= ForUpdateProBean.getProPcs()-productcartlistbean.getProductCount();
				
				ForUpdateProBean.setProPcs(decreasePcs);
				//更改庫存量
				productsaleservice.update(ForUpdateProBean);
				//新增商品至訂單成立的TAble
				OrderProductBean ordersuccessbean = orderproductservice.insert(confirmbean);
				orderproductlist.add(ordersuccessbean);	
			}
			for(Long totalpricelist: proPriceList) {
				orderTotalPrice=orderTotalPrice+totalpricelist;
			}
			
			OrderBean bill = orderservice.findByorderSeqNo(orderNum);
			bill.setOrderTotalPrice(orderTotalPrice);
			orderservice.update(bill);
			//成立訂單的帳號  將該帳號購物車內所有物品刪除
			if(orderproductlist.size()!=0) {
			procartlistservice.deleteAllByAccount(member.getAccount());
			//訂單新增成功  
			//將購物車中 使用者搜尋過的商品刪除
			}
			/*------------將該訂單丟到網頁生成pdf-----------------------------------*/
			
			
			map.put("readyforpay", bill);
			
			List<OrderProductBean> havaProSeq = orderproductservice.getByorderSeqNo(orderNum);
			List<OrderProductBean> havePro = new ArrayList<>();
			int proSeqNo=0;
			for(OrderProductBean orderprobean:havaProSeq) {
				proSeqNo = orderprobean.getProductSeqNo();
				ProductSaleBean proDetail = productsaleservice.getBySeqNo(proSeqNo);
				orderprobean.setProductBean(proDetail);
				orderproductservice.update(orderprobean);
				havePro.add(orderprobean);
			}
			map.put("readyforpaypro", havePro);
			try {
				pdfservice.imgProduce(servletContext);
				pdfservice.pdfProduce(bill);
			} catch (DocumentException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//取得pdf物件 寫入資料庫
			String orderPdfPath= null;
			String orderPdfName = null;
			orderPdfPath = "c:/resources/OrderPDF/" + bill.getOrderSeqNo()+".pdf";
			orderPdfName = bill.getOrderSeqNo()+".pdf";
			
			orderPdfBean orderpdfbean = new orderPdfBean(0, orderPdfName, orderPdfPath, bill.getOrderSeqNo());
			orderpdfservice.insert(orderpdfbean);
			
			
		 return "OrderSystem/orderSuccess";
	}
	
	@RequestMapping(value = "/odergetcountry", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getCountryName(String city) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> countrylist = new ArrayList<>();
		// 撈出所有地區名
		List<String> d = streetservice.findcountry(city);
		for (String country : d) {
			countrylist.add(country);
		}
		result.put("countrylist", countrylist);
		return result;
	}

	@RequestMapping(value = "/gotoseven", method = RequestMethod.GET)
	public String checkOutToSeven() {
		System.out.println("checkout");

		return "OrderSystem/testtable";
	}
	
	
	
}
