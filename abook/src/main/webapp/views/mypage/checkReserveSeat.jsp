<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#rsvOkWrap{
		padding-bottom: 30px;
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
	table#table1{
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
	}
	.ls{
		letter-spacing: 0.5px;	
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
					<li class="on"><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li><a href="/mypage/loanlist"><span>도서대출이력</span></a></li>
					<li><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li><a href="#"><span>1:1문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>좌석예약현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;좌석 예약현황</p>
				</div>
				<div id="contents">
					<div id="rsvOkWrap">
						<h4>금일 예약현황</h4>
						<table id="table1"> <!-- 금일 예약 테이블 -->
							<tr>
								<td width="100">번호</td>
								<td width="190">예약자명</td>
								<td width="190">예약좌석</td>
								<td>예약시간</td>
								<td width="180">총예약시간</td>
								<td width="180">예약취소</td>
							</tr>
							<c:if test="${rtoday.size()==0}">
							<tr>
								<td colspan="4" class="no">※ 금일 예약된 좌석이 없습니다.</td>
							</tr>
							</c:if>
							<c:if test="${rtoday.size()!=0}">
							<c:forEach items="${rtoday}" var="map" varStatus="sts">
							<tr>
								<td>${sts.index+1}</td>
								<td>${map.userid}</td>
								<td>${map.tname} 좌석</td>
								<td class="ls">${timelist2.get(sts.index)}</td>
								<td>${chongtimes2.get(sts.index)}시간</td>
								<td><input type="button" value="예약취소" class="btn1" onclick="location='cancelSeat?no=${map.no}&tn=${tntime2.get(sts.index)}&tname=${map.tname}'"></td>
							</tr>
							</c:forEach>
							</c:if>	
						</table>
						<h4>전체 예약현황</h4>
						<table id="table2"> <!-- 전체 예약 테이블 -->
							<tr>
								<td width="100">번호</td>
								<td width="190">예약자명</td>
								<td width="190">예약좌석</td>
								<td width="170">예약일</td>
								<td>예약시간</td>
								<td width="150">총예약시간</td>
							</tr>
						<c:if test="${rlist.size()==0}">
							<tr>
								<td colspan="4" class="no">※ 예약된 좌석이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${rlist}" var="rvo" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${rvo.userid}</td>
								<td>${rvo.tname} 좌석</td>
								<td>${rvo.reserveday}</td>
								<td class="ls"> ${timelist.get(status.index)}</td>
								<td>${chongtimes.get(status.index)}시간</td>
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