<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loanstatusWrap{
		padding-bottom: 80px;
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #666;
	}
	table tr{
		height: 60px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
		text-align: center;
	}
	table tr:first-child td{
		border-top: 2px solid #666;
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #666;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	}
	table tr td.ta{
		text-align: center!important;
	}
	table tr td:nth-child(1) {
		width: 490px;
		text-align: left;
		padding-left: 20px;
	}
	table tr td:nth-child(2) {
		width: 172px;
	}
	table tr td:nth-child(3) {
		width: 172px;
	}
	table tr td:nth-child(4) {
		width: 172px;
	}
	input[type=button]{
		cursor: pointer;
	    font-size: 14px;
	    display: inline-block;
	    border: 1px solid #3d6cc4;
	    border-radius: 3px;
	    color: #3d6cc4;
	    padding: 0 30px;
	    line-height: 40px;
	    height: 42px;
	    background: #fff;
	    margin-right: 5px;
	}
	input[type=button]#btn2{
		margin-right: 0;
	}
	table tr td .el{
		text-overflow: ellipsis;
	    overflow: hidden;
	    white-space: nowrap;
	    width: 490px;
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
					<li><a href="/reservestatus/list"><span>예약현황</span></a></li>
					<li class="on"><a href="/loanstatus/list"><span>대출현황</span></a></li>
					<li><a href="/loanlist/list"><span>대출이력</span></a></li>
					<li><a href="/bookrequest/hopelist"><span>희망도서</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>대출현황</h3>
					<p>도서 관리&nbsp;&nbsp;>&nbsp;&nbsp;대출현황</p>
				</div>
				<div id="contents">
					<div id="loanstatusWrap">
						<table>
							<tr>
								<td>도서명</td>
								<td>회원아이디</td>
								<td>대출일</td>
								<td>반납예정일</td>
								<td>상태</td>
							</tr>
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td><div class="el">${map.title}</div></td>
								<td>${map.userid}</td>
								<td>${map.rental}</td>
								<td>${map.returnday}</td>
								<td>대출중</td>
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