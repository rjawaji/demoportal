/**
 * 
 */
package com.pgba.config.root;

import org.springframework.context.annotation.ComponentScan;

/**
 * @author xfv3
 *
 */
@ComponentScan(basePackages = {"com.pgba.config.root", "com.pgba.bean","com.pgba.util","com.pgba.config.security","com.pgba.dao","com.pgba.service"})
public class RootContextConfig {
	
}