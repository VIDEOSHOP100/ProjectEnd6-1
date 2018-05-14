package com.iii._09_.questionList.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class QuestionListServiceImpl implements QuestionListService{
	@Autowired
	QuestionListDAO questionListDAO;
	
	@Override
	public Integer saveQuestionList(QuestionListBean questionListBean) {
		return questionListDAO.saveQuestionList(questionListBean);
	}

	@Override
	public void updateQuestionList(QuestionListBean questionListBean) {
		questionListDAO.updateQuestionList(questionListBean);
	}

	@Override
	public void deleteQuestionList(QuestionListBean questionListBean) {
		questionListDAO.deleteQuestionList(questionListBean);
	}

	@Override
	public QuestionListBean selectQuestionListBySeqNo(Integer questionListSeqNo) {
		return questionListDAO.selectQuestionListBySeqNo(questionListSeqNo);
	}

	@Override
	public List<QuestionListBean> selectQuestionList() {
		return questionListDAO.selectQuestionList();
	}

}
