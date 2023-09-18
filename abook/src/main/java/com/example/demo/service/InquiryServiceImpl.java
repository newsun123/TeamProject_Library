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
import com.example.demo.vo.MtmVo;

@Service
@Qualifier("ic")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper mapper;

	@Override
	public String list(HttpServletRequest req, Model model, InquiryVo ivo,HttpSession ss) {
		
		String type=req.getParameter("type");
		String keyword=req.getParameter("keyword");
		String title=req.getParameter("req");
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
		
		if(keyword==null || keyword.length()==0) {
			type="title";
			keyword="";
			model.addAttribute("type","aa");
			model.addAttribute("glist",mapper.list(type,keyword,start));
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("chong",chong);
		}
		else {
			model.addAttribute("chong", chong);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("page", page);
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("start",start);
		}
		if(type.equals("aa")) // aa와 같을때. type은 필요가없다 다 필요하기 때문에.
			model.addAttribute("ilist",mapper.list2(keyword, start));
		else
			model.addAttribute("ilist",mapper.list(type,keyword,start));
		
		return "/inquiry/list";
	}

	@Override
	public String write(HttpServletRequest req,Model model,HttpSession session) {
		//귀찮아서 못지움. 나중에 지우기
		return "/inquiry/write";
	}

	@Override
	public String writeOk(InquiryVo ivo,HttpSession ss) {
		
		String userid=ss.getAttribute("userid").toString();
		ivo.setUserid(userid);
		mapper.writeOk(ivo);
		return "redirect:/inquiry/list";
	}

	@Override
	public String readnum(HttpServletRequest req) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		mapper.readnum(no);
		
		return "redirect:/inquiry/content?no="+no+"&page="+page;
	}

	@Override
	public String content(HttpServletRequest req,Model model,HttpSession ss) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		model.addAttribute("page",page);
		String userid=ss.getAttribute("userid").toString();
		model.addAttribute("userid",userid);
		String mchk = req.getParameter("mchk"); //mypage에서 이동한 것 확인용
		model.addAttribute("mchk",mchk);

		// 줄바꿈 처리 => ivo 재활용
		InquiryVo ivo=mapper.content(no);
		String imsi=ivo.getContent().replace("\r\n", "<br>");
		ivo.setContent(imsi);
		model.addAttribute("ivo",ivo);
		
		MtmVo mvo=mapper.getAnswer(no);
		ivo=mapper.getState(ivo.getState(),ivo.getNo());	
		model.addAttribute("mvo",mvo);
		
		return "/inquiry/content";
	}

	@Override
	public String delete(HttpServletRequest req) {
		
		String page=req.getParameter("page");
		String no = req.getParameter("no");
		mapper.delete(no);
		
		return "redirect:/inquiry/list?page="+page;
	}

	@Override
	public String update(InquiryVo ivo,Model model,HttpServletRequest req) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		mapper.update(ivo);
		
		model.addAttribute("ivo",mapper.content(no));
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
