<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MemberWrap{
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
	table tr td {
    	border-bottom: 1px solid #ddd;
	}
	table tr:last-child td{
		border-bottom: none;
	}
	table#table1,
	table#table2,
	table#table3{
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
		height: 60px;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
	}
	.backbtn{
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
				<h2><span>회원관리</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/member/member"><span>회원조회</span></a></li>
					<li><a href="/member/memberBan"><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>회원관리</h3>
					<p>회원 관리&nbsp;&nbsp;>&nbsp;&nbsp;회원조회</p>
				</div>
				<div id="contents">
				<a href="/member/member" class="backbtn">목록가기</a>
					<div id="MemberWrap">
						<h4>${map.name}님의 상세정보</h4>
						<table id="table1">
								<tr>
									<td>아이디</td>
									<td>이름</td>
									<td>전화번호</td>
									<td>이메일</td>
									<td>주소</td>
									<td>가입일</td>
								</tr>
								<tr>
									<td>${map.userid}</td>
									<td>${map.name}</td>
									<td>${map.phone}</td>
									<td>${map.email1}@${map.email2}</td>
									<td>${map.addr} ${map.addtDtl}</td>
									<td>${map.writeday}</td>
								</tr>
						</table>
						<h4>작성글</h4>
						<table id="table2">
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>
						<h4>대출이력</h4>
						<table id="table3">
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>저자</td>
								<td>대출일</td>
								<td>반납일</td>
							</tr>
						</table>
						<h4>좌석예약이력</h4>
						<table id="table4">
							<tr>
								<td width="300">예약좌석</td>
								<td>예약시간</td>
								<td width="300">예약일</td>
							</tr>
						<c:if test="${rlist.size()==0}">
							<td colspan="3" class="no">※ 예약이력이 없습니다.</td>
						</c:if>
						<c:forEach items="${rlist}" var="rvo" varStatus="status">
							<tr>
								<td>${rvo.tname}</td>
								<td>${timelist.get(status.index)}</td>
								<td>${rvo.reserveday}</td>
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