<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-top: 2px solid #cecece;
	}
	table tr{
		height: 55px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table tr td:first-child {
		padding-left: 10px;
	    background: #f8f8fa;
	    width: 121px;
	    border-right: 1px solid #e4e4e4;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	}
	table tr:nth-child(2){
		height: 300px;
	}
	table tr td#cont{
		vertical-align: top;
    	padding: 13px 10px;
		height: 400px;
	}
	#btn{
		text-align: center;
		padding: 30px 0;
	}
	.dis{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>열린공간</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/gongji/list"><span>공지사항</span></a></li>
					<li><a href=""><span>문의사항</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>공지사항</h3>
					<p>열린공간&nbsp;&nbsp;>&nbsp;&nbsp;공지사항</p>
				</div>
				<div id="contents">
					<div id="gongjiWrap">	
						<a href="list?page=${page}" class="dis">목록으로</a>
						<table>
							<tr>
								<td>제목</td>
								<td>${gvo2.title}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="tl" id="cont"> 
									${gvo.content}
								</td>	
							</tr>
							<tr>
								<td>등록일</td>
								<td class="tl">${gvo2.writeday}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>