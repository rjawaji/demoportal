/**
 * 
 */
package com.pgba.config.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.CsrfException;
import org.springframework.stereotype.Component;

import com.pgba.bean.PortalUser;
import com.pgba.util.PortalUtil;

/**
 * @author xfv3
 *
 */
@Component("portalAccessDeniedHandler")
public class PortalAccessDeniedHandler implements AccessDeniedHandler {

	Logger logger = LogManager.getLogger(PortalAccessDeniedHandler.class);
	
	@Autowired
	private PortalUtil portalUtil; 
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String redirectUri = request.getContextPath() + "/login";
		
		boolean exceptionOccurs = false;
		
		if(accessDeniedException instanceof CsrfException) {
			request.getSession().setAttribute("accessException", "Invalid/Missing CSRF Token.");
			exceptionOccurs = true;
		}
		
		if(!exceptionOccurs) {
			if(auth != null) {
				PortalUser portalUser = (PortalUser) auth.getPrincipal();
			}
		}
		portalUtil.logoutUser();
		response.sendRedirect(redirectUri);
	}

	
	
}
