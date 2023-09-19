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
	public String list(Model model,HttpServletRequest request){
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");

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

		Integer chong;
		if (keyword == null || keyword.length() == 0) {
			type = "title";
			keyword = "";

			chong = mapper.getChong();

			model.addAttribute("type", "aa");
			model.addAttribute("blist", mapper.list(type, keyword, start));
			model.addAttribute("state", state);
			model.addAttribute("start", start);
			model.addAttribute("page", page);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("chong", chong);
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		} else {
			model.addAttribute("state", state);
			model.addAttribute("start", start);
			model.addAttribute("page", page);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);

			if (type.equals("aa")) // aa와 같을때. type은 필요가없다 셋다 필요하기때문에.
			{
				chong = mapper.getChong3(keyword);
				
				if(chong==null)  // chong 값이 null 뜨는경우(검색결과가 없는 keyword)를 위해 Integer로 변경하고 null값일시 0을 준다.
					chong=0;		
				
				model.addAttribute("chong", chong);
				model.addAttribute("blist", mapper.list2(keyword, start));
			} else {
				chong = mapper.getChong2(type,keyword);
				
				if(chong==null)  // chong 값이 null 뜨는경우(검색결과가 없는 keyword)를 위해 Integer로 변경하고 null값일시 0을 준다.
					chong=0;
				
				model.addAttribute("chong",chong);
				model.addAttribute("blist", mapper.list(type, keyword, start));
			}
		}
		
		if(pend > chong)
			pend=chong;
		model.addAttribute("pend",pend);
		return "/bookregi/list";
	}
	
	@Override
	public String write(HttpServletRequest request,Model model){
		String brno = request.getParameter("brno"); // hopelist에서 값 가져옴.
		if (brno == null) {
			return "/bookregi/write";
		} else {
			BookregiVo bvo = mapper.getValueBrvo(brno);
			model.addAttribute("bvo",bvo);
			return "/bookregi/write";
		}
	}

	@Override
	public String write_ok(BookregiVo bvo, HttpServletRequest request,BookRequestVo brvo) {
		
		
		try {
			
			int size=1024*1024*100;
			String path=ResourceUtils.getFile("classpath:static/img/bookregi").toPath().toString();
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			
			//bvo 값 넣기
			bvo.setTitle(multi.getParameter("title"));
			bvo.setWriter(multi.getParameter("writer"));
			bvo.setPubli(multi.getParameter("publi"));
			bvo.setWriteyear(multi.getParameter("writeyear"));
			bvo.setBea(Integer.parseInt(multi.getParameter("bea")));
			bvo.setEct(multi.getParameter("ect"));
			//System.out.println(bvo.getTitle());
			// bvo 이미지 값 넣기
			String bimg=multi.getFilesystemName("bimg");
			
			// 이미지 값이 없으면 빈칸으로 넣기
			if(bimg==null)
				bimg="";
			
			bvo.setBimg(bimg);
			
			// 희망도서 state1 만들기용 1줄
			String brno = multi.getParameter("brno");  // 도서희망에서 가져오는 no값임.
			//System.out.println(brno);
			
			// bcode 값 만들어 넣기
			String bcode=mapper.getCode(); // memo
			//mapper.statechange(brvo);    // brvo 뭐임
			if(bcode.length()==1){
				bcode="b00"+bcode;
			}else if(bcode.length()==2){
				bcode="b0"+bcode;
			}else{
				bcode="b"+bcode;
			}
			
			//갯수 만들기 (갯수만큼 bcode 수량 증가)
			int n=bvo.getBea();
			for(int i=1;i<=n;i++) {
				
				if(i < 10){
					String bcode2=bcode+"0"+i;
					bvo.setBcode(bcode2); //진짜 bcode
					mapper.write_ok(bvo); // brvo 머임
					bvo.setBcode(bcode); // b코드 초기화
				}else{
					String bcode2=bcode+i;
					bvo.setBcode(bcode2);
					mapper.write_ok(bvo); // brvo 머임
					bvo.setBcode(bcode);
				}
				
				if(brno!=null) // 이건 내꺼
					mapper.chgStateBookrequest(brno); // 이건 스트링
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
		model.addAttribute("mapall",mapper.content(bcode));
		
		String keyword=request.getParameter("keyword");
		String type = request.getParameter("type");
		model.addAttribute("keyword",keyword);
		model.addAttribute("type",type);
		
		return "/bookregi/content";
	}
	
	@Override
	public String add(HttpServletRequest request) {
		
		String bcode=request.getParameter("bcode");
		String page=request.getParameter("page");
		String bcode2=bcode.substring(0,4); //'b001'
		
		BookregiVo bvo=mapper.getlist(bcode2);
		
		String bcode3=bvo.getBcode().substring(4,6); //'01'
		
		int bcode4=Integer.parseInt(bcode3)+1; //bcode증가
		String bb="";
		
		if(bcode4>9) {
			bb=bcode2+Integer.toString(bcode4);
		}else {
			bb=bcode2+"0"+Integer.toString(bcode4);
		}
		
		bvo.setBcode(bb);
		int n=bvo.getBea()+1;
		bvo.setBea(n);
		mapper.add(bvo);
		mapper.beaUpdate(bcode2,n);
		return "redirect:/bookregi/content?page="+page+"&bcode="+bcode;
	}

	@Override
	public String del(HttpServletRequest request) {
		
		String bcode=request.getParameter("bcode");
		String page=request.getParameter("page");
		String bcode2=bcode.substring(0,4); //'b001'
		
		mapper.del(bcode);
		int n=mapper.getcnt(bcode2);
		
		if(n==0) { //전부 삭제 되었을때
			return "redirect:/bookregi/list?page="+page;
		}
		
		mapper.beaUpdate(bcode2,n);
		return "redirect:/bookregi/content?page="+page+"&bcode="+bcode;
	}

}
