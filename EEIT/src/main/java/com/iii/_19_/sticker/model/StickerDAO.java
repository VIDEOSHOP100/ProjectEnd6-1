package com.iii._19_.sticker.model;

import java.util.List;

public interface StickerDAO {
	public List<StickerBean> getAllSticker();

	public StickerBean getStickerBySeqNo(Integer stickerSeqNo);

	public int saveSticker(StickerBean stickerBean);

	public void updateSticker(StickerBean stickerBean);

	public void deleteSticker(StickerBean stickerBean);
}
