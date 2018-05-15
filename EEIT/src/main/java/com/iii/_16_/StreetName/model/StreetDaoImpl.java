package com.iii._16_.StreetName.model;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class StreetDaoImpl implements StreetDao {
	@Autowired	
	SessionFactory factory;
	@Override
	public StreetBean insert(StreetBean sb) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StreetBean update(StreetBean sb) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StreetBean delete(StreetBean sb) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StreetBean findbyPrimaryKey(StreetBean sb) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StreetBean> getALL() throws SQLException {	
		return factory.getCurrentSession()
				.createNativeQuery("select * from streetname")
				.addEntity(StreetBean.class).list();
	}
	
	public List<String> findcity() {
		Session session = factory.getCurrentSession();
		return session.createNativeQuery("select DISTINCT city from streetname order by city").list();
		
	}
	
	public List<String> findcountry(String cityname) {
		Session session = factory.getCurrentSession();
		
		return session.createNativeQuery("select DISTINCT country from streetname where city LIKE :city").setParameter("city", cityname).list();
		
	}
	
	
	

	
	
}
