package com.iii._01_.ProductReport.dao;

import java.util.List;

import com.iii._01_.ProductReport.bean.ProductReportBean;

public interface ProductReportDAO {

	ProductReportBean getProductReportBeanByProductReportSeqNo(Integer ProductReportSeqNo);
	
	List<ProductReportBean> getAllProductReportBean();
	
	void saveProductReportBean(ProductReportBean ProductReportBean);
	
	void updateProductReportBean(ProductReportBean ProductReportBean);
	
	void deleteProductReportBean(Integer ProductReportSeqNo);
	
	
}
