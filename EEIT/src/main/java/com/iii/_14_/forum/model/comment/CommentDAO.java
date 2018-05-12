package com.iii._14_.forum.model.comment;

import java.util.List;

public interface CommentDAO {
	
	CommentBean insert(CommentBean cb);
	
	CommentBean update(CommentBean cb);
	
	CommentBean delete(CommentBean cb);
	
	CommentBean findByPk(CommentBean cb);
	
	List<CommentBean> getComment();
	
	
}
