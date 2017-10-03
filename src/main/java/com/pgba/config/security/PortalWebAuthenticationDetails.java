/**
 * 
 */
package com.pgba.config.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.authentication.WebAuthenticationDetails;

/**
 * @author xfv3
 * Custom bean for storing additional request header details for Login. 
 */

public class PortalWebAuthenticationDetails extends WebAuthenticationDetails {
	
	private static final long serialVersionUID = 1L;
	
	private String browserInfo;

	public PortalWebAuthenticationDetails(HttpServletRequest request) {
		super(request);
		this.browserInfo = request.getHeader("User-Agent");
	}

	/**
	 * @return the browserInfo
	 */
	public String getBrowserInfo() {
		return browserInfo;
	}

	/**
	 * @param browserInfo the browserInfo to set
	 */
	public void setBrowserInfo(String browserInfo) {
		this.browserInfo = browserInfo;
	}

}
