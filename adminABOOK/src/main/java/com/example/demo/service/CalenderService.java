package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CalenderService {

	public String calender(HttpServletRequest request,Model model);

}
