package com.iii._01_.GoogleMember;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
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
		
        String account = resJSON.getString("email").substring(0,resJSON.getString("email").lastIndexOf("@"));
        if(updateService.getMemberBeanByAccount(account)==null) {
        	
        	MemberBean mb = new MemberBean();
        	mb.setAccount(account);
        	
        	mb.setPassword(resJSON.getString("kid"));
        	System.out.println(resJSON.getString("kid"));
        	
        	String photoPath = resJSON.getString("picture");
        	System.out.println(photoPath);
//        	--------------------------------url下載圖片----------------------------------
        	
        	File file = new File("C:" + File.separator + "resources" + File.separator + "images" + File.separator + "members" +  File.separator + account +  File.separator + "photo" +  File.separator);
        	
        	if(!file.exists()) {
        		file.mkdirs();
        	}
        	
        	String fileName_https = downloadImageFromUrl(photoPath,"C:" + File.separator + "resources" + File.separator + "images" + File.separator + "members" +  File.separator + account +  File.separator + "photo" +  File.separator , account);
        	
        	
        	
        	System.out.println(fileName_https);
        	
        	

        	
//        	---------------------------------------------------------------------------
        	mb.setPhotoPath(fileName_https);
        	System.out.println(resJSON.getString("picture"));
        	
        	
        	
//        	mb.setLastname(resJSON.getString("family_name"));
//        	System.out.println(resJSON.getString("family_name"));
//        	mb.setFirstname(resJSON.getString("given_name"));
//        	System.out.println(resJSON.getString("given_name"));
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
        	MemberBean mb = updateService.getMemberBeanByAccount(account);
        	Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
        	mb.setLastlogin(now);
        	
        	updateService.updateMemberWithoutPhoto(mb);
        	session.setAttribute("LoginOK", mb);
        	
        }
        
		
		return map;
	}
	
	public static HttpURLConnection getHttpURLConnectionFromHttps(String url) {
		HttpURLConnection httpUrlConnection = null;
		//建立一個信認所有憑證的X509TrustManager，放到TrustManager裡面
		TrustManager[] trustAllCerts;
		try {
			// Activate the new trust manager
			trustAllCerts = new TrustManager[] { new X509TrustManager() {

				public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {					// TODO Auto-generated method stub
					//不作任何事
				}

				public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {					// TODO Auto-generated method stub
					//不作任何事
				}

				public X509Certificate[] getAcceptedIssuers() {
					//不作任何事
					return null;
				}

			} };

			//設置SSL設定
			SSLContext sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, trustAllCerts, new java.security.SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());

			//跟HTTP一樣，用Url建立連線
			httpUrlConnection = (HttpURLConnection) (new URL(url)).openConnection();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return httpUrlConnection;
	}
	
	
	
	
	
	
	public static String downloadImageFromUrl(String url, String fileDirectoryPath, String fileNameWithoutFormat) {
		String filePath = null;
		
		BufferedInputStream in = null;
		ByteArrayOutputStream out = null;
		HttpURLConnection httpUrlConnection = null;
		FileOutputStream file = null;

		try {
			
			if (url.startsWith("https://")) {
				//HTTPS時
				httpUrlConnection = getHttpURLConnectionFromHttps(url);
			}
			//如果不是HTTPS或是沒成功得到httpUrlConnection，用HTTP的方法
			if(httpUrlConnection == null) {
				httpUrlConnection = (HttpURLConnection) (new URL(url)).openConnection();
			}
			
			// 設置User-Agent，偽裝成一般瀏覽器，不然有些伺服器會擋掉機器程式請求
			httpUrlConnection.setRequestProperty("User-Agent",
					"Mozilla/5.0 (Linux; Android 4.2.1; Nexus 7 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166  Safari/535.19");
			httpUrlConnection.connect();

			String imageType;
			if (httpUrlConnection.getResponseCode() == 200) {
				//成功取得response，
				//取得contentType
				String contentType = httpUrlConnection.getHeaderField("Content-Type");
				// 只處理image的回應
				if ("image".equals(contentType.substring(0, contentType.indexOf("/")))) {
					//得到對方Server提供的圖片副檔名，如jpg, png等
					imageType = contentType.substring(contentType.indexOf("/") + 1);

					if (imageType != null && !"".equals(imageType)) {
						//由HttpUrlConnection取得輸入串流
						in = new BufferedInputStream(httpUrlConnection.getInputStream());
						out = new ByteArrayOutputStream();

						//建立串流Buffer
						byte[] buffer = new byte[1024];

						file = new FileOutputStream(new File(fileDirectoryPath + File.separator + fileNameWithoutFormat + "." + imageType));

						int readByte;
						while ((readByte = in.read(buffer)) != -1) {
							//輸出檔案
							out.write(buffer, 0, readByte);
						}						

						byte[] response = out.toByteArray();
						file.write(response);						

						//下載成功後，返回檔案路徑
						filePath = fileDirectoryPath + File.separator + fileNameWithoutFormat + "." + imageType;
					}
				}

			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//關閉各種串流
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
				if (httpUrlConnection != null) {
					httpUrlConnection.disconnect();
				}
				if (file != null) {
					file.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return filePath;
	}
	
	
	
	
	
	
}
