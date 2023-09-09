<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	#mainBg{
		width: 100%;
		height: 400px;
		position: relative;
	}
	#mainBg > img{
	    object-fit: cover;
	    width: 100%;
	    height: 400px;
	    background-position: top;
	    object-position: 0px -750px;
	}
	#search{
		position: absolute;
		top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 900px;
	    height: 65px;
	    border:4px solid #fff;
	    background:transparent;
	}
	#search input{
	    width:840px;
	    height:100%;
		border: none;
		padding: 0 10px;
		background: transparent;
		color:#fff;
		font-size: 18px;
	}
	#search input::placeholder {
	    font-size: 17px;
	    color:#fff;
	}
	#search #searchBtn{
		cursor: pointer;
		padding: 8px;
	    margin-right: 0px;
	    position: relative;
	    left: -9px;
	}
	#sectionGroup{
		width:1500px;
		margin:auto;
		margin-top: 80px;
		display: flex;
    	justify-content: space-between;
    	align-items: center;
	}
	#sectionGroup > div > p{
		font-size: 25px;
		font-family: NotoSansM;
		
	}
	#leftBox{
		position: relative;
		width: 450px;
	}
	#leftBox p{
		border-bottom: 1px solid #232321;
		height: 65px;
	}
	.imore{
		position: absolute;
	    top: 0;
	    right:0;
	    width: 40px;
	    height: 40px;
	    border-radius: 50%;
	    border: 1px solid #d6d6d6;
	    padding: 6px;
	}
	.imore a{
		display: block;
	    position: relative;
	    height: 100%;
	}
	.imore a::before,
	.imore a::after{
		content: "";
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -50%);
	    width: calc(100% - 12px);
	    height: 2px;
	    background-color: #777;
	}
	.imore a::after{
		transform: translate(-50%, -50%) rotate(90deg);
	}
	#leftBox ul li{
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    height: 50px;
	    border-bottom: 1px solid #dcdbe0;
	    position: relative;
	    color:#282828;
	    font-family: NotoSansM;
	}
	#leftBox ul li a{
		width: 356px;
	    height: 100%;
	    line-height: 50px;
		
	}
	#leftBox .date{
		color: #999;
	    font-family: NotoSansM;
	    width: 83px;
	    height: 100%;
	    line-height: 50px;
	    font-size: 14px;
	    text-align: center;
	}
	#centerBox{
	    width: 520px;
	    height: 265px;
	    display:flex;
	}
	#centerBox .lbx{
		width: 333px;
	    padding: 15px 20px;
	    background: #515665 url(/static/img/main/main_clock.png) right 10px bottom 20px no-repeat;
	    color: #fff;
	    height: 100%;
	    border-top-left-radius: 5px;
    	border-bottom-left-radius: 5px;
	}
	.lbx > p{
		font-size: 25px;
	    font-family: NotoSansM;
	    margin-bottom: 30px;
	}
	.lbx span{
		font-size: 14px;
	}
	.lbx .intime{
    	margin-left: 20px;
	}
	.lbx .ltxt{
		font-size: 12px;
	    margin-top: 20px;
	}
	#centerBox .rbx{
		width: 187px;
	    padding: 15px 20px;
	    background: #ebebeb;
	    color: #515665;
	    height: 100%;
	    border-top-right-radius: 5px;
    	border-bottom-right-radius: 5px;
	}
	.rbx > p{
		font-size: 25px;
	    font-family: NotoSansM;
	    margin-bottom: 30px;
	}
	.rbx img{
		position: relative;
	    top: -5px;
	    left: 37px;
	    width: 80px;
	}
	.rbx > div{
		font-size: 14px;
	    font-weight: bold;
	    line-height: 32px;
	    margin-top: 18px;
	    margin-left: 15px;
	}
	#rigthBox{
		border: 1px solid;
	    width: 450px;
	    height: 265px;
	}
	#sectionGroup2{
		width:1500px;
		margin:auto;
		margin-top: 80px;
		display: flex;
    	justify-content: space-between;
    	align-items: center;
		
	}
	#leftB{
		width: 1160px;
	}
	#bTxt{
		width: 100%;
		height: 100px;
	}
	#bTxt ul{
		display: flex;
	}
	#bTxt ul li{
		height:100%;
	    font-size: 25px;
	    font-family: NotoSansM;
	    color:#777;
	    cursor: pointer;
	    margin-right: 34px;
	}
	#bTxt ul li.act{
		color: #333;
	    border-bottom: 3px solid #c5425a;
	    border-color: #c10547;
	}
	#bconWrap .bcon{
		display: none;
	}
	#bconWrap .bcon.act{
		display: block;
		transition: opacity 0.15s linear;
	}
	.bcon ul{
		display: flex;
    	justify-content: space-between;
    	align-items: center;
	}
	.bcon ul li{
		width: 160px;
		height: 230px;
	}
	.bcon ul li a{
		width: 100%;
		height: 100%;
	}
	.bcon img{
		width: 100%;
	    object-fit: cover;
	    height: 100%;
	}
	#rightB{
	    width: 260px;
	    height: 330px;
	    background: #ebf4ff;
	    padding: 15px;
	    border-radius: 5px;
	    box-shadow: 5px 5px 10px rgba(0,0,0,.07);
	    color: #494949;
    	font-family: NotoSansM;
	}
	#rightB > p{
		text-align: center;
	    font-size: 19px;
	    margin-bottom: 15px;
	    margin-top: 15px;
	}
	#rightB table{
		font-size:14px;
		color:#494949;
	}
	#rightB tr{
		height: 40px;
	}
	#rightB tr:first-child td{	
		border-top: 1px solid rgba(94, 94, 94, 0.6);
    	border-bottom: 1px solid rgba(94, 94, 94, 0.6);
	}
	#rightB tr td{
		text-align: center;
	}
	#rightB tr td.blue{
		color:#2953bf;
	}
	#rightB tr td.red{
		color:#d20444;
	}
	#rightB tr td:first-child {
		text-align: left;
	}
	#rightB tr td:nth-child(2) {
		width: 33px;
	}
	#rightB tr td:nth-child(3) {
		width: 70px;
	}
	#rightB tr td:nth-child(4) {
		width: 42px;
	}
	#rightB .tt{
		font-size: 12px;
   		line-height: 30px;
	}
	#rightB .reBtn{
	    width: 200px;
	    display: inline-block;
	    height: 40px;
	    border: 1px solid;
	    text-align: center;
	    line-height: 40px;
	    font-size: 15px;
	    position: relative;
	    left: 15px;
	    top: 18px;
	}
