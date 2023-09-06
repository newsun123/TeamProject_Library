package com.example.demo.service;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("mems")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public String member() {
	
		return "/member/member";
	}

	@Override
	public int useridCheck(MemberVo mvo) {

		return mapper.useridCheck(mvo); 
	}

	@Override
	public String memberOk(MemberVo mvo,HttpServletRequest request) {

		mapper.memberOk(mvo); 
		
		return "/member/login";
	}

	@Override
	public String login(Model model,HttpServletRequest request) {
		
		String page=request.getParameter("page");
		String bcode=request.getParameter("bcode");
		model.addAttribute("page",page);
		model.addAttribute("bcode",bcode);
		
		return "/member/login";
	}

	@Override
	public String loginOk(MemberVo mvo, HttpSession session,HttpServletRequest request) {
		
		String name=mapper.loginOk(mvo);
		String page=request.getParameter("page");	
		String bcode=request.getParameter("bcode");	
		
		System.out.println(bcode);
		if(bcode==null || bcode == "") { //그냥 로그인할때
			
			if(name==null){
				return "redirect:/member/login?chk=1";
			}else{
		
				session.setAttribute("userid", mvo.getUserid());
				session.setAttribute("name", name);

				return "/main/main";
			}
		
		}else{ //도서예약에서 넘어올때
			if(name==null){
				return "redirect:/member/login?chk=1&page="+page+"&bcode="+bcode;
			
			}else{
		
				session.setAttribute("userid", mvo.getUserid());
				session.setAttribute("name", name);

				return "redirect:/breserve/content?page="+page+"&bcode="+bcode;
			}
		}
		

	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}

	@Override
	public String idfind() {
		
		return "/member/idfind";
	}

	@Override
	public String idcheck(HttpServletRequest request) {
		
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");	
		String userid=mapper.idcheck(name,phone);
		
		return userid;
	}

	@Override
	public String pwdfind() {
		
		return "/member/pwdfind";
	}

	@Override
	public String pwdcheck(HttpServletRequest request) {
		
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");	
		String phone=request.getParameter("phone");	
		
		String n=mapper.pwdcheck(userid, name, phone);
		
		return n;
	}

	@Override
	public String newPwdCheck(HttpServletRequest request) {
		
		String userid=request.getParameter("userid");
		String n=mapper.newPwdCheck(userid);
		
		return n;
	}	
	
	@Override
	public String updatePwd(MemberVo mvo) {
		
		mapper.updatePwd(mvo);
		return "redirect:/member/login";
	}

	@Override
	public String mypage(MemberVo mvo, HttpSession ss, Model model) {
		String userid = ss.getAttribute("userid").toString();
		mvo = mapper.mypage(userid);
		model.addAttribute("mvo",mvo);
		return "/mypage/mypage";
	}

	@Override
	public String mypageUpdateOk(MemberVo mvo,HttpSession ss,HttpServletRequest req) {
		String userid=ss.getAttribute("userid").toString();
		mvo.setUserid(userid);
		String pwd = mvo.getPwd();
		System.out.println(mvo.getUserid());
		System.out.println(pwd);
		System.out.println(mvo.getEmail1());
		if(pwd =="" || pwd == null) {
			mapper.mypageUpdateOk2(mvo);
		}else {
			mapper.mypageUpdateOk(mvo);			
		}
		ss.invalidate();//회원정보를 변경했으니 로그아웃시키고 로그인페이지로 이동시키자
		
		return "redirect:/member/login";
	}

	
}
