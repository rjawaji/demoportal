package com.pgba.bean.common;

import java.util.HashMap;
import java.util.Map;

public class GlobalConstants {

	/*
	 * Response status
	 */
	public static final String 	  SUCCESS_RESPONSE			 = "SUCCESS";
    public static final String    ERROR_RESPONSE			 = "ERROR";
    public static final String    COMMA_SEPAREATOR			 = ",";
    /*
     * Response Status Codes.
     */
	public static final int 	SUCCESS 					= 0;
    public static final int     MQ_CONNECTION_ERROR			= -10;   // RRBPORTAL: MQ Connection Error
    public static final int 	MQ_MSG_SEND_ERROR			= -20;   // RRBPORTAL: Failed to put the message to 'Q'
	public static final int  	MQ_MSG_RETRIEVE_ERROR 		= -30;  // RRBPORTAL: Failed to retrieve message from Receive Q
	public static final int  	MQ_MSG_PARSING_ERROR 		= -40;  // RRBPORTAL: Failed to parse the message from Receive Q
	public static final int  	INVALID_RESPONSE 			= -50;  // RRBPORTAL: Unknown response object received
    public static final int     SERVICE_NOT_AVAILABLE 		= -9001;  // PGBA:Webservice Not Available
	public static final int  	EXCEPTION_ERROR 						= -9006;  // PGBA: Exception thrown
	public static final int  	BENEFICIARY_PERMANENT_LOCKOUT 			= 203; 
	public static final int  	BENEFICIARY_TEMPORARY_LOCKOUT 			= 204; 
	public static final int  	REGISTRATION_VALIDATION_FAILURE 		= 205; 
	public static final int 	EMAIL_FAILURE	= 103;
	public static final int     DB_DATA_UPDATE_ERROR   	    = -9004;
	public static final int     DB_DATA_SAVE_ERROR   	    = -9005;
	public static final int     TRY_AGAIN   	    = -100;
	
	//Login
	public static final int 	USER_NOT_FOUND = 300;
	public static final int 	INVALID_PASSWORD = 303;
	public static final int 	USER_NOT_IN_LDAP = 312;

	public static final String INVALID_CREDENTIALS = "Username and/or Password are incorrect.";
	
    public static Map<Integer, String> ERROR_MESSAGES = new HashMap<Integer,String>();
	
	static{
		ERROR_MESSAGES.put(GlobalConstants.MQ_CONNECTION_ERROR,"Failed to connection to Queue Manager.");
		ERROR_MESSAGES.put(GlobalConstants.MQ_MSG_SEND_ERROR,"Failed to put the message to 'Q'");
		ERROR_MESSAGES.put(GlobalConstants.MQ_MSG_RETRIEVE_ERROR,"Failed to retrieve message from 'Q'");
		ERROR_MESSAGES.put(GlobalConstants.MQ_MSG_PARSING_ERROR," Failed to parse the message from Receive 'Q'");
		ERROR_MESSAGES.put(GlobalConstants.EXCEPTION_ERROR,"An application error has occurred during the process. Please try again or contact the technical support center for further assistance.");	
		ERROR_MESSAGES.put(GlobalConstants.INVALID_RESPONSE," Unknown response object received.");
		ERROR_MESSAGES.put(GlobalConstants.SERVICE_NOT_AVAILABLE,"WebService requested is not available.");
		ERROR_MESSAGES.put(GlobalConstants.TRY_AGAIN,"An application error has occurred during the process. Please try again or contact the technical support center for further assistance.");	
		ERROR_MESSAGES.put(GlobalConstants.REGISTRATION_VALIDATION_FAILURE,"The information you entered does not match our records. Please correct your information and resubmit.");
		ERROR_MESSAGES.put(GlobalConstants.USER_NOT_FOUND, INVALID_CREDENTIALS);
		ERROR_MESSAGES.put(GlobalConstants.INVALID_PASSWORD, INVALID_CREDENTIALS);
		ERROR_MESSAGES.put(GlobalConstants.USER_NOT_IN_LDAP, "There are some inconsistencies with your account. Please contact the technical support center for further assistance.");
	}
}
