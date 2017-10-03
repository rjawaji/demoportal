package com.pgba.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TermsOfUseController {

	static final Logger logger = LogManager.getLogger(TermsOfUseController.class.getName());


	@RequestMapping("/termsOfUse")
	public String termsOfUse() {
		logger.debug("Inside the TermsOfUseController -> termsOfUse()");  
		return "termsOfUse";
	}
	
}
