<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MyjjimWrap{
		padding-bottom:30px; 
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #cecece;
    	margin-top:30px;
		text-align: center;
	}
	table tr {
		height:35px;
	}
	table tr td {
		align:center;
	}
	table#table1,
	table#table2{
		margin-bottom: 110px;
	}
	table tr:first-child td {
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #ddd;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	} 
	table tr td{
		height: 55px;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
	}
	.btn1{
		background: #fff;
	    border: 1px solid #967759;
	    color: #967759;
	    font-size: 14px;
	    width: 110px;
	    height: 41px;
	    border-radius: 3px;
	    display: inline-block;
	    line-height: 41px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>마이페이지</span></h2>
				<ul id="lnb">
					<li><a href="/mypage/mypage"><span>회원정보수정</span></a></li>
					<li><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li><a href="/mypage/loanlist"><span>도서대출이력</span></a></li>
					<li class="on"><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li><a href="#"><span>1:1문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서찜리스트</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서 찜리스트</p>
				</div>
				<div id="contents">
					<div id="MyjjimWrap">
						<table id="table">
								<tr>
									<td>도서명</td>
									<td>출판사</td>
									<td>출판일</td>
									<td>찜한일자</td>
									<td>예약하기</td>
								</tr>
							<c:if test="${mapall.size()==0}">
								<tr>
									<td colspan="6" class="no">※ 찜한 도서가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${mapall.size()!=0}">
							<c:forEach items="${mapall}" var="map">
								<tr>
									<td>${map.title}</td>
									<td>${map.publi}</td>
									<td>${map.writeyear}</td>
									<td>${map.writeday}</td>
									<td><a href="/breserve/content?bcode=${map.bcode.substring(0,4)}&mj=1&userid=${map.userid}" class="btn1">예약하기</a></td>
								</tr>
							</c:forEach>	
							</c:if>
						</table>	
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>