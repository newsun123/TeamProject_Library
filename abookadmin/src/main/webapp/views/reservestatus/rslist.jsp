<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reservestatusWrap{
	}
</style>
<script>
	function rcheck(my){
		
		var parent=my.parentNode.parentNode;
	    var inputbocde=parent.getElementsByClassName('bcode');
	    var bcode=inputbocde[0].value;
	    
	    location="rcheck?bcode="+bcode;
	}
	
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
					<li><a href="#"><span>대출현황</span></a></li>
					<li class="on"><a><span>예약현황</span></a></li>
					<li><a href="#"><span>신청현황</span></a></li>
					<li><a href="#"><span>희망도서</span></a></li>
					<li><a href="#"><span>월별대출</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>예약현황</h3>
					<p>도서관리&nbsp;&nbsp;>&nbsp;&nbsp;예약현황</p>
				</div>
				<div id="contents">
					<div id="reservestatusWrap">
						<table>
							<tr>
								<td>책이름</td>
								<td>회원아이디</td>
								<td>예약일</td>
								<td>예약상태</td>
								<td>상태처리</td>
							</tr>
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td>${map.title}</td>
								<td>${map.userid}</td>
								<td>${map.writeday}</td>
								<td>${map.state}</td>
								<td>
									<input type="hidden" name="bcode" value="${map.bcode}" class="bcode">
									<input type="button" value="예약확인" onclick="rcheck(this)" id="btn1">
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