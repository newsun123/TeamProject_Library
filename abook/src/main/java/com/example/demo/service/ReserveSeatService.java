package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ReserveSeatService {

	public String reserveseat();
	public String reservePc(HttpServletRequest request,Model model);
	public String rulelibrary();
	
}
