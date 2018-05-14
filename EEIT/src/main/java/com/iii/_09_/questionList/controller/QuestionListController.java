package com.iii._09_.questionList.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._09_.questionList.model.QuestionListBean;
import com.iii._09_.questionList.model.QuestionListService;


@Controller
@RequestMapping("QuestionList")
public class QuestionListController {
	
	@Autowired
	QuestionListService questionListService;
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveQuestionList(@ModelAttribute("questionListBean") QuestionListBean questionListBean,Map<String,Object> map) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		questionListBean.setQuestionListUploadDate(now);
		questionListBean.setQuestionListStatus("1");
		questionListService.saveQuestionList(questionListBean);
		map.put("allQuestionList", questionListService.selectQuestionList());
		return "questionList/questionList";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String updateQuestionList(QuestionListBean questionListBean) {
		questionListService.updateQuestionList(questionListBean);
		return "OK";
	}

	@RequestMapping(value = "{questionListSeqNo}",method = RequestMethod.DELETE)
	public String deleteQuestionList(@PathVariable("questionListSeqNo") Integer questionListSeqNo) {
		QuestionListBean questionListBean = questionListService.selectQuestionListBySeqNo(questionListSeqNo);
		questionListService.deleteQuestionList(questionListBean);
		return "OK";
	}

	@RequestMapping(value = "{questionListSeqNo}",method = RequestMethod.GET)
	public String selectQuestionListBySeqNo(@PathVariable("questionListSeqNo") Integer questionListSeqNo) {
		QuestionListBean questionListBean = questionListService.selectQuestionListBySeqNo(questionListSeqNo);
		
		return "OK";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String selectQuestionList(Map<String, Object> map) {
		List<QuestionListBean> questionListBeanList = questionListService.selectQuestionList();
		map.put("questionListBean", new QuestionListBean());
		return "questionList/addQuestionList";
	}
}
