package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ReservestatusService {
	public String rslist(Model model);
	public String rcheck(HttpServletRequest request);
}