</style>
<script>
	$(function(){
		$("#bTxt > ul > li").click(function(){
			var idx=$(this).index();
			$(this).addClass('act').siblings().removeClass('act');
			$("#bconWrap .bcon").eq(idx).addClass('act').siblings().removeClass('act');
		});
		
	});
	
	function calView2(d)
	{
		var today=new Date();
		var y=today.getFullYear();
		var m=today.getMonth();
		
		var xday=new Date(y,m,1); // 해당 달(월)
		var yoil=xday.getDay();
		
		var month=[31,28,31,30,31,30,31,31,30,31,30,31];
		var chong=month[m];
		
		if( (y%4 == 0 && y%100 !=0) || y%400 ==0 )
		{
			if( m == 1)	
				chong=chong+1;
		}
		
		var ju=Math.ceil( (chong+yoil)/7 );
		
		var calData="<table width='200' height='50' border='0' id='cal'>";
		
		calData=calData+y+"년 "+(m+1)+"월";
		
		calData=calData+"<tr align='center'>";

		var n=yoil-5;
		if(n == 1)
			n == 6;
		
		var chk=Math.abs(n)+1;
		var str=chk+",";
		
		while(chk+7 <= chong)
		{
			var friday = chk + 7;
			
			if(friday > chong)
			{
				friday = friday - chong;
			}
			
			str=str+friday+",";
			chk=chk+7;
			str=str.replace(/,/g,"일 "); 
		}
		 
		 
		calData=calData+"</tr>";
		calData=calData+"<tr><td colspan='7'>" +str+ "</td></tr>";

		document.getElementById("calenderMain").innerHTML=calData;
	}
	
	window.onload=function()
	{
		calView2();
	}
