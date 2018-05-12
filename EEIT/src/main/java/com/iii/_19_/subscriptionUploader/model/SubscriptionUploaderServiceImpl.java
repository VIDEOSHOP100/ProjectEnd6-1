package com.iii._19_.subscriptionUploader.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._01_.Member.bean.MemberBean;

@Service
public class SubscriptionUploaderServiceImpl implements SubscriptionUploaderService {

	@Autowired
	private SubscriptionUploaderDAO subscriptionUploaderDAO;
	
	@Override
	public SubscriptionUploaderBean getSubscriptionUploader(String account, String uploaderAccount) {
		return subscriptionUploaderDAO.getSubscriptionUploader(account, uploaderAccount);
	}

	@Override
	public List<MemberBean> getAllSubscriptionUploader(String account) {
		return subscriptionUploaderDAO.getAllSubscriptionUploader(account);
	}

	@Override
	public Integer saveSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean) {
		return subscriptionUploaderDAO.saveSubscriptionUploader(subscriptionUploaderBean);
	}

	@Override
	public void updateSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean) {
		subscriptionUploaderDAO.updateSubscriptionUploader(subscriptionUploaderBean);
	}

	@Override
	public void deleteSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean) {
		subscriptionUploaderDAO.deleteSubscriptionUploader(subscriptionUploaderBean);
	}
	

}
