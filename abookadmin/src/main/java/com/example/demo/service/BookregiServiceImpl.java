package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;

import com.example.demo.mapper.BookregiMapper;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@Service
@Qualifier("br")
public class BookregiServiceImpl implements BookregiService{
	
	@Autowired
	private BookregiMapper mapper;
	
	@Override
	public String list(Model model,BookregiVo bvo,HttpServletRequest request){
		String state=request.getParameter("state");
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
		System.out.println(chong);
		if(pend > chong)
			pend=chong;
		
		System.out.println(pend);
		
		model.addAttribute("state",state);
		model.addAttribute("start",start);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("blist",mapper.list(bvo,start));
		
		return "/bookregi/list";
	}
	
	@Override
	public String write(HttpServletRequest request,Model model){
		return "/bookregi/write";
	}

	@Override
	public String write_ok(BookregiVo bvo, HttpServletRequest request,BookRequestVo brvo) {
		
		//String path2 = request.getRealPath("classpath:/static/img/bookregi");
		try {
			int size=1024*1024*100;
			String path=ResourceUtils.getFile("classpath:static/img/bookregi").toPath().toString();
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			
			//bvo 값 넣기
			bvo.setTitle(multi.getParameter("title"));
			bvo.setWriter(multi.getParameter("writer"));
			bvo.setPubli(multi.getParameter("publi"));
			bvo.setWriteyear(multi.getParameter("writeyear"));
			bvo.setBea(multi.getParameter("bea"));
			bvo.setEct(multi.getParameter("ect"));
			
			// bvo 이미지 값 넣기
			String bimg=multi.getFilesystemName("bimg");
			
			// 이미지 값이 없으면 빈칸으로 넣기
			if(bimg==null)
				bimg="";
			
			bvo.setBimg(bimg);
			//System.out.println(bvo.getBimg());
			// bcode 값 만들어 넣기
			String bcode=mapper.getCode();
			mapper.statechange(brvo);
			if(bcode.length()==1){
				bcode="b00"+bcode;
			}else if(bcode.length()==2){
				bcode="b0"+bcode;
			}else{
				bcode="b"+bcode;
			}
			
			//갯수 만들기 (갯수만큼 bcode 수량 증가)
			int n=Integer.parseInt(bvo.getBea());
			for(int i=1;i<=n;i++) {
				
				if(i < 10){
					String bcode2=bcode+"0"+i;
					bvo.setBcode(bcode2); //진짜 bcode
					mapper.write_ok(bvo,brvo);
					bvo.setBcode(bcode); // b코드 초기화
				}else{
					String bcode2=bcode+i;
					bvo.setBcode(bcode2);
					mapper.write_ok(bvo,brvo);
					bvo.setBcode(bcode);
				}
			}
			return "redirect:/bookregi/list";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/bookregi/write";
		}
		
		
	}

	@Override
	public String content(BookregiVo bvo, HttpServletRequest request, Model model) {
		
		String page=request.getParameter("page");
		String bcode=request.getParameter("bcode");
		
		bcode=bcode.substring(0,4);
		model.addAttribute("page",page);
		model.addAttribute("blist",mapper.content(bcode));
		
		return "/bookregi/content";
	}

}
