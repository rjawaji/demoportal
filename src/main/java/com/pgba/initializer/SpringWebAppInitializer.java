package com.pgba.initializer;


import javax.servlet.ServletContext;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.pgba.config.WebMvcConfig;
import com.pgba.config.root.RootContextConfig;
import com.pgba.config.security.SessionListener;

public class SpringWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
		
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebMvcConfig.class };
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { RootContextConfig.class };
	}
	
	@Override
	protected void registerContextLoaderListener(ServletContext ctx) {
		ctx.addListener(SessionListener.class);
		super.registerContextLoaderListener(ctx);
	}
	
/*	@Override
	public void onStartup(ServletContext servletContext) {
		  XmlWebApplicationContext appContext = new XmlWebApplicationContext();
	      appContext.setConfigLocation("/WEB-INF/spring/dispatcher-config.xml");
	      
	      //servletContext.addFilter(arg0, arg1)
	      
	      ServletRegistration.Dynamic dispatcher =
	    		  servletContext.addServlet("dispatcher", new DispatcherServlet(appContext));
	    	      dispatcher.setLoadOnStartup(1);
	    	      dispatcher.addMapping("/");
	    	      super.onStartup(servletContext);
	}	*/
}
