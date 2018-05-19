package com.iii.global.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._16_.PDF.model.orderPdfBean;
import com.iii._16_.PDF.model.orderPdfService;

@Controller
public class GetPdfController {
	@Autowired
	orderPdfService orderpdfservice;
	@RequestMapping(value = "/getPdfFile/{dataType}/{pk}", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @PathVariable("dataType") String dataType,
			@PathVariable("pk") String pk) throws IOException, NumberFormatException, SQLException {
		
		String path = null;
		if(dataType.equals("pdf")) {
			List<orderPdfBean> pdfBeanList = orderpdfservice.selectPdfFileByOrderSeqNo(Integer.parseInt(pk));
			for(orderPdfBean pdfBean : pdfBeanList) {
			path = pdfBean.getOrderPdfFilePath();
			}
		}
		File file = null;
		file = new File(path);

		if (!file.exists()) {
			String errorMessage = "Sorry. The file you are looking for does not exist";
			System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
			outputStream.close();
			return;
		}
		
		String mimeType = URLConnection.guessContentTypeFromName(file.getName());
		if (mimeType == null) {
			System.out.println("mimetype is not detectable, will take default");
			mimeType = "application/pdf";
		}
		
		System.out.println("mimetype : " + mimeType);
		response.setContentType(mimeType);
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"" + file.getName() + "\""));
		response.setContentLength((int) file.length());
		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
		FileCopyUtils.copy(inputStream, response.getOutputStream());
	}
}
