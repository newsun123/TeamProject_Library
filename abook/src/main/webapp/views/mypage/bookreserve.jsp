<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MypageWrap{
		padding-bottom:30px; 
	}
	h4{
		font-size: 20px;
    	font-family: 'NotoSansM';
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
					<li class="on"><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li><a href="/mypage/loanlist"><span>도서대출리스트</span></a></li>
					<li><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li><a href="#"><span>1:1문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서예약현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서 예약현황</p>
				</div>
				<div id="contents">
					<div id="MypageWrap">
						<h4>예약현황</h4>
						<table id="table1">
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>저자</td>
								<td>예약일</td>
								<td>처리상태</td>
								<td>예약취소</td>
							</tr>
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td>${map.title}</td>
								<td>${map.publi}</td>
								<td>${map.writer}</td>
								<td>${map.writeday}</td>
								<td>승인대기</td>
								<td>
									<input type="button" value="예약취소" id="btn" onclick="location='brsvCancel?bcode=${map.bcode}'">
								</td>
							</tr>
						</c:forEach>
						</table>
						<h4>예약승인현황</h4>
						<table id="table2">
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>저자</td>
								<td>예약일</td>
								<td>처리상태</td>
							</tr>
							<c:forEach items="${mapall2}" var="map2">
							<tr>
								<td>${map2.title}</td>
								<td>${map2.publi}</td>
								<td>${map2.writer}</td>
								<td>${map2.writeday}</td>
								<td>승인거절</td>
							</tr>
						</c:forEach>
						</table>
						<h4>대출현황</h4>
						<table id="table3">
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>저자</td>
								<td>대출일</td>
								<td>반납일</td>
								<td>도서반납</td>
								<td>대출연장</td>
							</tr>
						<c:forEach items="${mapall3}" var="map3">
							<tr>
								<td>${map3.title}</td>
								<td>${map3.publi}</td>
								<td>${map3.writer}</td>
						 		<td>${map3.rental}</td>
								<td>${map3.returnday}</td>
								<td>
									<input type="button" value="반납하기" id="rebtn" onclick="location='returnOk?no=${map3.no}'">									
								</td>
								<td>
								<c:if test="${map3.gigan==0}">
									<input type="button" value="대출연장" id="giganbtn" onclick="location='giganUpdate?no=${map3.no}'">						
								</c:if>
								<c:if test="${map3.gigan!=0}">
									대출연장불가						
								</c:if>
								</td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>