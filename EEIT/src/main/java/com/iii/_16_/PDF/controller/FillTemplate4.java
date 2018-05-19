package com.iii._16_.PDF.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iii._16_.PDF.model.User;
import com.iii.view.ExcelUserListReportView;
import com.iii.view.PdfUserListReportView;

@Controller
@RequestMapping(value="/te")
public class ReportController {
	@RequestMapping(value="/report", method=RequestMethod.GET)
	public ModelAndView userListReport(HttpServletRequest req, HttpServletResponse res) {
		
		String typeReport = req.getParameter("type");
		
		//create data
		List<User> list  = new ArrayList<User>();
		User user = new User();
		list.add(new User(1,"username 1","First name 1","Last name 1"));
		list.add(new User(2,"username 2","First name 2","Last name 2"));
		list.add(new User(3,"username 3","First name 3","Last name 3"));
		list.add(new User(4,"username 4","First name 4","Last name 4"));
		list.add(new User(5,"username 4","First name 4","Last name 4"));
		
		if(typeReport !=  null&& typeReport.equals("xls")) {
			return new ModelAndView(new ExcelUserListReportView(),"userList",list);
		}else if(typeReport !=  null&& typeReport.equals("pdf")) {
			return new ModelAndView(new PdfUserListReportView(),"userList",list);
		}
				
		//default
		return new ModelAndView("userListReport","userList",list);
	}
}
