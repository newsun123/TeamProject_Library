package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MypageService {
	public String checkReserveSeat(HttpSession ss,Model model);
	public String cancelSeat(HttpServletRequest req,HttpSession ss);
}
