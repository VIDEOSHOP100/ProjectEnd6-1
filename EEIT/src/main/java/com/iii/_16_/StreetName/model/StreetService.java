package com.iii._16_.StreetName.model;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StreetService {
	@Autowired
	private StreetDaoImpl dao;
	@Transactional
	public List<String> findcity(){
		return dao.findcity();
	}
	@Transactional
	public List<StreetBean> findAll() throws SQLException{
		return dao.getALL();
	}
	@Transactional
	public List<String> findcountry(String cityname){
		return dao.findcountry(cityname);
	}
	
}
