/**
 * 
 */
package com.pgba.config.security;

import javax.servlet.http.HttpSessionEvent;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.web.session.HttpSessionEventPublisher;

/**
 * @author xfv3
 *
 */
public class SessionListener extends HttpSessionEventPublisher {

	private static final Logger logger = LogManager.getLogger(SessionListener.class);
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		logger.debug("Created new user session with id "+event.getSession().getId() + " at "+event.getSession().getCreationTime());
		event.getSession().setMaxInactiveInterval(30*60); /*Sets maximum session timeout to 30 minutes.*/
		super.sessionCreated(event);
	}
	
}