package com.pgba.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.resource.GzipResourceResolver;
import org.springframework.web.servlet.resource.PathResourceResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.pgba.config.root.SecurityConfig;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.pgba.*"}, excludeFilters={ @Filter(type=FilterType.ANNOTATION, value=EnableWebMvc.class),
																@Filter(type = FilterType.REGEX, pattern = {"com.pgba.config.root","com.pgba.dao","com.pgba.service", "com.pgba.bean", "com.pgba.config.security"}),
																@Filter(type = FilterType.ASSIGNABLE_TYPE, classes = {SecurityConfig.class})})
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {   
		//converters.add(createXmlHttpMessageConverter());
		converters.add(new MappingJackson2HttpMessageConverter());
 
        super.configureMessageConverters(converters);
    }

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		System.out.println("Test resources-->");
		registry.addResourceHandler("/resources/**")
				.addResourceLocations("/resources/")
				.setCachePeriod(31556926)
				.resourceChain(true)
				.addResolver(new GzipResourceResolver())
				.addResolver(new PathResourceResolver());
	}
	
}