package com.pgba.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgba.bean.common.Error;
import com.pgba.bean.common.GlobalConstants;
import com.pgba.exception.RestServiceException;

@ControllerAdvice
public class ApplicationWideExceptionHandler {

	
	@ExceptionHandler(RestServiceException.class)
	@ResponseBody
	public Error resetfulServiceUnavailable(RestServiceException e) {
		return new Error(GlobalConstants.SERVICE_NOT_AVAILABLE, "WebService not available");
	}
	

/*	@ExceptionHandler(InvalidRequestException.class)
	@ResponseBody
	public Error invalidRequest(InvalidRequestException e) {
		List<String> missingFields = e.getMissingFields();
		String message ="" ;// Commented for jdk 1.8
				//String.join(": ", missingFields); // Java 8 Feature
		return new Error(GlobalConstants.SERVICE_NOT_AVAILABLE, message);
	}
	
	
	@ExceptionHandler(ConnectionFailureException.class)
	@ResponseBody
	public Error connectionFailure(ConnectionFailureException e) {		
		return new Error(GlobalConstants.SERVICE_NOT_AVAILABLE, "Host Connection Unavailable");
	}*/
}
