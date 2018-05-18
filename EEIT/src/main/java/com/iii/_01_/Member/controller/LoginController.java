package com.iii._01_.Member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.LoginService;
import com.iii._19_.notificationRecording.model.NotificationRecordingService;

//@SessionAttributes("LoginOK")
@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	FriendService friendService;

	@Autowired
	NotificationRecordingService notificationRecordingService;

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("LoginOK");
		session.removeAttribute("target");

		return "redirect:" + "/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("MemberBean") MemberBean mb, BindingResult result, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);
		Map<String, String> errorMessageMap = new HashMap<String, String>();
		session.setAttribute("ErrorMessageKey", errorMessageMap);
		MemberBean bean = loginService.checkIDPassword(mb.getAccount(), mb.getPassword());
		if (bean != null) {
			bean = loginService.updateLastLogin(bean);
			session.setAttribute("LoginOK", bean);
			String account = bean.getAccount();
			List<FriendBean> friendBeanList = friendService.getFriendByOneAccount(account);
			session.setAttribute("friendBeanList", friendBeanList);
			// List<NotificationRecordingBean> notificationRecordingBeanList =
			// notificationRecordingService.getNotificationRecordingByReceiverAccount(account);
			// session.setAttribute("notificationRecordingBeanList",
			// notificationRecordingBeanList);
			if (target.equals("/loginPage") || target.equals("/")) {
				return "redirect:/";
			}
		} else {
			errorMessageMap.put("error", "帳號或密碼錯誤!");
		}
		return "redirect:" + target;
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public Map<String, Boolean> loginCheck(HttpServletRequest request) {

		Map<String, Boolean> map = new HashMap<String, Boolean>();

		HttpSession session = request.getSession();

		if (session.getAttribute("LoginOK") != null) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}

		return map;
	}

	@RequestMapping("/loginPage")
	public String loginPage() {

		return "MemberCenter/loginPage";

	}

	@RequestMapping("/checkBotAccPwd")
	public @ResponseBody Map<String, Object> checkBotAccPwd(@RequestParam("logAcc") String logAcc,
			@RequestParam("logPwd") String logPwd, @RequestParam("botCheckResp") String botCheckResp)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		String secretKey = "6LeoQVkUAAAAAE7lZhGVwo9-azsy0sI-yFTLLPk9";
		String posturl = "https://www.google.com/recaptcha/api/siteverify";

		JSONObject json = new JSONObject();
		json.put("response", botCheckResp);
		json.put("secret", secretKey);

		System.out.println(json.toString());

		// ---------------------------------

		URL url = new URL(posturl);// 创建连接
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setDoOutput(true);
		connection.setDoInput(true);
		connection.setUseCaches(false);
		connection.setInstanceFollowRedirects(true);
		connection.setRequestMethod("POST"); // 设置请求方式
		connection.setRequestProperty("Accept", "application/json"); // 设置接收数据的格式
		connection.setRequestProperty("contentType", "application/json"); // 设置发送数据的格式
		connection.setRequestProperty("Charset", "UTF-8");
		connection.connect();

		String jsonData = json.toString();

		Boolean botResult = false;

		OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); // utf-8编码

		out.write(new String(jsonData.getBytes("UTF-8")));

		out.flush();
		out.close();
		// 读取响应
		int length = (int) connection.getContentLength();// 获取长度
		InputStream is = connection.getInputStream();
		if (length != -1) {
			byte[] data = new byte[length];
			byte[] temp = new byte[512];
			int readLen = 0;
			int destPos = 0;
			while ((readLen = is.read(temp)) > 0) {
				System.arraycopy(temp, 0, data, destPos, readLen);
				destPos += readLen;
			}
			String result = new String(data, "UTF-8"); // utf-8编码
			System.out.println(result);

			JSONObject resJSON = new JSONObject(result);
			botResult = (Boolean) resJSON.get("success");

		}

		map.put("botCheck", botResult);

		// ----------------------------------
		if (loginService.checkIDPassword(logAcc, logPwd) != null) {
			map.put("loginCheck", true);
		} else {
			map.put("loginCheck", false);
		}
		;

		return map;
	}

}
