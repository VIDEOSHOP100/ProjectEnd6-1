package com.iii._19_.notificationRecording.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.notificationRecording.model.NotificationRecordingBean;
import com.iii._19_.notificationRecording.model.NotificationRecordingDAO;

//@Controller
public class NotificationRecordingIntercepter implements HandlerInterceptor{
	@Autowired 
	NotificationRecordingDAO notificationRecordingDAO;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle");
		HttpSession session = request.getSession(true);
		if(session != null) {
			
			MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
			if(memberBean != null) {
				
			String account = memberBean.getAccount();

			List<NotificationRecordingBean> notificationRecordingBeanList = notificationRecordingDAO
					.getNotificationRecordingByReceiverAccount(account);
			session.setAttribute("notificationRecordingBeanList", notificationRecordingBeanList);
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
