package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.GongjiMapper;
import com.example.demo.vo.GongjiVo;

@Service
@Qualifier("gs2")
public class GongjiServiceImpl implements GongjiService {
	
	@Autowired
	private GongjiMapper mapper;

	@Override
	public String list(Model model, HttpServletRequest req, GongjiVo gvo) {
		
		int page = 1;
		if (req.getParameter("page") == null || req.getParameter("page").equals(""))
			page = 1;
		else
			page = Integer.parseInt(req.getParameter("page"));

		int start = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;
		pstart = pstart * 10 + 1;

		int pend = pstart + 9;

		int chong = mapper.getChong();

		if (pend > chong)
			pend = chong;

		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);

		model.addAttribute("glist", mapper.list(start));

		return "/gongji/list";
		
	}

	@Override
	public String readnum(HttpServletRequest req) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		
		mapper.readnum(no);
		
		return "redirect:/gongji/content?no="+no+"&page="+page;
	}

	@Override
	public String content(Model model, HttpServletRequest req, GongjiVo gvo) {
		
		String page=req.getParameter("page");
		
		String replaceBr=mapper.content(gvo).getContent();
		String resultBr=replaceBr.replaceAll("\\n","<br>");

		GongjiVo gvo2=mapper.content(gvo);
		String content=gvo2.getContent().replaceAll("//n", "<br>");
		gvo.setContent(resultBr);
		
		gvo2.setContent(content);
		
		model.addAttribute("gvo",gvo);
		model.addAttribute("gvo2",gvo2);
		model.addAttribute("page", page);
		
		return "/gongji/content";
	}
}
