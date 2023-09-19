package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BookRequestMapper;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.MemberVo;

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
	public String rlist(Model model, HttpServletRequest request, BookRequestVo brvo, HttpSession session) {
		String rchk=request.getParameter("rchk");
		if(rchk==null) {
			rchk="1";
		}
		
	    String type = request.getParameter("type");
	    String keyword = request.getParameter("keyword");
	    String title = request.getParameter("title");
	    
	    int page;
	    if (request.getParameter("page")==null)
	        page=1;
	    else
	        page=Integer.parseInt(request.getParameter("page"));
	    
	    int start=(page-1)*10;
	    int pstart=page/10;
	    if (page%10==0)
	        pstart--;
	    
	    pstart=pstart*10+1;

	    int pend=pstart+9;
	    
	   
	    
	    model.addAttribute("rchk",rchk);
	    model.addAttribute("page",page);
	    
	    int chong;
	    if (keyword==null || keyword.length()==0) {
	    	
	        type="title";
	        
	        keyword = "";
	        
	        chong=mapper.getChong();
	        
		    model.addAttribute("page", page);
	    	model.addAttribute("pstart", pstart);
	    	model.addAttribute("pend", pend);
	    	model.addAttribute("chong", chong);
	    	model.addAttribute("type","aa");
	    	model.addAttribute("rlist",mapper.search(type,keyword,start));
	    }
	    else
	    {
	    	model.addAttribute("page", page);
	    	model.addAttribute("pstart", pstart);
	    	model.addAttribute("pend", pend);
	    	model.addAttribute("type", type);
	    	model.addAttribute("keyword", keyword);
	    	model.addAttribute("start", start);
	    	
	    	if(type.equals("aa")) //aa와 같을때. type은 필요가없다 셋다 필요하기때문에.
			{
				chong = mapper.getChong3(keyword);
				model.addAttribute("chong",chong);
			    model.addAttribute("rlist",mapper.list2(keyword,start));
			}
			else
			{
				chong = mapper.getChong2(type,keyword);
				model.addAttribute("chong",chong);
				model.addAttribute("rlist",mapper.search(type,keyword,start));
			}
	    }
	    if (pend>chong)
	        pend=chong;
	    model.addAttribute("pend", pend);
	    return "bookrequest/rlist";
	}

	@Override
	public String rcontent(Model model, HttpServletRequest request, BookRequestVo brvo,HttpSession session) {
		String page=request.getParameter("page");
		String gonge=request.getParameter("gonge");
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		if(session.getAttribute("userid")==null && brvo.getGonge() == 0) { // 이걸 추가했더니 로그인 안해도 공개글이 보임.
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("page",page);
			model.addAttribute("brvo",mapper.rcontent(brvo));
			return "/bookrequest/rcontent";
		}
		
		String userid=session.getAttribute("userid").toString();
		brvo.setGonge(brvo.getGonge());
		model.addAttribute("type",type);
		model.addAttribute("keyword",keyword);
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
	/*
	 * public String search(HttpServletRequest request) { String
	 * type=request.getParameter("type"); String
	 * keyword=request.getParameter("keyword");
	 * 
	 * mapper.search(type, keyword); // 심부름을 시켰다. System.out.println(type);
	 * System.out.println(keyword); return "redirect:/bookrequest/rlist"; }
	 */
}
