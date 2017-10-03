package com.pgba.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemRequirementsController {

	static final Logger logger = LogManager.getLogger(SystemRequirementsController.class.getName());


	@RequestMapping("/footerLink/systemRequirements")
	public String systemRequirements() {
		logger.debug("Inside the TermsOfUseController -> termsOfUse()");  
		return "systemRequirements";
	}
	
}
