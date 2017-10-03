/**
 * 
 */
package com.pgba.config.root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.pgba.config.security.CustomAuthenticationProvider;
import com.pgba.config.security.PortalAccessDeniedHandler;
import com.pgba.config.security.PortalWebAuthenticationDetailsSource;

/**
 * @author xfv3
 *
 */
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CustomAuthenticationProvider customAuthenticationProvider;
	
	@Autowired
	private PortalWebAuthenticationDetailsSource portalWebAuthenticationDetailsSource;
	
	@Autowired
	private PortalAccessDeniedHandler portalAccessDeniedHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(customAuthenticationProvider);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers("/resources/**").permitAll()
		.antMatchers("/passwordReset/**", "/contactUs", "/register/**").permitAll()
		.antMatchers("/footerLink/**").permitAll()
		.antMatchers("/**verifyProfile**", "/verifyProfile**").permitAll()
		.antMatchers("/multiFactorAuthentication","/generateMFACode", "/validateMFACode","/requestNewProfileVerificationEmail").authenticated()
		.antMatchers("/changePassword", "/processChangePassword", "/validateChangePassword").access("isAuthenticated() and @rrbUrlInterceptor.checkProfileVerified(authentication, request)")
		.antMatchers("/initMyProfile", "/validateMyProfile", "/processMyProfile").access("isAuthenticated() and @rrbUrlInterceptor.checkMfaVerified(authentication, request)")
		.anyRequest().access("isAuthenticated() and @rrbUrlInterceptor.checkAllVerified(authentication, request)" )
		.and()
		.formLogin()
			.loginPage("/login").permitAll()
			.usernameParameter("userId")
			.passwordParameter("password")
			.authenticationDetailsSource(portalWebAuthenticationDetailsSource)
			.failureUrl("/authenticationFailure")
			.successForwardUrl("/authenticationSuccess")
		.and()
		.logout().deleteCookies("JSESSIONID")
		.logoutUrl("/doLogout")//
		.logoutRequestMatcher(new AntPathRequestMatcher("/doLogout", "GET"))
		.and()
		.headers().contentSecurityPolicy("script-src 'self' ; object-src 'self'; style-src 'self' ;").and()
			.httpStrictTransportSecurity()
				.includeSubDomains(true)
				.maxAgeInSeconds(31536000).and().and()
		.sessionManagement()
			.maximumSessions(1)
			.maxSessionsPreventsLogin(true)
			.sessionRegistry(sessionRegistry())
		.and()
		.and()
		.exceptionHandling().accessDeniedHandler(portalAccessDeniedHandler); 
	}

	@Bean
	public SessionRegistry sessionRegistry() {
		return new SessionRegistryImpl();
	}
	
}
