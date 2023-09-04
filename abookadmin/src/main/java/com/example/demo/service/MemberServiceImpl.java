package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public String mlist(HttpServletRequest request, Model model, MemberVo mvo) {
		int page;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int start=(page-1)*10;
		
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=pstart*10+1;
		
		int pend=pstart+9;
		int chong=mapper.getChong();
		if(pend>chong)
			pend=chong;
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("mlist",mapper.mlist(start,mvo));
		
		return "/member/mlist";
	}
	
}
