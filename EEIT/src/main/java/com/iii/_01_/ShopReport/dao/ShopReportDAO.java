package com.iii._01_.ShopReport.dao;

import java.util.List;

import com.iii._01_.ShopReport.bean.ShopReportBean;

public interface ShopReportDAO {

	ShopReportBean getShopReportBeanByShopReportSeqNo(Integer ShopReportSeqNo);
	
	List<ShopReportBean> getAllShopReportBean();
	
	void saveShopReportBean(ShopReportBean ShopReportBean);
	
	void updateShopReportBean(ShopReportBean ShopReportBean);
	
	void deleteShopReportBean(Integer ShopReportSeqNo);
	
	
}