</script>
</head>
<body>
	<div id="mainBg">
		<img src="/static/img/main/main_bg.jpg"> 
		<div id="search">
			<input type="text" name="search" placeholder="도서이름, 출판사, 저자를 입력하세요.">
			<img id="searchBtn" src="/static/img/main/search_icon.png">
		</div>
	</div>
	<div id="sectionGroup">
		<div id="leftBox">
			<p>공지사항</p>
			<div class="imore"><a href="/gongji/list"></a></div>
			<div id="noticList"> 
				<ul>
				<c:forEach items="${glist}" var="glist">
					<li onclick="location='../gongji/content?no=${glist.no}'">
						<a>${glist.title}</a>
						<span class="date">${glist.writeday}</span>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div id="centerBox">
			<div class="lbx">
				<p>도서관 이용시간 안내</p>
				<div><span class="inroom">- 자료열람실</span><span class="intime">9:00~18:00</span></div>
				<div><span class="inroom">- 일반열람실</span><span class="intime">9:00~18:00</span></div>
				<div><span class="inroom">- 국학열람실</span><span class="intime">9:00~17:30</span></div>
				<div><span class="inroom">- 전자정보실</span><span class="intime">9:00~18:00</span></div>
				<div class="ltxt">
					※ 휴관일: 매주 금요일 및 법정공휴일<br>
					※ 자료 열람실은 매주 월요일 및 법정공휴일에 휴실합니다.
				</div>
			</div>
			<div class="rbx">
				<p>이용문의 안내</p>
				<img src="/static/img/main/main_tel.png">
				<div>
					Tel : 031-123-4567<br>
					Fax : 031-123-4567
				</div>
			</div>
		</div>
		<div id="rigthBox">
			<p>이달의 휴관일 안내</p>
			<div>
				<div id="calenderMain"> 
					
				</div>	
			</div>
		</div>
	</div>
	<div id="sectionGroup2">
		<div id="leftB">
			<div id="bTxt">
				<ul>
					<li class="act">인기도서</li>
					<li>신착도서</li>
				</ul>
			</div>
			<div id="bconWrap">
				<div class="bcon act">
					<ul>
						<li><a href=""><img src="/static/img/main/b1_1.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b1_2.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b1_3.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b1_4.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b1_5.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b1_6.jpg"></a></li>
					</ul>
				</div>
				<div class="bcon">
					<ul>
						<li><a href=""><img src="/static/img/main/b2_1.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b2_2.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b2_3.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b2_4.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b2_5.jpg"></a></li>
						<li><a href=""><img src="/static/img/main/b2_6.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="rightB">
			<p>좌석/실 잔여 현황 및 예약</p>
			<table>
				<tr>
					<td>열람실</td>
					<td>전체</td>
					<td>사용</td>
					<td>잔여석</td>
				</tr>
				<tr>
					<td>일반좌석</td>
					<td>40</td>
					<td class="blue">${nomal}</td>
					<td class="red">${setN}</td>
				</tr>
				<tr>
					<td>PC좌석</td>
					<td>24</td>
					<td class="blue">${pc}</td>
					<td class="red">${setPc}</td>
				</tr>
			</table>
			<div class="tt">
				※ 1회 최대 3시간 사용가능<br>
				※ 이용문의: 031-123-4567
			</div>
			<a href="#" class="reBtn">좌석 예약하기</a>
		</div>
	</div>
</body>
</html>