package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.InquiryMapper;
import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

@Service
@Qualifier("is")
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryMapper mapper;
	
	@Override
	public String list(HttpServletRequest req, Model model, InquiryVo ivo, HttpSession ss) {
		
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
		
		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		model.addAttribute("ilist", mapper.list(start));
		
		return "/inquiry/list";
			
	}

	@Override
	public String readnum(InquiryVo ivo,HttpServletRequest req) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		
		mapper.readnum(ivo);
		
		return "redirect:/inquiry/content?no="+no+"&page="+page;
	}

	@Override
	public String content(InquiryVo ivo, HttpServletRequest req, Model model,MtmVo mvo) {
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		
		
		
		ivo=mapper.content(ivo); // 유저 질문 가져오기
		String imsi=ivo.getContent().replace("\r\n", "<br>");
		ivo.setContent(imsi);
		
		// 내 답변 받아오기
		mvo = mapper.getAnswer(no);
		
		model.addAttribute("mvo",mvo);
		// mvo 값을 모델로 전해줄려면 mapper 에 select 해줘야한다!
		model.addAttribute("ivo",ivo);
		model.addAttribute("page",page);
		return "/inquiry/content";
	}

	@Override
	public String writeOk(MtmVo mvo) {
		
		mapper.writeOk(mvo);
		
		return "redirect:/inquiry/list";
	}

	@Override
	public String write(HttpServletRequest req,Model model) {
		
		String inno=req.getParameter("no");
		model.addAttribute("inno",inno);
		
		return "/inquiry/write";
	}
}
