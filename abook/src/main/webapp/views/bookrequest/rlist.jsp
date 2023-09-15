<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#requestWrap{
		position:relative;
    	min-height: 350px;
	}
	form{
		width: 100%;
	    display: block;
	}
	#search{
		padding:10px 20px;
		border-radius:5px;
		color:#fff;
		margin-bottom:40px;
		width:100px;
		background:#93765a;
	}
	#searchCon{
		width:630px;
		position:relative;
		right:0;
		display:flex;
		justify-content:space-between;
		align-items:center;
	}
	#select{
		display: inline-block;
	    width: 148px;
	    position: relative;
	    height: 48px;
	    border: 1px solid #e2e2e2;
	    background-color: #fff;
	}
	#select .selected{
		display: flex;
	    justify-content: space-between;
	    padding: 0;
	    cursor: pointer;
	}
	#select .selected_value{
		display: inline-block;
	    font-size: 16px;
	    width: calc(100% - 60px);
	    line-height: 44px;
	    text-align: left;
	    margin-left: 18px;
	}
	#select .arrow{
		width: 42px;
   		background: url(/static/img/common/ic_arrow.png) no-repeat 50% 50%;
	}
	#select ul{
	    width: 148px;
	    border: 1px solid #d6dae6;
	    position: absolute;
	    left: -1px;
	    z-index: 999;
	    background: #fff;
	    border-top: none;
	    
	    top: 47px;	
	    display: none;
	}
	#select ul li{
	    font-size: 16px;
	    padding: 0 20px;
	    line-height: 38px;
	    height: 38px;
	    border-bottom: 1px solid #eee;
	    cursor:pointer;
	}
	#select ul li:last-child{
		border:none;
	}
	#select ul li:hover{
		display: block;
		background-color:#ebeef7;
	}
	input.searchtext{
		border-radius: 0!important;
	    height: 48px!important;
	    vertical-align: top!important;
	    width: 500px;
	}
		/*page버튼처리*/
	#btWrap{
	    margin-top: 30px;
	    position: relative;
	    height: 50px;
	    text-align: center;
	}
	#pageCon{
    	margin: auto;
	}
	#pageCon a{
		display: inline-block;
	    width: 30px;
	    font-size: 1.125em;
	    color: #666;
	    line-height: 30px;
	    text-align: center;
	    vertical-align: top;
	}
	#pageCon .btnPage{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	}
	#pageCon .btnPage.prev{
		margin-right: 5px;
    	background-position-y: -27px;
	}
	#pageCon .btnPage.next{
		margin-left: 5px;
    	background-position-y: -52px;
	}
	#pageCon .btnPage.last{
		background-position-y: -77px;
	}
	#pageCon .btnPage.dis{
		pointer-event:none;
		cursor:default;
	}
	/*page버튼처리끝*/
	table {
		border-top: 2px solid #cecece;
		text-align: center;
	}	
	table tr {
		height: 55px;
	}	
	table tr:first-child {
		background: #f8f8fa;
	}	
	table tr td {
		border-bottom: 1px solid #e4e4e4;
	}	
	.writebtn{
		display: inline-block;
	    border: 1px solid #93765a;
	    color: #93765a;
	    padding: 0 23px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	    position: absolute;
	    top: 0;
	    right: 0;
	    font-size: 15px;
	}
	.el{
		text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow: hidden;
	    width: 591px;
	    height: 100%;
	    text-align: left;
	}
</style>
<script>
	window.onload=function(){
		<c:if test="${type!=null}">
		   <c:if test="${type=='title'}">
		     <c:set var="aa" value="도서명"/>
		   </c:if>
		   <c:if test="${type=='writer'}">
		     <c:set var="aa" value="저자"/>
		   </c:if>
		   <c:if test="${type=='publi'}">
		     <c:set var="aa" value="출판사"/>
		   </c:if>
			<c:if test="${type=='aa'}">
				<c:set var="aa" value="전체"/>
			</c:if>
			document.getElementById("sv").innerText="${aa}";
		</c:if>
		 
	}
	var schk=0;
	function selectView(){
		
		if(schk==0){
			document.getElementById("type").style.display="block";
			document.getElementsByClassName("arrow")[0].style.transform="rotate(180deg)";
			schk=1;
		}else{
			document.getElementById("type").style.display="none";
			document.getElementsByClassName("arrow")[0].style.transform="rotate(0)";
			schk=0;
		}
	}
	function inputWr(txt){
 
		if(txt=="전체"){
			document.getElementsByClassName("selected_value")[0].innerText="전체";
			document.getElementById("seltype").value="aa";  // titlewriterpubli
			// aa로 value값을 줘서 impl
		}
		else if(txt=="도서명"){
			document.getElementsByClassName("selected_value")[0].innerText="도서명";
			document.getElementById("seltype").value="title";
		}else if(txt=="저자"){
			document.getElementsByClassName("selected_value")[0].innerText="저자";
			document.getElementById("seltype").value="writer";
		}
			else if(txt=="출판사"){
				document.getElementsByClassName("selected_value")[0].innerText="출판사";
				document.getElementById("seltype").value="publi";
			}
		document.getElementById("type").style.display="none";
		schk=0;
		document.getElementsByClassName("arrow")[0].style.transform="rotate(0)";
	}
