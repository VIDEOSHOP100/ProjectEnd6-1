package com.iii._14_.forum.model.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDAO commentDAO;
	
	@Override
	public CommentBean insert(CommentBean cb) {
		return commentDAO.insert(cb);
	}

	@Override
	public CommentBean update(CommentBean cb) {
		return commentDAO.update(cb);
	}

	@Override
	public CommentBean delete(CommentBean cb) {
		return commentDAO.delete(cb);
	}

	@Override
	public CommentBean findByPk(CommentBean cb) {
		return commentDAO.findByPk(cb);
	}

	@Override
	public List<CommentBean> getComment() {
		return commentDAO.getComment();
	}

}
