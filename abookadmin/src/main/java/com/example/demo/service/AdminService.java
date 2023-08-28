package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.AdminVo;

public interface AdminService {
	public String list(Model model,AdminVo avo,HttpServletRequest request);
	public String write();
	public String write_ok(AdminVo avo,HttpServletRequest request,Model model);
	public String addbookea(HttpServletRequest request);
	public String delbookea(HttpServletRequest request);
	public String content(AdminVo avo,HttpServletRequest request,Model model);
	public String getBcode(Model model);
}
