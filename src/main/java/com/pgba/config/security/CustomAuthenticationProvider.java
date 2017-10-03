/**
 * 
 */
package com.pgba.config.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pgba.bean.PortalUser;
import com.pgba.bean.common.GlobalConstants;
import com.pgba.dao.LoginValidationService;

import net.minidev.json.JSONObject;

/**
 * @author xfv3
 *
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private static Logger logger = LogManager.getLogger(CustomAuthenticationProvider.class);
	
	@Autowired
	private LoginValidationService loginValidationService;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String userId = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		if(StringUtils.isEmpty(userId) && StringUtils.isEmpty(password)) {
			throw new BadCredentialsException("Username and Password cannot be empty.");
		}
		
		if(StringUtils.isEmpty(userId)) {
			throw new BadCredentialsException("Username cannot be empty.");
		}
		
		if(StringUtils.isEmpty(password)) {
			throw new BadCredentialsException("Password cannot be empty.");
		}
		
		PortalWebAuthenticationDetails details = (PortalWebAuthenticationDetails) authentication.getDetails();
		
		JSONObject requestObj = new JSONObject();
		requestObj.put("userId", userId);
		requestObj.put("password", password);
		requestObj.put("type", "LoginValidate");
		requestObj.put("ipAddress", details.getRemoteAddress());
		requestObj.put("browserInfo", details.getBrowserInfo());
		requestObj.put("appName","RRBPortal");
		
		String jsonResponse = loginValidationService.loginTransaction(requestObj.toString());
		
		UsernamePasswordAuthenticationToken responseAuth = null;
		
		if(!StringUtils.isEmpty(jsonResponse)) {
			try {
				ObjectMapper mapper = new ObjectMapper();
				JSONObject jsonResponseObj = mapper.readValue(jsonResponse, JSONObject.class);
				if(jsonResponseObj != null){
					String statusDesc = (String)jsonResponseObj.get("status");
					if(statusDesc!=null && statusDesc.equals(GlobalConstants.ERROR_RESPONSE)){
						int statusCode = (int) jsonResponseObj.get("statusCode");
						String errorMsg = (String) jsonResponseObj.get("error");
						if(statusCode == GlobalConstants.USER_NOT_FOUND || statusCode == GlobalConstants.USER_NOT_IN_LDAP ||
								statusCode == GlobalConstants.INVALID_PASSWORD) {
							errorMsg = GlobalConstants.ERROR_MESSAGES.get(statusCode);
						}
						
						throw new BadCredentialsException(errorMsg);
					}else if(statusDesc!=null && statusDesc.equals(GlobalConstants.SUCCESS_RESPONSE)){
						
						JSONObject loginResponseObj = mapper.readValue(JSONObject.toJSONString((Map<String, ? extends Object>) jsonResponseObj.get("loginValidationResponse")), JSONObject.class);
						
						List<String> permissions = (List<String>) loginResponseObj.get("authorities");
						
						PortalUser portalUser = new PortalUser(userId, password, retrieveGrantedAuthorities(permissions));
						
						portalUser.setFirstName(loginResponseObj.getAsString("firstName"));
						portalUser.setLastName(loginResponseObj.getAsString("lastName"));
						
						portalUser.setEmailId(loginResponseObj.getAsString("emailId"));
						
						responseAuth = new UsernamePasswordAuthenticationToken(portalUser, password, null);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
				logger.error("#### Exception while parsing the response from RRB Services #### \n "+ExceptionUtils.getStackTrace(e));
				throw new AuthenticationServiceException(GlobalConstants.ERROR_MESSAGES.get(GlobalConstants.EXCEPTION_ERROR));
			}
		} else {
			logger.error("#### Exception in CustomAuthenticationProvider.authenticate() method #### \n Received null response from RRB Services.");
			throw new AuthenticationServiceException(GlobalConstants.ERROR_MESSAGES.get(GlobalConstants.EXCEPTION_ERROR));
		}
		
		if(responseAuth == null) {
			throw new AuthenticationServiceException(GlobalConstants.ERROR_MESSAGES.get(GlobalConstants.EXCEPTION_ERROR));
		}
		
		return responseAuth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	/**
	 * @param userRole
	 * @return List<GrantedAuthority>
	 * This method returns a list of permissions by user role.
	 */
	public List<GrantedAuthority> retrieveGrantedAuthorities(List<String> permissions) {
		List<GrantedAuthority> grantedAuths = new ArrayList<>();
		for(String permission : permissions) {
			grantedAuths.add(new SimpleGrantedAuthority("ROLE_"+permission));
		}
		return grantedAuths;
	}

}
