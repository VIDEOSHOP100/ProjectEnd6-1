package com.iii._09_.questionList.model;

import java.util.List;



public interface QuestionListService {

	public Integer saveQuestionList(QuestionListBean questionListBean);
	
	public void updateQuestionList(QuestionListBean questionListBean);
	
	public void deleteQuestionList(QuestionListBean questionListBean);
	
	public QuestionListBean selectQuestionListBySeqNo(Integer questionListSeqNo);
	
	public List<QuestionListBean> selectQuestionList();
	
	public List<QuestionListBean> getAllQuestionListBean();

	//顯示Type編號
	public List<QuestionListBean> selectQuestionListByType(Integer questionListType);

	public QuestionListBean getquestionListBeanByquestionListSeqNo(Integer questionListSeqNo); 

}
