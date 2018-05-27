package com.iii.global.error.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.iii._01_.Member.bean.MemberBean;

//@ControllerAdvice
public class ErrorController {
//	@ModelAttribute("MemberBean")
//	public void getMemberBean(Map<String,Object> map) {
//		System.out.println("MemberBean here");
//		map.put("MemberBean", new MemberBean());
//	}
//	
//    @ExceptionHandler(value = NullPointerException.class)
//    public String handleNullPointerException(Exception e, Map<String,Object> map) {
//    	map.put("MemberBean", new MemberBean());
//        System.out.println("A null pointer exception ocurred " + e);
//
//        return "error/error";
//    }
//
//
//    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
//    @ExceptionHandler(value = {Exception.class, RuntimeException.class})
//    public String handleAllException(Exception e, Map<String,Object> map) {
//    	map.put("MemberBean", new MemberBean());
//        System.out.println("A unknow Exception Ocurred: " + e);
//
//        return "error/error";
//    }
//
//
//    @ExceptionHandler(ResourceNotFoundException.class)
//    @ResponseStatus(HttpStatus.NOT_FOUND)
//    public String handleResourceNotFoundException(Map<String,Object> map) {
//    	map.put("MemberBean", new MemberBean());
//        return "error/error";
//    }
}
