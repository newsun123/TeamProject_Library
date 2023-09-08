package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.BookregiVo;

public interface BreserveService {
	public String list(Model model,BookregiVo bvo,HttpServletRequest request);
	public String content(HttpServletRequest request,Model model);
	public String bresOk(HttpSession session,HttpServletRequest request,Model model);
	public int cntCheck(HttpSession session);
}
