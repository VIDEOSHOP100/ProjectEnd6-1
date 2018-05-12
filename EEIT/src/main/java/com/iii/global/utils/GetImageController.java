package com.iii.global.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.LoginService;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.PersonShop.service.PersonShopService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
import com.iii._16_.ProductSale.ProductPicture.model.ProPicBean;
import com.iii._16_.ProductSale.ProductPicture.model.ProPicService;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageDAO;

@Controller
public class GetImageController {

	@Autowired
	private VideoManageDAO videoManageDAO;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private PersonShopService personShopService;
	
	@Autowired
	private ProPicService propicservice;
	@Autowired
	ServletContext context;

	@Autowired
	InputLiveStreamTimeService inputLiveStreamTimeService;
	@RequestMapping(value = "/getImage/{dataType}/{pk}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable("dataType") String dataType,
			@PathVariable("pk") String pk) {
		String path = null;
		if (dataType.equals("video")) {
			VideoBean vb = videoManageDAO.getVideo(Integer.parseInt(pk));
			path = vb.getVideoImageFilePath();
		} else if(dataType.equals("member")) {
			MemberBean memberBean = loginService.getMemberByAccount(pk);
			path = memberBean.getPhotoPath();
		}else if(dataType.equals("PersonShop")) {
			PersonShopBean shopBean = new PersonShopBean();
			PersonShopBean RealBean = null;
			shopBean.setPersonShopSeqNo(Integer.parseInt(pk));
			try {
				RealBean = personShopService.getById(shopBean);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			path = RealBean.getPersonShopCoverFilePath();
		}else if(dataType.equals("Product")) {
			try {
				List<ProPicBean> list =propicservice.getbyproductSeqNo(Integer.parseInt(pk));
				for(ProPicBean bean : list) {
					path = bean.getProPicPath();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(dataType.equals("LiveCoverPath")) {
			InputLiveStreamTimeBean inputLiveStreamTimeBean = inputLiveStreamTimeService.getLiveStreamsBySeqNo(Integer.parseInt(pk));
		path =	inputLiveStreamTimeBean.getLiveCoverPath();
		}
		
		HttpHeaders headers = new HttpHeaders();
		int len = 0;
		byte[] media = null;
		InputStream is = null;
		try {
			is = new BufferedInputStream(new FileInputStream(path));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[8192];
		try {
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
		} catch (Exception e) {
			throw new RuntimeException("ProductController的getPicture()發生IOException: " + e.getMessage());
		}
		media = baos.toByteArray();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	@RequestMapping(value = "/getImageTest/{num}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response,@PathVariable String num) {
		String path = null;
		path = "C:\\EEITfinal\\repository\\ProjectOne\\EEIT\\src\\main\\webapp\\WEB-INF\\views\\marketIndex\\images\\"+num+".jpg";
		HttpHeaders headers = new HttpHeaders();
		int len = 0;
		byte[] media = null;
		InputStream is = null;
		try {
			is = new BufferedInputStream(new FileInputStream(path));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[8192];
		try {
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
		} catch (Exception e) {
			throw new RuntimeException("ProductController的getPicture()發生IOException: " + e.getMessage());
		}
		media = baos.toByteArray();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
}
