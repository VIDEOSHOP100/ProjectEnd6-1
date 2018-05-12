package com.iii._19_.messageSystem.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;

public class MessageSystemIntercepter implements HandlerInterceptor {
	@Autowired
	FriendService friendService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(true);
		if (session != null) {
			MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
			if (memberBean != null) {
				String account = memberBean.getAccount();
				List<FriendBean> friendBeanList = friendService.getFriendByOneAccount(account);
				session.setAttribute("friendBeanList", friendBeanList);
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
