package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BookRequestMapper;
import com.example.demo.vo.BookRequestVo;

@Service
@Qualifier("brs")
public class BookRequestServiceImpl implements BookRequestService {

	@Autowired
	private BookRequestMapper mapper;

	@Override
	public String requestwrite() {
		return "/bookrequest/requestwrite";
	}

	@Override
	public String requestwrite_ok(HttpSession session,BookRequestVo brvo,HttpServletRequest request) {
		
		int gonge;
		if(request.getParameter("gonge")==null)
		{
			gonge=0;
		}
		else
		{
			gonge=1;
		}
		brvo.setGonge(gonge);
		brvo.setUserid(session.getAttribute("userid").toString());
		mapper.requestwrite_ok(brvo);
		return "redirect:/bookrequest/rlist";
	}

	@Override
	public String rlist(Model model, HttpServletRequest request,BookRequestVo brvo,HttpSession session) {
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
		
		/*
		 * String field=request.getParameter("field"); String
		 * sword=request.getParameter("sword");
		 * 
		 * String sql; if(sword==null || sword.length()==0) { // 리스트를 처음요청하면 sword가 처음에
		 * 없으니까 null이 나온다. null이나올경우와 빈칸일경우.
		 * sql="select * from bookrequest order by no desc"; } else
		 * sql="select * from bookrequest where"+field+"like '%"
		 * +sword+"%' order by no desc";
		 */
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("userid",userid);
		model.addAttribute("rlist",mapper.rlist(start, brvo));
		
		return "/bookrequest/rlist";
	}

	@Override
	public String rcontent(Model model, HttpServletRequest request, BookRequestVo brvo,HttpSession session) {
		String page=request.getParameter("page");
		String userid=session.getAttribute("userid").toString();
		String gonge=request.getParameter("gonge");
		brvo.setGonge(brvo.getGonge());
		model.addAttribute("page",page);
		model.addAttribute("userid",userid);
		model.addAttribute("brvo",mapper.rcontent(brvo));
		
		return "/bookrequest/rcontent";
	}

	@Override
	public String rupdate(HttpServletRequest request, Model model, BookRequestVo brvo,HttpSession session) {
		String no= request.getParameter("no");
		String userid=session.getAttribute("userid").toString();
		String page=request.getParameter("page");
		model.addAttribute("userid",userid);
		model.addAttribute("page",page);
		model.addAttribute("brvo",mapper.rupdate(no));
		return "/bookrequest/rupdate";
	}

	@Override
	public String rupdate_ok(HttpServletRequest request, BookRequestVo brvo,HttpSession session) {
		String page=request.getParameter("page");
		String userid=session.getAttribute("userid").toString();
		String no=request.getParameter("no");
		brvo.setUserid(userid);
		mapper.rupdate_ok(brvo);
		return "redirect:/bookrequest/rcontent?no="+no+"&page="+page;
	}

	@Override
	public String delete(HttpServletRequest request, HttpSession session, BookRequestVo brvo) {
		String page=request.getParameter("page");
		mapper.delete(brvo);
		return "redirect:/bookrequest/rlist?page="+page;
	}

	public String search(HttpServletRequest request) {
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		
		mapper.search(type, keyword);
		return "redirect:/bookrequest/rlist";
	}
}
