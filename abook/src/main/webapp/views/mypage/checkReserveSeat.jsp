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
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	#outer {
		width:1000px;
		margin:auto;
	}
	table h3 {
		font-size:20px;
		font-weight: 600;
		margin-bottom:20px;
	}
	table {
		margin-top:40px;
		text-align: center;
	}
	table tr {
		height:35px;

	}
	table tr td {
		align:center;
	}
	#end {
		margin-bottom:50px;
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
					<li><a href="/mypage/mypage"><span>회원정보 수정</span></a></li>
					<li class="on"><a><span>좌석 예약현황</span></a></li>
					<li><a href=""><span>도서 예약현황</span></a></li>
					<li><a href=""><span>1:1 문의 현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>좌석 예약현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;좌석 예약현황</p>
				</div>
				<div id="contents">
					<div id="rsvOkWrap">
					<div id="outer">
						<table width="800"> <!-- 금일 예약 테이블 -->
							<caption><h3>금일 예약현황 </h3></caption>
							<tr>
								<td>예약자명</td>
								<td>예약 좌석</td>
								<td>예약 시간</td>
								<td>예약 취소</td>
							</tr>
							<c:if test="${mapall.size()==0}">
							<tr>
								<td colspan="4">
									금일 예약 내역이 없습니다.
								</td>
							</tr>
							</c:if>
							<c:if test="${mapall.size()!=0}">
							<c:forEach items="${mapall}" var="map" varStatus="sts">
							<tr>
								<td>${map.userid }</td>
								<td>${map.tname }</td>
								<td>${timelist.get(sts.index)}</td>
								<td><input type="button" value="예약취소" onclick="location='cancelSeat?no=${map.no}&tn=${tntime.get(sts.index)}&tname=${map.tname}'"></td>
							</tr>
							</c:forEach>
							</c:if>
							
						</table>
						<table width="800"> <!-- 전체 예약 테이블 -->
								<caption><h3>전체 예약현황</h3></caption>
									<tr>
										<td>예약자명</td>
										<td>예약 좌석</td>
										<td>예약일</td>
										<td>예약 시간</td>
									</tr>
									<c:forEach items="${rlist}" var="rvo" varStatus="status">
									<tr>
										<td>${rvo.userid}</td>
										<td>${rvo.tname}</td>
										<td>${rvo.reserveday}</td>
										<td> ${timelist.get(status.index)}</td>
									</tr>
									</c:forEach>
								</table>
							<div id="end"></div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>