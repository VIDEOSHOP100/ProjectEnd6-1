package com.iii._01_.Member.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
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

	// @RequestMapping("/checkAccPwd")
	@RequestMapping("/checkBotAccPwd")
	public @ResponseBody Map<String, Object> checkBotAccPwd(@RequestParam("logAcc") String logAcc,
			@RequestParam("logPwd") String logPwd, @RequestParam("botCheckResp") String botCheckResp)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		String secretKey = "6LeoQVkUAAAAAE7lZhGVwo9-azsy0sI-yFTLLPk9";
		String posturl = "https://www.google.com/recaptcha/api/siteverify";
		// String posturl = "https://www.google.com/";

		// JSONObject json = new JSONObject();
		// json.put("response", botCheckResp);
		// json.put("secret", secretKey);

		// System.out.println(json.toString());

		String req = "secret=" + secretKey + "&response=" + botCheckResp;

		// ---------------------------------

		URL url = new URL(posturl);// 创建连接
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setDoOutput(true);
		System.out.println("connection.getDoOutput()" + connection.getDoOutput());
		connection.setDoInput(true);
		System.out.println("connection.getDoInput()" + connection.getDoInput());
		connection.setUseCaches(false);
		System.out.println("connection.getUseCaches()" + connection.getUseCaches());

		connection.setInstanceFollowRedirects(true);
		System.out.println("connection.getInstanceFollowRedirects()" + connection.getInstanceFollowRedirects());
		connection.setRequestMethod("POST"); // 设置请求方式
		System.out.println("connection.getRequestMethod()" + connection.getRequestMethod());
		// connection.setRequestMethod("GET"); // 设置请求方式
		// connection.setRequestProperty("Accept", "application/json"); // 设置接收数据的格式
		connection.setRequestProperty("contentType", "application/json"); // 设置发送数据的格式
		connection.setRequestProperty("harset", "UTF-8");
		connection.connect();

		//
		//
		//
		// String jsonData = json.toString();
		// System.out.println(jsonData);
		Boolean botResult = false;

		DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
		wr.writeBytes(req);
		wr.flush();
		wr.close();

		// 读取响应
		int responseCode = connection.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// 打印结果
		System.out.println(response.toString());

		JSONObject resJSON = new JSONObject(response.toString());
		botResult = (Boolean) resJSON.get("success");

		map.put("botCheck", botResult);
		//
		// ----------------------------------
		if (loginService.checkIDPassword(logAcc, logPwd) != null) {
			map.put("loginCheck", true);
		} else {
			map.put("loginCheck", false);
		}

		return map;
	}

}
