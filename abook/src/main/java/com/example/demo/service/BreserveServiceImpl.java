package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BreserveMapper;
import com.example.demo.vo.BookregiVo;

@Service
@Qualifier("brsv")
public class BreserveServiceImpl implements BreserveService{
	
	@Autowired
	private BreserveMapper mapper;
	
	@Override
	public String list(Model model,BookregiVo bvo,HttpServletRequest request) {
		int page;
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
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("blist",mapper.list(bvo,start));
		
		return "/breserve/list";
	}

	@Override
	public String content(BookregiVo bvo, HttpServletRequest request, Model model) {
		String page=request.getParameter("page");
		String bcode=request.getParameter("bcode");
		
		bcode=bcode.substring(0,4);
		model.addAttribute("page",page);
		model.addAttribute("blist",mapper.content(bcode));
		
		return "/breserve/content";
	}

	@Override
	public String bresOk(HttpSession session,HttpServletRequest request) {
		
		String userid=session.getAttribute("userid").toString();
		String bcode=request.getParameter("bcode");
		
		mapper.bresOk(userid,bcode);
		mapper.bresUpdate(bcode);
		return "redirect:/breserve/content?bcode="+bcode;
	}

}
