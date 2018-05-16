package com.iii._16_.Market.Controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._09_.addproduct.model.ProductBean;
import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

@Controller
public class MarketController {
	@Autowired
	private ProductSaleService productservice;
	@Autowired
	private OrderService orderservice;

	@RequestMapping("/gettestboot")
	public String getProducthot() {

		return "Cart/carticon";
	}


	//進入商城首頁 controller 進入時取得會session attribute 判斷會員是否登入
	//會員有登入會送出isMember的屬性字串
	//進入商城會執行商品service方法 取出所有資料庫中的商品資訊
	//送出productbeans的屬性字串

	@RequestMapping(value = "/goMarketHomePage", method = RequestMethod.GET)
	public String goPersonHomePage(HttpSession session,Map<String, Object> map) throws SQLException {
		List<ProductSaleBean> productlist = productservice.selectAllProduct();
		MemberBean memberbean = (MemberBean) session.getAttribute("LoginOK");
		
		map.put("isMember",memberbean);
		
		map.put("productbeans", productlist);
	
		return "marketIndex/Mindex";
	}
	
	@RequestMapping(value="recept")
	public void getshipment(@RequestParam("rv_name") String name) {
		System.out.println("name = " + name);
		
		
		
	}
}
