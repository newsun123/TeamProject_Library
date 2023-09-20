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
	public String list(Model model, HttpServletRequest request, GongjiVo gvo) {

		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		
		int page = 1;
		if (request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));

		int start = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;
		pstart = pstart * 10 + 1;

		int pend = pstart + 9;
		
		int chong;
		
		if(keyword==null || keyword.length()==0) {
			
			type="title";
			keyword="";
			chong = mapper.getChong();
			model.addAttribute("type","aa");
			model.addAttribute("glist",mapper.list(type,keyword,start));
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("page", page);
			model.addAttribute("chong",chong);
			
		}else {
			
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("page", page);
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("start",start);
		}
		
		if(type.equals("aa")) // aa와 같을때. type은 필요가없다 다 필요하기 때문에.
		{
			chong = mapper.getChong3(keyword);
			model.addAttribute("chong",chong);
			model.addAttribute("glist",mapper.list2(keyword, start));
		}
		else {
			chong = mapper.getChong2(type,keyword);
			model.addAttribute("chong",chong);
			model.addAttribute("glist",mapper.list(type,keyword,start));
		}
		
		if (pend > chong)
			pend = chong;
		
		model.addAttribute("pend",pend);
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
		 * for(int i=1;i<200;i++) {
		 * 
		 * String title="공지사항 페이징 테스트 - 제목입니다. "+i; String
		 * content="공지사항 페이징 테스트 - 내용입니다. "+i; gvo.setTitle(title);
		 * gvo.setContent(content); mapper.writeOk(gvo); }
		 */
		return "redirect:/gongji/list";
	}

	@Override
	public String content(GongjiVo gvo, Model model, HttpServletRequest request) {

		String page = request.getParameter("page");
		
		String replaceBr=mapper.content(gvo).getContent();
		String resultBr=replaceBr.replaceAll("\\n","<br>");

		GongjiVo gvo2=mapper.content(gvo);
		String content=gvo2.getContent().replaceAll("//n", "<br>");
		gvo.setContent(resultBr);
		
		gvo2.setContent(content);
		
		String type= request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("type",type);
		
		model.addAttribute("gvo",gvo);
		model.addAttribute("gvo2",gvo2);
		model.addAttribute("page", page);
		
		return "/gongji/content";
	}

	@Override
	public String delete(GongjiVo gvo, HttpServletRequest request) {

		String page = request.getParameter("page");
		mapper.delete(gvo);

		return "redirect:/gongji/list?page=" + page;
	}

	@Override
	public String update(GongjiVo gvo, Model model, HttpServletRequest request) {

		String page = request.getParameter("page");
		mapper.update(gvo);

		model.addAttribute("gvo", mapper.content(gvo));
		model.addAttribute("page", page);

		return "/gongji/update";
	}

	@Override
	public String updateOk(GongjiVo gvo, HttpServletRequest request) {

		String page = request.getParameter("page");

		mapper.updateOk(gvo);
		return "redirect:/gongji/content?no=" + gvo.getNo() + "&page=" + page;
	}

	@Override
	public String readnum(HttpServletRequest req,Model model) {
		
		String page=req.getParameter("page");
		String no=req.getParameter("no");
		String keyword=req.getParameter("keyword");
		model.addAttribute("keyword",keyword);
		String type=req.getParameter("type");
		model.addAttribute("type",type);
		mapper.readnum(no);
		
		return "redirect:/gongji/content?no="+no+"&page="+page+"&type="+type+"&keyword="+keyword;
	}

}
