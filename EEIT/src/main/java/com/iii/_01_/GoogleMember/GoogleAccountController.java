package com.iii._01_.GoogleMember;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.RegisterService;
import com.iii._01_.Member.service.UpdateService;

@Controller
public class GoogleAccountController {

	@Autowired
	UpdateService updateService;
	
	@Autowired
	RegisterService registerService;
	
	
	@RequestMapping(value = "/googleLogin" ,method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> googleLogin(@RequestParam("ID_Token")String ID_Token ,HttpSession session) throws IOException, SQLException{
		Map<String,Object>map = new HashedMap<String,Object>();
		
		String posturl = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=" + ID_Token;
		
		URL url = new URL(posturl);// 创建连接
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setRequestMethod("GET"); // 设置请求方式

		  int responseCode = connection.getResponseCode();
		
		  System.out.println("\nSending 'GET' request to URL : " + url);
	      System.out.println("Response Code : " + responseCode);
		  
		  
		connection.connect();

		BufferedReader in = new BufferedReader(
                new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        //打印结果
        System.out.println(response.toString());
        
        JSONObject resJSON = new JSONObject(response.toString());
        
//作者：JellyCai
//链接：https://www.jianshu.com/p/0842b888d94a
//來源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
		
        
        if(updateService.getMemberBeanByAccount(resJSON.getString("name"))==null) {
        	
        	MemberBean mb = new MemberBean();
        	
        	mb.setAccount(resJSON.getString("name"));
        	System.out.println(resJSON.getString("name"));
        	
        	mb.setPassword(resJSON.getString("kid"));
        	System.out.println(resJSON.getString("kid"));
        	mb.setPhotoPath(resJSON.getString("picture"));
        	System.out.println(resJSON.getString("picture"));
        	mb.setLastname(resJSON.getString("family_name"));
        	System.out.println(resJSON.getString("family_name"));
        	mb.setFirstname(resJSON.getString("given_name"));
        	System.out.println(resJSON.getString("given_name"));
        	mb.setEmail(resJSON.getString("email"));
        	System.out.println(resJSON.getString("email"));
        	mb.setBan(false);
        	Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
        	mb.setRegisterdate(now);
        	mb.setLastlogin(now);
        	mb.setSubscription(0);
        	registerService.saveMember(mb);
        	
        	session.setAttribute("LoginOK", mb);
        	
        	
        }else {
        	MemberBean mb = updateService.getMemberBeanByAccount(resJSON.getString("name"));
        	Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
        	mb.setLastlogin(now);
        	
        	updateService.updateMemberWithoutPhoto(mb);
        	session.setAttribute("LoginOK", mb);
        	
        }
        
		
		return map;
	}
	
	
	
	
	
}
