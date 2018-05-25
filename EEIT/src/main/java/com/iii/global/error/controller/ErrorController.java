package com.iii.global.error.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ErrorController {
	@ExceptionHandler(value = {Exception.class,RuntimeException.class})
	public ModelAndView handleError(HttpServletRequest request, Exception exception) {
		System.out.println("1231156156561515156151155615");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error");
		return mv;
	}
}
