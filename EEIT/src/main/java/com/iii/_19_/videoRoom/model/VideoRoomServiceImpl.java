package com.iii._19_.videoRoom.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class VideoRoomServiceImpl implements VideoRoomService {
	@Autowired
	VideoRoomDAO VideoRoomDAO;
	

}
