package com.pgba.web;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactUsController {
	static final Logger logger = LogManager.getLogger(ContactUsController.class.getName());


	@RequestMapping(value = {"/contactUs"})
	public String initContactUs() {
		logger.debug("Inside the ContactUsController -> initContactUs()");  
		return "contactUs";
	}
}

