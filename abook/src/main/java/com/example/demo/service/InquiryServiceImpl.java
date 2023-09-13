package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.InquiryMapper;
import com.example.demo.vo.InquiryVo;

@Service
@Qualifier("ic")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper mapper;

	@Override
	public String list(HttpServletRequest req, Model model, InquiryVo ivo,HttpSession ss) {
		
		int page=1;
		if(req.getParameter("page") ==null)
			page =1;
		else
			page=Integer.parseInt(req.getParameter("page"));
		
		int start=(page -1) * 10;
		
		int pstart = page/10;
		if(page%10 ==0)
			pstart--;
		pstart=pstart*10+1;
		
		int pend=pstart +9;
		
		int chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		int r=(page-1)*10;
		mapper.setRownum(r);
		
		String userid=ss.getAttribute("userid").toString();
		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		model.addAttribute("userid",userid);
		
		model.addAttribute("ilist", mapper.list(start));
		
		return "/inquiry/list";
	}

	@Override
	public String write() {
		
		return "/inquiry/write";
	}

	@Override
	public String writeOk(InquiryVo ivo) {
		
		mapper.writeOk(ivo);
		
		return "redirect:/inquiry/list";
	}

	@Override
	public String readnum(InquiryVo ivo,HttpServletRequest req) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		mapper.readnum(ivo);
		
		return "redirect:/inquiry/content?no="+no+"&page="+page;
	}

	@Override
	public String content(InquiryVo ivo, HttpServletRequest req, Model model) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		
		// 줄바꿈 처리 => ivo 재활용
		ivo=mapper.content(ivo);
		String imsi=ivo.getContent().replace("\r\n", "<br>");
		ivo.setContent(imsi);
	 
		model.addAttribute("ivo",ivo);
		model.addAttribute("page",page);
		
		return "/inquiry/content";
	}

	@Override
	public String delete(InquiryVo ivo,HttpServletRequest req) {
		
		String page=req.getParameter("page");
		mapper.delete(ivo);
		
		return "redirect:/inquiry/list?page="+page;
	}

	@Override
	public String update(InquiryVo ivo,Model model,HttpServletRequest req) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		mapper.update(ivo);
		
		model.addAttribute("ivo",mapper.content(ivo));
		model.addAttribute("page","page");
		
		return "/inquiry/update";
	}

	@Override
	public String updateOk(InquiryVo ivo, HttpServletRequest req) {
		
		String page=req.getParameter("page");
		String no=req.getParameter("no");
		mapper.updateOk(ivo);
		return "redirect:/inquiry/content?no="+no+"&page="+page;
	}
}
