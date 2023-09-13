package com.example.demo.service;

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
	public String readnum(InquiryVo ivo) {
		
		mapper.readnum(ivo);
		
		return "redirect:/inquiry/content?no=${no}";
	}
	
	
}
