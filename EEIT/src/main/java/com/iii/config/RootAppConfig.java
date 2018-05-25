package com.iii.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();

//		ds.setUser("sa");
//		ds.setPassword("sa123456");
		ds.setUser("memberuser");
		ds.setPassword("P@ssw0rd1234");
		try {
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		
//		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;DatabaseName=EEITDB");
//		ds.setJdbcUrl("jdbc:sqlserver://dbservereeit10019.database.windows.net;DatabaseName=EEITDB");
		ds.setJdbcUrl("jdbc:sqlserver://dbservereeit10016.database.windows.net;DatabaseName=EEITDB");
		ds.setInitialPoolSize(4);
		ds.setMaxPoolSize(8);
		return ds;
	}
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		System.out.println("sessionFactory... in RootAppConfig");
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[]{"com.iii.*"});
		factory.setHibernateProperties(additionalProperties());
		return factory;
		
	}
	@Bean(name="transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sesseionFactroy) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sesseionFactroy);
		return txManager;
	}
	
	
	
	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect",org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		//properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
//		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
	
	@Bean
	public JavaMailSender mailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		Properties props = new Properties();
		
		props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtps.ssl.checkserveridentity", "true");
	    props.put("mail.smtps.ssl.trust", "*");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");
	    
		mailSender.setJavaMailProperties(props);
        mailSender.setUsername("projectstorageeeit100@gmail.com");//帳號
        mailSender.setPassword("EEITsa123456");//密碼
        return mailSender;
	}
	
}
