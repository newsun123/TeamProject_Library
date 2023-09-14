package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MypageService {
	public String checkReserveSeat(HttpSession ss,Model model);
	public String cancelSeat(HttpServletRequest req,HttpSession ss);
	//0909 강서영 백업
	
	public String bookreserve(Model model,HttpSession session);
	public String brsvCancel(HttpServletRequest request);
	public String giganUpdate(HttpServletRequest request);
	public String returnOk(HttpServletRequest request);
	public String loanlist(HttpSession session,Model model,HttpServletRequest request);
	//jjim 추가 0911
	public String myjjim(HttpSession ss,Model model,HttpServletRequest req);

}
