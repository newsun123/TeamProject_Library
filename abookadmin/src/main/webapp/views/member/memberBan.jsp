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
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	.bForm {
		display:none;
	}
</style>
<script>
function openBanForm(n) {
	var bForm = document.getElementsByClassName("bForm");
	var bformbtn = document.getElementsByClassName("bformbtn");
	
	bForm[n].style.display="block";
	bformbtn[n].style.display="none";
	
}

function closeForm(n) {
	
	var bForm = document.getElementsByClassName("bForm");
	var bformbtn = document.getElementsByClassName("bformbtn");
	
	bForm[n].style.display="none";
	bformbtn[n].style.display="inline-block";
}

function check(my) {
	
	var reason = my.bReason.value;
	if(reason == null || reason.length == 0 || reason == " ") {
		alert("사유를 다시 적어주세요")
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원 정보</span></h2>
				<ul id="lnb">
					<li><a href="/member/member"><span>회원 조회</span></a></li>
					<li class="on"><a href=""><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>임시정지/삭제</h3>
					<p>회원 관리&nbsp;&nbsp;>&nbsp;&nbsp;임시정지/삭제</p>
				</div>
				<div id="contents">
					<div id="MemberWrap">
						<table style="padding-bottom:20px;">
							<h3 style="font-size:20px;padding-bottom:20px;padding-top:20px;">회원 정보</h3>
								<tr>
									<td>아이디</td>
									<td>이름</td>
									<td>이메일</td>
									<td>가입일</td>
									<td>임시 정지</td>
								</tr>
								<c:forEach items="${mlist}" var="mvo" varStatus="sts">
								<tr>
									<td>${mvo.userid}</td>
									<td>${mvo.name}</td>
									<td>${mvo.email1}@${mvo.email2}</td>
									<td>${mvo.writeday}</td>
									<td>
										<c:if test="${mvo.ban==0}">
											<input type="button" value="임시 정지" class="bformbtn" onclick="openBanForm(${sts.index})" >
										</c:if>
										<c:if test="${mvo.ban==1}">
											<input type="button" value="정지 해제" class="bformbtn" onclick="openBanForm(${sts.index})" >
										</c:if>
										<div class="bForm">
										<form method="post" action="banOk" name="bForm" onsubmit="return check(this)">
										<input type="hidden" name="userid" value="${mvo.userid}">
											<input type="text" name="breason" placeholder="사유">
											<input type="submit" value="정지"> <input type="button" value="취소" onclick="closeForm(${sts.index})">
										</form>
										</div>
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