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
	.bForm {
		display:none;
	}
	.ta{
		text-align: right!important;
    	padding-right: 25px!important;
	}
	.ta_b{
		text-align: right;
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
				<h2><span>회원관리</span></h2>
				<ul id="lnb">
					<li><a href="/member/member"><span>회원조회</span></a></li>
					<li class="on"><a href="/member/memberBan"><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>임시정지/삭제</h3>
					<p>회원 관리&nbsp;&nbsp;>&nbsp;&nbsp;임시정지/삭제</p>
				</div>
				<div id="contents">
					<div id="MemberWrap">
						<table>
								<tr>
									<td width="130">번호</td>
									<td width="170">아이디</td>
									<td width="170">이름</td>
									<td width="200">가입일</td>
									<td class="ta">임시 정지</td>
									<td width="50"></td>
								</tr>
								<c:forEach items="${mlist}" var="mvo" varStatus="sts">
								<tr>
									<td>${sts.index+1}</td>
									<td>${mvo.userid}</td>
									<td>${mvo.name}</td>
									<td>${mvo.writeday}</td>
									<td class="ta_b">
										<c:if test="${mvo.ban==0}">
											<input type="button" value="임시 정지" class="btn bformbtn" onclick="openBanForm(${sts.index})">
										</c:if>
										<c:if test="${mvo.ban==1}">
											<input type="button" value="정지 해제" class="btn bformbtn" onclick="openBanForm(${sts.index})">
										</c:if>
										<div class="bForm">
										<form method="post" action="banOk" name="bForm" onsubmit="return check(this)">
										<input type="hidden" name="userid" value="${mvo.userid}">
											<input type="text" name="breason" placeholder="사유">
											<input type="submit" value="정지"><input type="button" value="취소" onclick="closeForm(${sts.index})">
										</form>
										</div>
									</td>
									<td></td>
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