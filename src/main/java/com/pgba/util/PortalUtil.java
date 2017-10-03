package com.pgba.util;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.pgba.bean.PortalUser;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.DeviceType;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import eu.bitwalker.useragentutils.Version;
import net.minidev.json.JSONObject;

@Component
@Configuration
@PropertySource("classpath:services.properties")
public class PortalUtil {
	
	
	private static final Logger logger = LogManager.getLogger(PortalUtil.class.getName());
	
	public ObjectWriter jsonWriter = new ObjectMapper().writer().withDefaultPrettyPrinter();
	
	@Autowired
	Environment env;
	
	public static String getBrowserDeatils(String userAgentValue){
		String browserName="";
		if(userAgentValue!=null){
			UserAgent userAgent = UserAgent.parseUserAgentString(userAgentValue);
			if(userAgent!=null){
				Browser browser = userAgent.getBrowser();
				browserName=browser.getName();
				OperatingSystem os= userAgent.getOperatingSystem();
				Version browserVersion =  userAgent.getBrowserVersion();
	
				if(browserVersion!=null){
					String browsermjV = browserVersion.getMajorVersion();
					String browsermnV = browserVersion.getMinorVersion();
					if(!org.springframework.util.StringUtils.isEmpty(browsermjV)){
						browserName=browserName+" "+browsermjV;
					}
					if(!org.springframework.util.StringUtils.isEmpty(browsermnV)){
						browserName=browserName+" "+browsermnV;
					}
					
				 DeviceType deviceType=os.getDeviceType();
				 String deviceName ="";
				 if(deviceType!=null){
					 deviceName = deviceType.getName();
				 }
				 
				 String osName="";
				 if(os!=null){
					  osName=os.getName();
					 
				 }
				  
				 
				 if(!StringUtils.isEmpty(osName)){
					 browserName=browserName+" "+osName;
				 }
				 if(!StringUtils.isEmpty(deviceName)){
					 browserName=browserName+" "+deviceName;
				 }
				}
			}	
		}
		logger.debug("browserName-->"+browserName);
		return browserName;
	}
		
		/**
	     * 
	     * @return
	     */
	public String setError(String exception, int statusCode){
		String json = "";
	    JSONObject requestJsonObj = new JSONObject();
	 	ObjectWriter ow = new ObjectMapper().writer();
	 	try {
	 		requestJsonObj.put("statusCode", statusCode);
	 		requestJsonObj.put("status", "ERROR");
	 		requestJsonObj.put("error", exception);
	 		json = ow.writeValueAsString(requestJsonObj);
		} catch (JsonProcessingException e) {
			logger.error(e);
	    	logger.error("Error in Sending Message : \n" +  ExceptionUtils.getStackTrace(e));
		}	 		
	 	return json;
	}
	    
	    
	    /**
		 * @param leadingUnmasketChars
		 * @param trailingUnmasketChars
		 * @param input
		 * @return
		 */
		public String maskEmail(String input) {
		    String output = "";
		    if(StringUtils.isNotEmpty(input)) {
		    	String regex = "^(.{" + 1 + "})(.*)(.{" + 1 + "})(@)";
			    Matcher m = Pattern.compile(regex).matcher(input);

			    if (m.find()) {
			        String stringToReplace = m.group(2);
			        char[] chars = new char[stringToReplace.length()];
			        Arrays.fill(chars, '*');
			        String replacement = new String(chars);
			        output = input.replaceAll(stringToReplace, replacement);
			    }
		    }
		    return output;
		}
		
		/**
		 * @param mobileNumber
		 * @return
		 */
		public String maskMobileNumber(String mobileNumber){
			
			if(StringUtils.isNotEmpty(mobileNumber)) {
				String regex = "(?:\\d{3})-(?:\\d{3})-(\\d{4})";
				
				Matcher m = Pattern.compile(regex).matcher(mobileNumber);
				if (m.find()) {
			        String first = mobileNumber.substring(0, 3);
			        String second = mobileNumber.substring(4, 7);
			        char[] chars = new char[first.length()];
			        Arrays.fill(chars, '*');
			        String replacement = new String(chars);
			        mobileNumber = mobileNumber.replaceFirst(first, replacement);
			        mobileNumber = mobileNumber.replaceFirst(second, replacement);
			    } else {
			    	mobileNumber = "***-***-****";
			    }
			} else {
				mobileNumber = "No mobile number on file.";
			}
			
			return mobileNumber;
	    }
		
		
		public void modifyUserAttrs(PortalUser rrbUser) {
			
			UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
			
			authToken = new UsernamePasswordAuthenticationToken(rrbUser, authToken.getCredentials(), null);
			
			SecurityContextHolder.getContext().setAuthentication(authToken);
			
		}
		
		/**
		 * Utility method that logsout the user 
		 */
		public void logoutUser() {
			SecurityContextHolder.clearContext();
		}
		
		public ResponseEntity<String> getResponseEntity(String requestJson,String serviceName) {
			try {
		    	RestTemplate restTemplate = new RestTemplate();

		    	HttpHeaders requestHeaders = new HttpHeaders();
		    	requestHeaders.setContentType(new MediaType("application","json"));
		    		
		    	HttpEntity<String> requestEntity = new HttpEntity<String>(requestJson,requestHeaders);
		    		
		    	restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		    		
		    	ResponseEntity<String> response = restTemplate.exchange(env.getProperty("demoportal.service.url")+serviceName,
		    			HttpMethod.POST,requestEntity, String.class);
		    		
		    	return response;
		    }
		    catch(Exception e) {
		    	logger.error(" Error in processing PortalUtil.getResponseEntity " + requestJson + " - " + ExceptionUtils.getStackTrace(e));
		    	return null;
		    }
		}
}
