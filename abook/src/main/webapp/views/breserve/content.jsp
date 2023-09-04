<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gongjiWrap{
		padding-bottom: 30px;
	}
	form{
		width: 100%;
	    display: block;
	}
	table#table1{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #666;
	}
	table#table1 tr{
		height: 300px;
	}
	table#table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table#table1 tr td:nth-child(1){
	    width: 220px;
	    padding: 30px 0;
	}
	table#table1 tr td:nth-child(1) > div{
		width: 220px;
		height: 300px;
	}
	table#table1 img{
	    width: 100%;
	    height:100%;
	    box-sizing: border-box;
    	border: 1px solid #e2e2e2;   	   
	}
	#conBox{
		margin-left: 30px;
		padding: 30px 0;
		height: 370px;
	}
	#conBox > div{
		height: 45px;
    	line-height: 45px;
	}
	.aa{
		font-family: 'NotoSansM';
		font-size: 20px;
	}
	.bb{
		color:#777;
	}
	.bb span{
		margin-left: 20px;
	}
	.cc{
		color:#777;
	}
	.dd{
		color: #555;
	}
	.ee{
		color:#444;
	}
	.rbtn{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	}
	table#table2{
		margin-top: 100px;
		text-align: center;
	}
	table#table2 caption{
		text-align: left;
	    height: 80px;
	    font-size: 25px;
	    font-family: 'NotoSansM';
	}
	table#table2 tr:first-child td{
		border-top: 2px solid #666;
		background-color: #f9f9fb;
    	border-bottom:1px solid #666;
    	height: 55px;
    	color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	}
	table#table2 tr td:nth-child(1) {
		width: 170px;
	}
	table#table2 tr td:nth-child(2) {
		width: 140px;
	}
	table#table2 tr td:nth-child(3) {
		width: 190px;
	}
	table#table2 tr td:nth-child(4) {
		width: 150px;
	}
	table#table2 tr td:nth-child(5) {
		width: 330px;
	}
	table#table2 tr {
		height: 60px;
	}
	table#table2 tr td{
		border-bottom: 1px solid #e2e2e2;
	}
	.resBtn{
		background: #967759;
	    border: 1px solid #967759;
	    color: #fff;
	    font-size: 14px;
	    width: 110px;
	    height: 41px;
	    border-radius: 3px;
	}
	.resBtn.dis{
		border: 1px solid #ddd;
		background: #e0e3e6;
    	color: #6e7277;
    	cursor:default;
    	pointer-events:none;
	}
</style>
<script>
	function bresCheck(my){
		var parent=my.parentNode.parentNode;
	    var inputbocde=parent.getElementsByClassName('bcode');
	    var bcode=inputbocde[0].value;
		location="bresOk?bcode="+bcode+"&page="+${page};
	}
</script>
</head>

<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관이용</span></h2>
				<ul id="lnb">
					<li class="on"><a><span>도서예약</span></a></li>
					<li><a href="#"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서예약</h3>
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서예약</p>
				</div>
				<div id="contents">
					<div id="bookregiWrap">
						<a href="/breserve/list" class="rbtn">목록으로</a>
						<table id="table1">
							<tr>
								<td>
									<div>
										<img src="/static/img/breserve/${mapall.get(0).bimg}">					
									</div>
								</td>
								<td>
									<div id="conBox">
										<div class="aa">${mapall.get(0).title}</div>
										<div class="bb">${mapall.get(0).publi}<span>${blist.get(0).writer} 지음</span></div>
										<div class="cc">${mapall.get(0).writeyear}</div>
										<div class="dd">소장도서관 : 작은 도서관</div>
										<div class="ee">${mapall.get(0).ect}</div>
									</div>
								</td>
							</tr>
						</table>	
						<table id="table2">
							<caption>소장정보</caption>
							<tr>
								<td>도서관</td>
								<td>번호</td>
								<td>대출상태</td>
								<td>예약상태</td>
								<td>반납예정일</td>
								<td>도서예약</td>
							</tr>
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td>작은도서관</td>
								<td>
									${fn:substring(map.bcode,4,6)}
								</td>
								<td>
								<c:if test="${map.state==0}">
									대출가능
								</c:if>
								<c:if test="${map.state==1}">
									대출불가(예약중)
								</c:if>
								<c:if test="${map.state==2}">
									대출불가(대출중)
								</c:if>
								</td>
								<td>
								<c:if test="${map.state==0}">
									0
								</c:if>
								<c:if test="${map.state==1}">
									1
								</c:if>
								<c:if test="${map.state==2}">
									1
								</c:if>
								</td>
								<td>
								</td>

								<td>
								<c:if test="${map.state==0}">
									<input type="hidden" value="${map.bcode}" name="bocde" class="bcode">
									<input type="button" value="도서예약" class="resBtn" onclick="bresCheck(this)">
								</c:if>
								<c:if test="${map.state==1}">
									<input type="button" value="예약중" class="resBtn dis">
								</c:if>
								<c:if test="${map.state==2}">
									<input type="button" value="대출중" class="resBtn dis">
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