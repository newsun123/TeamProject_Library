package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.GongjiMapper;
import com.example.demo.vo.GongjiVo;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService {

	@Autowired
	private GongjiMapper mapper;

	@Override
	public String list(Model model, HttpServletRequest request,GongjiVo gvo) {
		
		int page=1;
		if(request.getParameter("page") == null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int start=(page-1)*10;
		
		int pstart=page/10;
		if(page%10 == 0)
			pstart--;
		pstart=pstart*10+1;
		
		int pend=pstart+9;
		
		int chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		model.addAttribute("glist",mapper.list(start));
		
		return "/gongji/list";
	}

	@Override
	public String write() {
		
		return "/gongji/write";
	}

	@Override
	public String writeOk(GongjiVo gvo) {
			
		mapper.writeOk(gvo);
		/*
		for(int i=0; i<50; i++)
		{
			mapper.writeOk(gvo);
		}
		*/
		return "redirect:/gongji/list";
	}

	@Override
	public String content(GongjiVo gvo,Model model,HttpServletRequest request) {
		
		String page=request.getParameter("page");
		mapper.content(gvo);
		
		model.addAttribute("gvo",mapper.content(gvo));
		model.addAttribute("page",page);
		
		return "/gongji/content";
	}

	@Override
	public String delete(GongjiVo gvo,HttpServletRequest request) {
		
		String page=request.getParameter("page");
		mapper.delete(gvo);
		
		return "redirect:/gongji/list?page="+page;
	}

	@Override
	public String update(GongjiVo gvo,Model model,HttpServletRequest request) {
		
		String page=request.getParameter("page");
		mapper.update(gvo);
		
		model.addAttribute("gvo",mapper.content(gvo));
		model.addAttribute("page", page);
		
		return "/gongji/update";
	}

	@Override
	public String updateOk(GongjiVo gvo,HttpServletRequest request) {
		
		String page=request.getParameter("page");
		
		mapper.updateOk(gvo);
		return "redirect:/gongji/content?no="+gvo.getNo()+"page="+page;
	}
	


}
