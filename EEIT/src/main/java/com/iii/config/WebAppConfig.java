package com.iii.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.iii._01_.Member.interceptor.LoginInterceptor;
import com.iii._19_.messageSystem.intercepter.MessageSystemIntercepter;
import com.iii._19_.notificationRecording.intercepter.NotificationRecordingIntercepter;


@Configuration
@EnableWebMvc
@ComponentScan("com.iii")
public class WebAppConfig extends WebMvcConfigurerAdapter {
	
	@Bean
	NotificationRecordingIntercepter notificationRecordingIntercepter() {
         return new NotificationRecordingIntercepter();
    }
	
	@Bean
	MessageSystemIntercepter messageSystemIntercepter() {
         return new MessageSystemIntercepter();
    }

	@Bean
	LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	registry.addInterceptor(loginInterceptor())
    	.excludePathPatterns("/","/loginPage","/*","/getImage/**","/getImageTest/**","/getVideo/**","/videoRoom/*","/videoType/*","/LiveStream/*","/memberReport/*","/liveStreamReport/*","/adviceReport/*","/goMarketHomePage/**","/search/**","/messageSystem/**","/target/message/subscription/**","/endPoint/**","/Register/*","/searchProductIntro/*","/profile/**","/uploaderHomePage/**","/MemberCenter/forgotPassword");
        registry.addInterceptor(notificationRecordingIntercepter());
        registry.addInterceptor(messageSystemIntercepter());
    }
	
	
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(819200000000000000L);
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/global/css/");
//		registry.addResourceHandler("/image/**").addResourceLocations("/WEB-INF/views/images/");
		registry.addResourceHandler("/global/**").addResourceLocations("/WEB-INF/views/global/");
		registry.addResourceHandler("/videoManage/**").addResourceLocations("/WEB-INF/views/videoManage/");
		registry.addResourceHandler("/videoRoomdeco/**").addResourceLocations("/WEB-INF/views/videoRoom/");
		registry.addResourceHandler("/watchHistorydeco/**").addResourceLocations("/WEB-INF/views/watchHistory/");
 		registry.addResourceHandler("/marketIndex/**").addResourceLocations("/WEB-INF/views/marketIndex/");
 		registry.addResourceHandler("/videoType/**").addResourceLocations("/WEB-INF/views/videoType/");
 		registry.addResourceHandler("/uploaderHomePage/**").addResourceLocations("/WEB-INF/views/uploaderHomePage/");
 		registry.addResourceHandler("/hotVideo/**").addResourceLocations("/WEB-INF/views/hotVideo/");
 		registry.addResourceHandler("/newVideo/**").addResourceLocations("/WEB-INF/views/newVideo/");
 		registry.addResourceHandler("/watchLaterVideo/**").addResourceLocations("/WEB-INF/views/watchLaterVideo/");
 		registry.addResourceHandler("/likeUnlikeVideos/**").addResourceLocations("/WEB-INF/views/likeUnlikeVideos/");
 		registry.addResourceHandler("/subscriptionUploaderdeco/**").addResourceLocations("/WEB-INF/views/subscriptionUploader/");
 		registry.addResourceHandler("/messageSystem/**").addResourceLocations("/WEB-INF/views/messageSystem/");
 		registry.addResourceHandler("/MemberCenter/**").addResourceLocations("/WEB-INF/views/MemberCenter/");
 		registry.addResourceHandler("/InsertLiveStream/**").addResourceLocations("/WEB-INF/views/InsertLiveStream/");
 		registry.addResourceHandler("/LiveStreamRoom/**").addResourceLocations("/WEB-INF/views/LiveStreamRoom/");
		registry.addResourceHandler("/Cart/**").addResourceLocations("/WEB-INF/views/Cart/");
		registry.addResourceHandler("/backstage/**").addResourceLocations("/WEB-INF/views/backstage/");
		registry.addResourceHandler("/OrderSystem/**").addResourceLocations("/WEB-INF/views/OrderSystem/");
		registry.addResourceHandler("/likeUnlikeVideos/**").addResourceLocations("/WEB-INF/views/likeUnlikeVideos/");
		registry.addResourceHandler("/Product/**").addResourceLocations("/WEB-INF/views/Product/");
		registry.addResourceHandler("/videoChat/**").addResourceLocations("/WEB-INF/views/videoChat/");
		registry.addResourceHandler("/search/**").addResourceLocations("/WEB-INF/views/search/");
		registry.addResourceHandler("/AuctionEnd/**").addResourceLocations("/WEB-INF/views/AuctionEnd/");
		
		
		//		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/marketIndex/css/");
//		registry.addResourceHandler("/global/vendor/bootstrap/css/**").addResourceLocations("/WEB-INF/views/global/vendor/bootstrap/css/");

	}

}
