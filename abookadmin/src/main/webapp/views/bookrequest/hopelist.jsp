<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#requestWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	table#table2{
		margin-top:	100px;
		text-align:	center;
	}
	table#table2 caption{
		text-align:	left;
		height:	80px;
		font-size:	25px;
		font-family:	'NotoSansM';
	}
	table#table2 tr:first-child td{
		border-top:	2px solid #666;
		background-color:	#f9f9fb;
		border-bottom:	1px solid #666;
		height:	55px;
		color:	#333;
		font-family:	'NotoSansM';
		text-align:	center;
	}
	tabl#table2	tr	td:nth-child(1){
		width:	150px;
	}
	table#table2 tr td:nth-child(2){
		width:	160px;
	}
	table#table2 tr td:nth-child(3){
		width:	200px;
	}
	table#table2 tr td:nth-child(4){
		width:	170px;
	}
	table#table2 tr td:nth-child(5){
		width:	190px;
	}
	table#table2 tr td:nth-child(6){
		width:	160px;
	}
	table#table2 tr td:last-child{
		width:	160px;
	}
	table#table2 tr{
		height:	60px;
	}
	table#table2 tr td{
		border-bottom:	1px solid #e2e2e2;
	}
	.rbtn{
		cursor:	pointer;
		font-size:	14px;
		display:	inline-block;
		border:	1px solid #e2e2e2;
		border-radius:	3px;
		color:	#fff;
		padding:	0	35px;
		line-height:	40px;
		height:	42px;
		background:	#3d6cc4;
	}
	
	/*page버튼처리*/
	#btWrap{
		margin-top:	30px;
		position:	relative;
		height:	50px;
		text-align:	center;
	}
	#pageCon{
		margin:	auto;
	}
	#pageCon a{
		display:	inline-block;
		width:	30px;
		font-sizes:	1.123em;
		color:	#666;
		line-height:	30px;
		text-align:	center;
		vertical-align:	top;
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
<script>
/* 	window.onload=function(){
		var chk=document.getElementsbyName("chk")[0].value;
		if(chk==1){
			var title=document.getElementsByName("title")[0].value; //getElementsByName은 모든정보를 가져오므로 순서를 정해줘야한다.
			var publi=document.getElementsByName("publi")[0].value;
			var writer=document.getElementsByName("writer")[0].value;
			var writeyear=document.getElementsByName("writeyear")[0].value;
		}
	} */
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관리</span></h2>
				<ul id="lnb">
					<li><a href="/bookregi/list"><span>도서등록</span></a></li>
					<li><a href="/reservestatus/list"><span>예약현황</span></a></li>
					<li><a href="/loanstatus/list"><span>대출현황</span></a></li>
					<li><a href="/loanlist/list"><span>대출이력</span></a></li>
					<li class="on"><a href="/bookrequest/hopelist"><span>희망도서</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>희망도서</h3>
					<p>도서 관리&nbsp;&nbsp;>&nbsp;&nbsp;희망도서</p>
				</div>
				<div id="contents">
					<div id="requestWrap">
					<table id="table2">
						<caption>희망도서 </caption>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>출판사</td>
							<td>저자</td>
							<td>신청자</td>
							<td>신청일</td>
							<td>도서등록</td>
							<td>반려</td>
						</tr>
					<c:forEach items="${hlist}" var="brvo" varStatus="i">
						<tr>
							<td>
								<fmt:formatNumber value="${i.index+1}" type="number" minIntegerDigits="2"/>
							</td>
							<td>${brvo.title} + ${brvo.state} + ${brvo.no }</td>
							<td>${brvo.publi}</td>
							<td>${brvo.writer}</td>
							<td>${brvo.userid}</td>
							<td>${brvo.writeday}</td>
							<td>
								<c:if test="${brvo.state==0}"> <!-- state 수로 버튼 변경 -->
									<a href="/bookregi/write?brno= ${brvo.no}"><input type="button" value="도서등록" class="rbtn"></a>
								</c:if>
								<c:if test="${brvo.state==1}">
									<a><input type="button" value="등록완료" class="rbtn" disabled></a>
								</c:if>
							</td>
							<td>
								<c:if test="${brvo.state==0}">
									<a href="cancelBrequest?brno=${brvo.no}"><input type="button" value="도서반려" class="rbtn"></a>
								</c:if>
								<c:if test="${brvo.state==2}">
									<a><input type="button" value="반려완료" class="rbtn" disabled></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>						
					</table>
					<div id="btWrap">
						<div id="pageCon">
						<c:if test="${pstart!=1}">
							<a href="hlist?page=${pstart-1}" class="btnPage"></a>
						</c:if>
						<c:if test="${pstart==1}">
							<a class="btnPage dis"></a>
						</c:if>
						
						<c:if test="${page!=1}">
							<a href="hlist?page=${page-1}" class="btnPage prev"></a>
						</c:if>
						<c:if test="${page==1}">
							<a class="btnPage dis prev"></a>
						</c:if>
						
						<c:forEach begin="${pstart}" end="${pend}" var="i">
							<c:if test="${page!=i}">
								<a href="hlist?page=${i}">${i}</a>
							</c:if>
							<c:if test="${page==i}">
								<a href="hlist?page=${i}" style="background-color:	#555;color:#fff">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${page!=chong}">
							<a href="hlist?page=${page+1}" class="btnPage next"></a>
						</c:if>
						<c:if test="${page==chong}">
							<a class="btnPage next dis"></a>
						</c:if>
						
						<c:if test="${pend!=chong}">
							<a href="hlist?page=${pend+1}" class="btnPage last"></a>
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