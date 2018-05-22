package com.iii._09_.questionList.model;

import java.util.List;

public interface QuestionListDAO {

	public Integer saveQuestionList(QuestionListBean questionListBean);
	
	public void updateQuestionList(QuestionListBean questionListBean);
	
	public void deleteQuestionList(QuestionListBean questionListBean);
	
	public QuestionListBean selectQuestionListBySeqNo(Integer questionListSeqNo);
	
	public List<QuestionListBean> selectQuestionList();
	
	public List<QuestionListBean> getAllQuestionListBean();
	
	
}
