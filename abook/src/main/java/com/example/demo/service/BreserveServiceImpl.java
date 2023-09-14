package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

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
public class BreserveServiceImpl implements BreserveService {

	@Autowired
	private BreserveMapper mapper;

	@Override
	public String list(Model model,BookregiVo bvo,HttpServletRequest request) {
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");

		int page;

		if (request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));

		int start = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;
		
		pstart=pstart*10+1;
		
		int pend=pstart+9;
		
		int chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		if(keyword==null || keyword.length()==0) {
			type="title";
		if(type==null || keyword==null || keyword.length()==0) {
			String title="title";
			String publi="publi";
			String writer="writer";
			keyword="";
			model.addAttribute("blist",mapper.list2(title,publi,writer,keyword,start));
			
		}else {
			model.addAttribute("blist",mapper.list(type,keyword,start));
		}
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("type",type);
		model.addAttribute("keyword",keyword);
		model.addAttribute("start",start);
		model.addAttribute("blist",mapper.list(type,keyword,start));
		}
		return "/breserve/list";
	}

	@Override
	public String content(HttpServletRequest request, Model model,HttpSession ss) {
		String chk = request.getParameter("chk");
		if (chk == null) {
			chk = "0";
		}

		model.addAttribute("chk", chk);
		String page = request.getParameter("page");
		String bcode = request.getParameter("bcode");

		bcode = bcode.substring(0, 4);
		model.addAttribute("page", page);

		ArrayList<HashMap> mapall = mapper.content(bcode);
		model.addAttribute("mapall", mapall);
		
		// jjim 체크해서 모델 보내기

		
		if(ss.getAttribute("userid")!=null) {
			String userid= ss.getAttribute("userid").toString();
			
			if(mapper.jjimCheck(userid, bcode)) {
				model.addAttribute("img","jjim2.png");
			}else {
				model.addAttribute("img","jjim1.png");
			}


			//mypage jjim 관련 mj 값 줌
			String mj = request.getParameter("mj");
			if(mj=="1") {
				model.addAttribute("mj",mj);				
				model.addAttribute("img","jjim1.png"); //로그인 안했을때 파일 안깨지게
			}
		}
		
		return "/breserve/content";
	}

	@Override
	public String bresOk(HttpSession session, HttpServletRequest request, Model model) {

		if (session.getAttribute("userid") == null) {
			String page = request.getParameter("page");
			String bcode = request.getParameter("bcode");

			return "redirect:/member/login?page=" + page + "&bcode=" + bcode;
		} else {

			String bcode = request.getParameter("bcode");
			String userid = session.getAttribute("userid").toString();

			if (mapper.cntCheck(userid) > 3) {
				return "redirect:/breserve/content?bcode=" + bcode + "&chk=1";

			} else {

				mapper.bresOk(userid, bcode);
				mapper.bresUpdate(bcode);

				return "redirect:/breserve/content?bcode=" + bcode;
			}
		}

	}

	@Override
	public int cntCheck(HttpSession session) {

		String userid = session.getAttribute("userid").toString();

		int cnt = mapper.cntCheck(userid);
		return cnt;
	}

	@Override
	public String addjjim(HttpServletRequest req, HttpSession ss) {
		if (ss.getAttribute("userid") != null) {

			String userid = ss.getAttribute("userid").toString();
			String bcode = req.getParameter("bcode");
			// System.out.println(userid+"/"+bcode);
			try {
				mapper.addjjim(userid, bcode);
				return "0";
			} catch (Exception e) {
				return "1";
			}
		} else {
			return "2";
		}
	}

	@Override
	public String deljjim(HttpServletRequest req, HttpSession ss) {
		if (ss.getAttribute("userid") != null) {
			String userid = ss.getAttribute("userid").toString();
			String bcode = req.getParameter("bcode");
			try {
				mapper.deljjim(userid, bcode);

				return "0";
			} catch (Exception e) {
				return "1";
			}
		} else {
			return "2";
		}
	}

	@Override
	public String listChange(HttpServletRequest req, Model model) {
		String type = req.getParameter("type");
		String keyword = "";
		int start = Integer.parseInt(req.getParameter("start"));
		int num = Integer.parseInt(req.getParameter("num"));
		if (num == 0) {
			ArrayList<BookregiVo> blist = mapper.list(type, keyword, start);
			model.addAttribute("blist",blist);
		} else {
			ArrayList<BookregiVo> blist = mapper.bestBookList(type, keyword, start);
			model.addAttribute("blist", blist);
		}
		
		return "/breserve/list";
	}

}
