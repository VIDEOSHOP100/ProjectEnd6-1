package com.iii._14_.forum.model.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyDAO replyDAO;
	
	@Override
	public ReplyBean insert(ReplyBean rb) {
		return replyDAO.insert(rb);
	}

	@Override
	public ReplyBean update(ReplyBean rb) {
		return replyDAO.update(rb);
	}

	@Override
	public ReplyBean delete(ReplyBean rb) {
		return replyDAO.delete(rb);
	}

	@Override
	public ReplyBean findByPk(ReplyBean rb) {
		return replyDAO.findByPk(rb);
	}

	@Override
	public List<ReplyBean> getAll() {
		return replyDAO.getAll();
	}

}
