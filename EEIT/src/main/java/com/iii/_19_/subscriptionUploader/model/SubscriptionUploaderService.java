package com.iii._19_.subscriptionUploader.model;

import java.util.List;

import com.iii._01_.Member.bean.MemberBean;

public interface SubscriptionUploaderService {
	
	public SubscriptionUploaderBean getSubscriptionUploader(String account, String uploaderAccount);
	
	public List<MemberBean> getAllSubscriptionUploader(String account);
	
	public Integer saveSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean);
	
	public void updateSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean);
	
	public void deleteSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean);
	
	public List<MemberBean> getSubscriptionUploaderByPageNo(String account, Integer pageNo);
}
