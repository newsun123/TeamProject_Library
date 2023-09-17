<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#inquiryWrap{
		padding-bottom: 30px;
		min-height: 380px;
	}
	form{
		width: 100%;
	    display: block;
	}
	h4{
		font-size: 25px;
	    font-family: 'NotoSansM';
	    text-align: center;
	    padding:30px 0;
	}
	table{
		border-top: 2px solid #cecece;
		text-align: center;
	}
	table tr{
		height: 60px;
	}
	table tr:first-child{
		height: 55px;
	}
	table tr:first-child{
		background: #f8f8fa;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		letter-spacing: 0.5px;
	}
	
	#btnCon{    
		height: 74px;
		text-align: right;
	}
	#btnCon a{
		display: inline-block;
	    border: 1px solid #93765a;
	    color: #93765a;
	   	width:110px;
	    line-height: 45px;
	    height: 45px;
	    margin-bottom: 30px;
	    position: absolute;
	    top: 0;
	    right: 0;
	    font-size: 15px;
	    text-align: center;
	}
	table img{
	    width: 21px;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
    	text-align: center;
	}
	.ta{
		width: 670px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    padding-left: 30px;
	}
	/*page버튼처리*/
	#btWrap{
	    margin-top: 30px;
	    position: relative;
	    height: 50px;
	    text-align:center;
	}
	#pageCon{
    	margin: auto;
	}
	#pageCon a{
		display: inline-block;
	    width: 30px;
	    font-size: 14px;
	    color: #666;
	    line-height: 30px;
	    text-align: center;
	    vertical-align: top;
	}
	#pageCon .btnPage{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	}
	#pageCon .btnPage.prev{
		margin-right: 5px;
    	background-position-y: -27px;
	}
	#pageCon .btnPage.next{
		margin-left: 5px;
    	background-position-y: -52px;
	}
	#pageCon .btnPage.last{
		background-position-y: -77px;
	}
	#pageCon .btnPage.dis{
		pointer-event:none;
		cursor:default;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2>
					<span>열린공간</span>
				</h2>
				<ul id="lnb">
					<li><a href="/gongji/list"><span>공지사항</span></a></li>
					<li class="on"><a href="/inquiry/list"><span>문의사항</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>문의사항</h3>
					<p>열린공간&nbsp;&nbsp;>&nbsp;&nbsp;문의사항</p>
				</div>
				<div id="contents">
					<div id="inquiryWrap">
						<div id="btnCon">
						<c:if test="${userid!=null}">
							<a href="/inquiry/write">글쓰기</a>
						</c:if>
						<c:if test="${userid==null}">
							<a href="/member/login?ichk=1" onclick="alert('비로그인 시 작성할 수 없습니다.')"><span>글쓰기</span></a>
						</c:if>
						</div>		
						<table>
							<tr>
								<td width="670">제목</td>
								<td width="180">작성자</td>
								<td width="190">등록일</td>
								<td width="130">상태처리</td>
							</tr>						
						<c:forEach items="${ilist}" var="ivo">
							<tr> 
								<td>
									<div class="ta">
									<c:if test="${userid==null}">
										<a href="/member/login?ichk=1" onclick="alert('비로그인 시 확인할 수 없습니다.')">${ivo.title}</a>
									</c:if>
									<c:if test="${userid!=null}">
										<a href="readnum?no=${ivo.no}&page=${page}">${ivo.title}</a>
									</c:if>
									</div> 
								</td>
								<td>${ivo.userid}</td>	
								<td>${ivo.writeday}</td>  
								<td>
								<c:if test="${ivo.state==0}">
									답변대기
								</c:if>
								<c:if test="${ivo.state==1}">
									답변완료
								</c:if>
								</td>  
							</tr>
						</c:forEach>							
						</table>
						<div id="btWrap">
							<div id=pageCon>
							<c:if test="${pstart!=1}">
								<a href="list?page=${pstart-1}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a> 
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="list?page=${page-1}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="list?page=${i}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="list?page=${i}" style="background-color: #555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
						
							<c:if test="${page!=chong}">
								<a href="list?page=${page+1}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							
							<c:if test="${pend!=chong}">
								<a href="list?page=${pend+1}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a> 
							</c:if>	
							</div>
						</div>							
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>