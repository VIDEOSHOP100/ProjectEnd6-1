package com.iii._14_.forum.model.reply;

import java.util.List;

public interface ReplyDAO {
	
	ReplyBean insert(ReplyBean rb);
	
	ReplyBean update(ReplyBean rb);
	
	ReplyBean delete(ReplyBean rb);
	
	ReplyBean findByPk(ReplyBean rb);
	
	List<ReplyBean> getAll();
}
