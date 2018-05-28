package com.iii._09_.questionList.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._09_.questionList.model.QuestionListBean;
import com.iii._09_.questionList.model.QuestionListService;
import com.iii._16_.ProductHot.model.ProductHotBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;


@Controller
@RequestMapping("QuestionList")
public class QuestionListController {
	
	@Autowired
	QuestionListService questionListService;
	
	//新增
	@RequestMapping(method = RequestMethod.POST)
	public String saveQuestionList(@ModelAttribute("questionListBean") QuestionListBean questionListBean,Map<String,Object> map) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		questionListBean.setQuestionListUploadDate(now);
		questionListBean.setQuestionListStatus("1");
		questionListService.saveQuestionList(questionListBean);
		map.put("allQuestionList", questionListService.selectQuestionList());
		return "questionList/questionList";
	}

	
	
		@RequestMapping(value="/questBean.do",method = RequestMethod.POST)
		public @ResponseBody Map<String,Object> insertHotProduct(
				@ModelAttribute("questionListBean") QuestionListBean QusetBean,BindingResult result,HttpSession session) throws SQLException {
			 Map<String,Object> map= new HashMap<String,Object>();
			 String[] suppressedFields = result.getSuppressedFields();
			 if (suppressedFields.length > 0) {
			 System.out.println("嘗試輸入不允許的欄位");
			 throw new RuntimeException("嘗試輸入不允許的欄位: " +
			 StringUtils.arrayToCommaDelimitedString(suppressedFields));
			 }
			 
			return map ;
		}
	
	//新刪修
	@RequestMapping(value = "update" ,method = RequestMethod.POST)
	public @ResponseBody Map<String,String> updateQuestionList(@ModelAttribute("questionListBean") QuestionListBean questionListBean) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		questionListBean.setQuestionListUploadDate(now);
		questionListService.updateQuestionList(questionListBean);
		System.out.println(questionListBean);
		Map<String,String> map= new HashMap<String,String>();
		map.put("Status", "OK");
		return map;
	}

//	@RequestMapping(value = "{questionListSeqNo}",method = RequestMethod.DELETE)
//	public String deleteQuestionList(@PathVariable("questionListSeqNo") Integer questionListSeqNo) {
//		QuestionListBean questionListBean = questionListService.selectQuestionListBySeqNo(questionListSeqNo);
//		questionListService.deleteQuestionList(questionListBean);
//		return "OK";
//	}

//	@RequestMapping(value = "{questionListSeqNo}",method = RequestMethod.GET)
//	public String selectQuestionListBySeqNo(@PathVariable("questionListSeqNo") Integer questionListSeqNo) {
//		QuestionListBean questionListBean = questionListService.selectQuestionListBySeqNo(questionListSeqNo);
//		
//		return "OK";
//	}

	
	//依questionListType尋找問題
	@RequestMapping(value = "{questionListType}",method = RequestMethod.GET)
	public String selectQuestionListByType(@PathVariable("questionListType") Integer questionListType,Map<String, Object> map) {
		
		List<QuestionListBean> questionListBean = questionListService.selectQuestionListByType(questionListType);
		map.put("QuestionList", questionListBean);
		
		return "questionList/questionList";
	}
	
//	//新增問題路徑
//	@RequestMapping(value = "123",method = RequestMethod.GET)
//	public String selectQuestionList(Map<String, Object> map) {
//		List<QuestionListBean> questionListBeanList = questionListService.selectQuestionList();
//		map.put("questionListBean", new QuestionListBean());
//		return "questionList/addQuestionList";
//	}
	
//	//抓全部問題(目前棄用)
//	@RequestMapping(method = RequestMethod.GET)
//	public String selectQuestionList(Map<String, Object> map) {
//		List<QuestionListBean> questionListBeanList = questionListService.selectQuestionList();
//		map.put("questionListBean", questionListBeanList);
//		return "questionList/questionMain";
//	} 
//	
	//顯示在TOP.jsp的常見問題
	@RequestMapping(value="/Main",method = RequestMethod.GET)
	public String QuestionList(@ModelAttribute("questionListBean") QuestionListBean questionListBean,Map<String, Object> map) {
		questionListService.saveQuestionList(questionListBean);
		map.put("allQuestionList", questionListService.selectQuestionList());
		return "questionList/questionList";
	} 
	
//	@RequestMapping(value="/Main/{questionListType}",method = RequestMethod.GET)
//	public String ChoseQuestionList(@ModelAttribute("questionListBean") QuestionListBean questionListBean,Map<String, Object> map) {
//		questionListService.saveQuestionList(questionListBean);
//		map.put("allQuestionList", questionListService.selectQuestionList());
//		return "questionList/questionList";
//	}
	
	@RequestMapping(value = "/getAllQuestionList" ,method = RequestMethod.GET)
	public @ResponseBody List<QuestionListBean> getAllQuestionList() {
		List<QuestionListBean> questionListBeanList = questionListService.getAllQuestionListBean();
		return questionListBeanList;
	}
	
	//新增
	@RequestMapping(value = "/addQuestionList" ,method = RequestMethod.GET)
	public String getQuesListBean(Map<String,Object> map,HttpSession session) {	
		System.out.println("new");
		QuestionListBean questionListBean = new QuestionListBean();
		map.put("questionListBean", questionListBean);

		return "questionList/addQuestionList";
	}
	
	//修改
	@RequestMapping(value = "/updateQuestionList" ,method = RequestMethod.GET)
	public String updateQuesListBean(Map<String,Object> map,HttpSession session) {	
		System.out.println("UPDATE");
		QuestionListBean questionListBean = new QuestionListBean();	
		map.put("questionListBean", questionListBean);
		return "questionList/updateQuestionList";
	}
	
	@RequestMapping(value = "/updateQuestionList/{questionListSeqNo}", method = RequestMethod.GET)
	public @ResponseBody QuestionListBean getQuestionList(
			@PathVariable("questionListSeqNo") Integer questionListSeqNo) {
		return questionListService.getquestionListBeanByquestionListSeqNo(questionListSeqNo);
	}
		
	
	

	
	//刪除標單連結
//	@REQUESTMAPPING("/DELETEQUSETIONLIST")
//	PUBLIC STRING DELETEQUSETIONLIST() {
//		SYSTEM.OUT.PRINTLN("DELETEQUSETIONLIST");
//		RETURN "QUESTIONLIST/DELETEQUSETIONLIST";
//	}
//	
//	@REQUESTMAPPING("/ADDQUESTIONLIST")
//	PUBLIC STRING ADDQUSETIONLIST() {
//		SYSTEM.OUT.PRINTLN("ADDQUESTIONLIST");
//		RETURN "QUESTIONLIST/ADDQUESTIONLIST";
//	}
//	

}
