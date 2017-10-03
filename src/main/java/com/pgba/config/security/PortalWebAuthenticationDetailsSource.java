/**
 * 
 */
package com.pgba.config.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AuthenticationDetailsSource;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

/**
 * @author xfv3
 * Custom authentication details source for spring security.
 */
@Component("portalWebAuthenticationDetailsSource")
public class PortalWebAuthenticationDetailsSource implements AuthenticationDetailsSource<HttpServletRequest, WebAuthenticationDetails> {

	private String browserInfo;
	
	@Override
	public WebAuthenticationDetails buildDetails(HttpServletRequest context) {
		return new PortalWebAuthenticationDetails(context);
	}
	
	/**
	 * @param browserInfo the browserInfo to set
	 */
	public void setBrowserInfo(String browserInfo) {
		this.browserInfo = browserInfo;
	}

	/**
	 * @return the browserInfo
	 */
	public String getBrowserInfo() {
		return browserInfo;
	}

}