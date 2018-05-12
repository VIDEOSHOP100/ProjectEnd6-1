package com.iii._19_.videoRoom.model;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class VideoRoomDAOImpl implements VideoRoomDAO {
	@Autowired
	SessionFactory sessionFactory;
}
