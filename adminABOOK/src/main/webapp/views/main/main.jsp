<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#leftBox .iplus{
		position: absolute;
		top: 4px;
		right: 0;
		width:38px;
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
</style>
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
			<svg class="iplus" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path>
			</svg>
			<div id="noticList"> 
				<ul>
					<li>
						<a href="#">대한민국 독서대전 소문내기 이벤트1</a>
						<span class="date">2023.08.07</span>
					</li>
					<li>
						<a href="#">대한민국 독서대전 소문내기 이벤트2</a>
						<span class="date">2023.08.07</span>
					</li>
					<li>
						<a href="#">대한민국 독서대전 소문내기 이벤트3</a>
						<span class="date">2023.08.07</span>
					</li>
					<li>
						<a href="#">대한민국 독서대전 소문내기 이벤트4</a>
						<span class="date">2023.08.07</span>
					</li>
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
					※ 휴관일: 첫째, 셋째 월요일 신정, 설날 및 추석연휴<br>
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
			<p>도서관 이용시간</p>
		</div>
	</div>
	<div id="sectionGroup2">
		<div>
			
		</div>
	</div>
</body>
</html>