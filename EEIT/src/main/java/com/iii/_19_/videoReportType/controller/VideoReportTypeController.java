package com.iii._19_.videoReportType.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._19_.videoReportType.model.VideoReportTypeService;

@Controller
@RequestMapping("VideoReportType")
public class VideoReportTypeController {

	@Autowired
	VideoReportTypeService videoReportTypeService;
	
	
}