</script>
</head>
<body >
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관이용</span></h2>
				<ul id="lnb">
					<li><a href="/breserve/list"><span>도서예약</span></a></li>
					<li class="on"><a href="/bookrequest/rlist"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서신청</h3>
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서신청</p>
				</div>
				<div id="contents">
					<div id="requestWrap">
					<c:if test="${userid == null}">
						<a href="/member/login" onclick="alert('비로그인 상태에서는 신청할 수 없습니다.')" class="writebtn">신청하기</a>
					</c:if>
					<c:if test="${userid != null}">
						<a href="requestwrite" class="writebtn">신청하기</a>
					</c:if>
							<form name="rform" method="post" action="rlist">
								<input type="hidden" value="${type}" name="type" id="seltype">
								<input type="hidden" value="${keyword}">
								<div id="select">
									<div class="selected" onclick="selectView()">
										<div class="selected_value" id="sv">전체</div>		
										<div class="arrow"></div>
									</div>
									<ul id="type">
										<li class="option" id="notype" onclick="inputWr('전체')">전체</li>
										<li class="option" id="title" onclick="inputWr('도서명')">도서명</li>
										<li class="option" id="writer" onclick="inputWr('저자')">저자</li>
										<li class="option" id="publi" onclick="inputWr('출판사')">출판사</li>
									</ul>
								</div>
								<input type="text" class="searchtext" name="keyword" maxlength="100" placeholder="검색어 입력" value="${keyword}">
								<input type="submit" id="search" class="searchtext" value="검색">
							</form>
						<table>
							<tr>
								<td width="100"> 번호 </td>
								<td width="49"></td>
								<td width="591"> 도서명 </td>
								<td width="150"> 신청자 </td>
								<td width="150"> 신청일 </td>
								<td width="130"> 처리상태 </td>
							</tr>	
							
							<c:forEach items="${rlist}" var="brvo" varStatus="sts">
								<tr>
									<input type="hidden" name="userid" id="userid" value="${brvo.userid}">
									<input type="hidden" name="sessionuserid" id="sessionuserid" value="${userid}">
									<%-- <td>${userid},${brvo.userid}</td> --%>
									<td>${sts.index+1}</td>
									<td>
									<c:if test="${brvo.gonge==0}">
										&nbsp;
									</c:if>
									<c:if test="${brvo.gonge==1}">
										<img src="/static/img/bookrequest/lock.png" id="rimg">
									</c:if>	
									</td>
									<td>
									<c:if test="${userid != brvo.userid && brvo.gonge == 1 && userid != null}"><!-- 유저아이디는 다른데 비공개글일경우 -->	
										<div class="el"><a onclick="alert('비공개글은 작성자가 아니면 볼 수 없습니다.')">${brvo.title}</a></div>
									</c:if>
									<c:if test="${userid != brvo.userid && brvo.gonge == 0 && userid != null}"><!-- 유저아이디는 다른데 공개글일경우 -->
										<div class="el"><a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a></div>
									</c:if>
									<c:if test="${userid == brvo.userid && brvo.gonge == 0}"><!-- 유저아이디가 같을경우 공개글 -->
										<div class="el"><a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a></div>
									</c:if>
									<c:if test="${userid == brvo.userid && brvo.gonge == 1}"><!-- 유저아이디가 같을경우 비공개글 -->
										<div class="el"><a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a></div>
									</c:if>
									
									<c:if test="${userid == null && brvo.gonge == 1}"><!-- 로그인 안했을경우 비공개글 -->
										<div class="el"><a href="/member/login?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}" onclick="alert('비공개글은 작성자가 아니면 볼 수 없습니다.')">${brvo.title}</a></div>
									</c:if>
									<c:if test="${userid == null && brvo.gonge == 0}"><!-- 로그인 안했을경우 공개글 -->
										<div class="el"><a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a></div>
									</c:if>
									</td>
									<td> ${brvo.userid} </td>
									<td> ${brvo.writeday} </td>
									<td> 
										<c:choose>
											<c:when test="${brvo.state==0}">
												신청중
											</c:when>
											<c:when test="${brvo.state==1}">
												신청완료
											</c:when>
											<c:when test="${brvo.state==2}">
												취소됨
											</c:when>
										</c:choose>							
									 </td>
								</tr>
							</c:forEach>
						</table>
						<div id="btWrap">
							<div id=pageCon>
							<c:if test="${pstart!=1}">
								<a href="list?page=${pstart-1}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a> 
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="list?page=${page-1}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="list?page=${i}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="list?page=${i}" style="background-color: #555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
							<c:if test="${page!=chong}">
								<a href="list?page=${page+1}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							<c:if test="${pend!=chong}">
								<a href="list?page=${pend+1}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a> 
							</c:if>	
							</div>			
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>