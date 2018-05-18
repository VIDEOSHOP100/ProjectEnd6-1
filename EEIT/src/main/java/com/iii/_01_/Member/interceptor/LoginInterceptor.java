package com.iii._01_.Member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.iii._01_.Member.bean.MemberBean;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			HttpSession session = request.getSession();
			MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

			if (mb != null) {
				return true;
			} else {
				response.sendRedirect(request.getContextPath() + "/loginPage");
				
				return false;
			}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
