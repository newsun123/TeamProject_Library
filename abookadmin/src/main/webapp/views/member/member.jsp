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
	table tr:first-child td {
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #ddd;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	} 
	table tr {
		height:60px;
	}
	table tr:first-child{
		height: 55px;
	}
	.btn{
		background: #fff;
	    border: 1px solid #4379d6;
	    color: #4379d6;
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
					<div id="MemberWrap">
						<table>
								<tr>
									<td width="130">번호</td>
									<td>아이디</td>
									<td width="180">이름</td>
									<td width="290">이메일</td>
									<td width="190">가입일</td>
									<td width="200">상세정보</td>
								</tr>
							<c:if test="${mlist.size()==0}">
								<tr>
									<td colspan="6" class="no">※ 회원정보가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${mlist.size()!=0}">
								<c:forEach items="${mlist}" var="mvo" varStatus="sts">
								<tr>	
									<td>${sts.index+1}</td>
									<td>${mvo.userid}</td>
									<td>${mvo.name}</td>
									<td>${mvo.email1}@${mvo.email2}</td>
									<td>${mvo.writeday}</td>
									<td><a href="/member/detail?userid=${mvo.userid}" class="btn">상세정보</a></td>
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