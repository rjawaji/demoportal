package com.pgba.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pgba.bean.PortalUser;

@Controller
public class LoginController {

	private static final Logger logger = LogManager.getLogger(LoginController.class.getName());
	
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		logger.debug("LoginController.initBinder METHOD started.");
	}

	@RequestMapping(value = "/login")
	public String initLogin(HttpServletRequest request, Model model,
			 RedirectAttributes redirectAttributes, @AuthenticationPrincipal PortalUser portalUser) {
    	logger.debug("#### Displaying custom login form ####");
    	
 	
    	//Access denied exception
    	String error = (String) request.getSession().getAttribute("accessException");
    	request.getSession().removeAttribute("accessException");
    	
    	if(StringUtils.isNotEmpty(error)) {
    		model.addAttribute("error", error);
    	}
    	logger.debug("");
    	return "login";
    }
	
	@RequestMapping(value = "/authenticationFailure")
	public String auhtenticationFailure(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) {
		logger.debug("### Login failure handler started ###"); 
		try {
			logger.debug("Received session id "+request.getSession().getId());
			Exception authException = (Exception) request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
			if(authException != null) {
				redirectAttributes.addFlashAttribute("error", authException.getMessage());
			}
		} catch(Exception e) {
			logger.error("LoginController.authenticationFailure() \n "+ExceptionUtils.getStackTrace(e));
		}
		return "redirect:/login";
	}
	
	
	@RequestMapping(value = "/authenticationSuccess")
	public String authenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, @AuthenticationPrincipal PortalUser portalUser, RedirectAttributes redirectAttributes) {
		logger.debug("### Login success handler started ###");
		try {
			
			/*
			//Redirect user to My Profile screen if profile is not verified yet.
			if(!rrbUser.isProfileVerified()) {
				redirectAttributes.addFlashAttribute("profileVerified",  "Your account information has been successfully updated. Please go to your email account and click the link in the email to verify your profile. Once you verify your profile you may login.");
				return "redirect:/initMyProfile";
			}
			
			//If password has expired, redirect user to change password screen.
			//Here mfa verified is set to false only after successful update of password.
			Date now = new Date();
			if(rrbUser.getPwdExpDt().before(now)) {
				rrbUser.setMfaVerified(false);
				//rrbUtil.modifyUserAttrs(rrbUser);
				return "redirect:/changePassword";
			}*/
		} catch(Exception e) {
			logger.error("LoginController.authenticationSuccess() \n "+ExceptionUtils.getStackTrace(e));
		}
		return "redirect:/";
	}
	
}
