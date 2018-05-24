package com.iii._16_.Market.Controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._09_.addproduct.model.ProductBean;
import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.ProductHot.model.ProductHotBean;
import com.iii._16_.ProductHot.model.ProductHotService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

@Controller
@RequestMapping("/goMarketHomePage")
public class MarketController {
	@Autowired
	private ProductSaleService productservice;
	@Autowired
	private OrderService orderservice;
	@Autowired
	private ProductHotService hotproservice;
	@Autowired 	
	InputLiveStreamTimeService InputLiveStreamTimeService;
	//進入商城首頁 controller 進入時取得會session attribute 判斷會員是否登入
	//會員有登入會送出isMember的屬性字串
	//進入商城會執行商品service方法 取出所有資料庫中的商品資訊
	//送出productbeans的屬性字串

	@RequestMapping(method = RequestMethod.GET)
	public String goPersonHomePage(HttpSession session,Map<String, Object> map) throws SQLException {
		List<ProductSaleBean> productlist = productservice.selectAllProduct();
		MemberBean memberbean = (MemberBean) session.getAttribute("LoginOK");
		List<InputLiveStreamTimeBean> AllLiveStreamList = InputLiveStreamTimeService.getAllLiveStreams();
		List<ProductHotBean> hotbeanlist = hotproservice.getALL();
		map.put("AllLiveStream", AllLiveStreamList);
		map.put("isMember",memberbean);
		map.put("productbeans", productlist);
		map.put("ProductHotBeans", hotbeanlist);
		return "marketIndex/Mindex";
	}
	@RequestMapping(value="recept")
	public void getshipment(@RequestParam("rv_name") String name) {
		System.out.println("name = " + name);	
	}
	
	
	@RequestMapping(value="/selectProByType/{buttonType}", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> showProductByType(@PathVariable("buttonType") Integer type) throws SQLException {
		System.out.println(type);
		Map<String, Object> result = new HashMap<String, Object>();
		List<ProductSaleBean> list = productservice.getProByType(type);
		result.put("productByType", list);
		return result;	
	}

	
}

