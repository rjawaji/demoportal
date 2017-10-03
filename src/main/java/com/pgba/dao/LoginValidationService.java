package com.pgba.dao;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
@Service
public interface LoginValidationService {

	public String loginTransaction(String request);
}
