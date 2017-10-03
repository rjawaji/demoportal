package com.pgba.service;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import com.pgba.dao.LoginValidationService;

@Component
public class LoginValidationServiceImpl implements LoginValidationService{

	private static Logger logger = LogManager.getLogger(LoginValidationServiceImpl.class);
	
	/*@Autowired
	PortalUtil portalUtil;
	*/
	@Override
	public String loginTransaction(String request) {
		try {
			//ResponseEntity<String> response = portalUtil.getResponseEntity(request, "login");
			
			
		}
		catch(Exception e) {
			logger.error(" Error in processing LoginValidationServiceImpl. loginTransaction " + request + " - " + ExceptionUtils.getStackTrace(e));
		}
		return null;
	}

}
