package com.iii.global.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.messageFile.model.MessageFileBean;
import com.iii._19_.messageFile.model.MessageFileService;
import com.iii._19_.messageImage.model.MessageImageBean;
import com.iii._19_.messageImage.model.MessageImageService;

@Controller
public class GetFileController {
	@Autowired
	MessageFileService messageFileService;
	@Autowired
	MessageImageService messageImageService;
	
	@RequestMapping(value = "/getFile/{dataType}/{pk}", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @PathVariable("dataType") String dataType,
			@PathVariable("pk") String pk) throws IOException {
		String path = null;
		if(dataType.equalsIgnoreCase("messageFile")) {
			MessageFileBean messageFileBean = messageFileService.selectMessageFileBySeqNo(Integer.parseInt(pk));
			path = messageFileBean.getMessageFilePath();
		}else if(dataType.equalsIgnoreCase("messageImage")) {
			MessageImageBean messageImageBean = messageImageService.selectMessageImageBySeqNo(Integer.parseInt(pk));
			path = messageImageBean.getMessageImageFilePath();
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
			mimeType = "application/octet-stream";
		}

		System.out.println("mimetype : " + mimeType);
		response.setContentType(mimeType);
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"" + file.getName() + "\""));
		response.setContentLength((int) file.length());
		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
		FileCopyUtils.copy(inputStream, response.getOutputStream());
	}
}
