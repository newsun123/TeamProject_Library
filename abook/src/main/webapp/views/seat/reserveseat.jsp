<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reserveWrap{
		width: 1300px;
		height: 860px;
		position: relative;
		border:4px solid #f1f1f1;
		float: left;
	    margin-left: 30px;
	    padding:7px;
	    text-align: left;
	}
	#reserveWrap h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		text-align:center;
		margin-bottom: 65px;
	    margin-top: 30px;
	}
#section {
	width:100%;
	margin:auto 0;
	margin-top:50px;
	margin-bottom:50px;
	position:relative;
}
.inner_right {
    width: 1000px;
    border: 2px solid #ccc;
    position: relative;
    height: 650px;
    margin:auto;
}
#notice1 {
	text-align: center;
	font-size:25px;
	margin-bottom:15px;
}
.pc_left_line {
	position: absolute;
    left: 60px;
    top: 65px;
}
.pc_right_line {
    position: absolute;
    left: 350px;
    top: 65px;
}
.pc_right_line_two {
	position: absolute;
	left: 350px;
    top: 490px;
}
.pc {
	width:40px;
	height:40px;
	border: 1px solid black;
	margin-left:2px;
	line-height:40px;
	margin-bottom:2px;
	text-align: center;
	cursor: pointer;
}
.nomal {
	width:40px;
	height:40px;
	border: 1px solid black;
	margin-left:2px;
	line-height:40px;
	margin-bottom:2px;
	text-align: center;
	cursor: pointer;
}
.pc_line {
	display:inline-block;
}
.pc_line_two {
	display:flex;	
	flex-direction: row;
	width: 452px;
    flex-wrap: wrap;
}

.pc_line_three {
	display:flex;	
	flex-direction: row;
	width: 452px;
    flex-wrap: wrap;	
}
.our {
	width:80px;
	height:30px;
	border:1px solid black;
}
#layer_background {
	position: fixed;
	top:0; left: 0; bottom: 0; right: 0;
	background: rgba(0, 0, 0, 0.8);
	display:none;
	z-index:100;
}
#layer {
    position: fixed;
    width: 50%;
    left: 46%;
    margin-left: -21%;
    height: 515px;
    top: 50%;
    margin-top: -220px;
    overflow: auto;
    border: 1px solid #000;
    background-color: white;
    padding: 1em;
    box-sizing: border-box;
}
.head {
	width:900px;
	height:50px;
	line-height:50px;
	text-align:center;
	font-size: 30px;
	margin-top:10px;	
}
.touter {
    width: 880px;
    position: absolute;
    left: 67px;
    top: 210px;
    display: flex;
    flex-wrap: wrap;
}
.time {
	width: 150px;
    height: 60px;
    border: 1px solid black;
    margin-left: 10px;
    margin-top: 20px;
    border-radius: 5px;
    text-align:center;
    line-height:60px;
	cursor:pointer;
}
#notice {
	margin-top: 4px;
    margin-left: 20px;
}
p {
	margin-top:2px;
	margin-bottom:0;
}
.sbouter {
	position:absolute;
    left: 354px;
    top: 432px;
}
input[type=submit] {	
	width:100px;
	height:30px;
	border:1px solid black;
}
input[type=button] {
	width:100px;
	height:30px;
}
#end {
	clear: both;
}
</style>
<script>
	function reservePc(n) {
		document.getElementById("layer_background").style.display="inline-block";
		const num = document.getElementsByClassName("pc")[n];
		//ReserveSeatVo rvo = new ReserveSeatVo();
		const cyd = new XMLHttpRequest();
		cyd.onload = function() {
			//rvo = cyd.responseText;
		}
		cyd.open("GET","reservePc?num="+num);
		cyd.send();
	} 
	
	function reserveNomal(my) {
		document.getElementById("layer_background").style.display="inline-block";
	}
	
	function checktime(n, my) {
		var t = document.getElementsByClassName("chktime")[n];
		const chk = document.querySelectorAll('input[type="checkbox"]:checked');
		if (t.checked) {
			t.checked = false;
			my.style.background ="white";
		} else {
			t.checked = true;
			my.style.background ="green";
			if (chk.length > 2) {
				alert("최대 3시간까지 가능합니다.");
				my.style.background ="white";
				t.checked = false;
			}
		}
	}
	
	function check(my) {
		const chk = document.querySelectorAll('input[type="checkbox"]:checked');
		if (chk.length > 3) {
			alert("최대 3시간까지 가능합니다.");
			return false;
		} else if (chk.length == null) {
			alert("시간을 예약하세요");
			return false;
		} else {
			return true;
		}
	}
	function hideLayer() {
		document.getElementById("layer_background").style.display="none";
		const chk = document.getElementsByClassName("chktime").length;
		for(i=0; i <= chk ; i++) {
			if(document.getElementsByClassName("chktime")[i].checked){
				document.getElementsByClassName("chktime")[i].checked = false;
				document.getElementsByClassName("time")[i].style.background ="white";
				document.getElementById("userid").innerText="";
				
			}
		}
	}
</script>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>회원정보</span></h2>
			<ul id="lnb">
				<li class="on"><a href="/seat/rulelibrary"><span>이용규칙</span></a></li>
				<li><a href="/seat/reserveseat"><span>좌석예약</span></a></li>
			</ul>
		</div>
		<div id="reserveWrap">
		<h3> 좌석 당일 예약</h3>
		<div class="ruletab">
	<div class="inner_right">
		<div class="pc_left_line">
			<div class="pc_line">
				<div class="pc" onclick="reservePc(0)">pc1</div>
				<div class="pc" onclick="reservePc(1)">pc2</div>
				<div class="pc" onclick="reservePc(2)">pc3</div>
				<div class="pc" onclick="reservePc(3)">pc4</div>
				<div class="pc" onclick="reservePc(4)">pc5</div>
				<div class="pc" onclick="reservePc(5)">pc6</div>
				<div class="pc" onclick="reservePc(6)">pc7</div>
				<div class="pc" onclick="reservePc(7)">pc8</div>
				<div class="pc" onclick="reservePc(8)">pc9</div>
				<div class="pc" onclick="reservePc(9)">pc10</div>
				<div class="pc" onclick="reservePc(10)">pc11</div>
				<div class="pc" onclick="reservePc(11)">pc12</div>
			</div>
			<div class="pc_line">
				<div class="pc" onclick="reservePc(12)">pc13</div>
				<div class="pc" onclick="reservePc(13)">pc14</div>
				<div class="pc" onclick="reservePc(14)">pc15</div>
				<div class="pc" onclick="reservePc(15)">pc16</div>
				<div class="pc" onclick="reservePc(16)">pc17</div>
				<div class="pc" onclick="reservePc(17)">pc18</div>
				<div class="pc" onclick="reservePc(18)">pc19</div>
				<div class="pc" onclick="reservePc(19)">pc20</div>
				<div class="pc" onclick="reservePc(20)">pc21</div>
				<div class="pc" onclick="reservePc(21)">pc22</div>
				<div class="pc" onclick="reservePc(22)">pc23</div>
				<div class="pc" onclick="reservePc(23)">pc24</div>
			</div>
		</div>
		<div class="pc_right_line">
			<div class="pc_line_two">
				<div class="nomal" onclick="reserveNomal()">N1</div>
				<div class="nomal" onclick="reserveNomal()">N2</div>
				<div class="nomal" onclick="reserveNomal()">N3</div>
				<div class="nomal" onclick="reserveNomal()">N4</div>
				<div class="nomal" onclick="reserveNomal()">N5</div>
				<div class="nomal" onclick="reserveNomal()">N6</div>
				<div class="nomal" onclick="reserveNomal()">N7</div>
				<div class="nomal" onclick="reserveNomal()">N8</div>
				<div class="nomal" onclick="reserveNomal()">N9</div>
				<div class="nomal" onclick="reserveNomal()">N10</div>
				<div class="nomal" onclick="reserveNomal()">N11</div>
				<div class="nomal" onclick="reserveNomal()">N12</div>
				<div class="nomal" onclick="reserveNomal()">N13</div>
				<div class="nomal" onclick="reserveNomal()">N14</div>
				<div class="nomal" onclick="reserveNomal()">N15</div>
				<div class="nomal" onclick="reserveNomal()">N16</div>
				<div class="nomal" onclick="reserveNomal()">N17</div>
				<div class="nomal" onclick="reserveNomal()">N18</div>
				<div class="nomal" onclick="reserveNomal()">N19</div>
				<div class="nomal" onclick="reserveNomal()">N20</div>
			</div>
		</div>
		<div class="pc_right_line_two">
			<div class="pc_line_three">
				<div class="nomal" onclick="reserveNomal()">N21</div>
				<div class="nomal" onclick="reserveNomal()">N22</div>
				<div class="nomal" onclick="reserveNomal()">N23</div>
				<div class="nomal" onclick="reserveNomal()">N24</div>
				<div class="nomal" onclick="reserveNomal()">N25</div>
				<div class="nomal" onclick="reserveNomal()">N26</div>
				<div class="nomal" onclick="reserveNomal()">N27</div>
				<div class="nomal" onclick="reserveNomal()">N28</div>
				<div class="nomal" onclick="reserveNomal()">N29</div>
				<div class="nomal" onclick="reserveNomal()">N30</div>
				<div class="nomal" onclick="reserveNomal()">N31</div>
				<div class="nomal" onclick="reserveNomal()">N32</div>
				<div class="nomal" onclick="reserveNomal()">N33</div>
				<div class="nomal" onclick="reserveNomal()">N34</div>
				<div class="nomal" onclick="reserveNomal()">N35</div>
				<div class="nomal" onclick="reserveNomal()">N36</div>
				<div class="nomal" onclick="reserveNomal()">N37</div>
				<div class="nomal" onclick="reserveNomal()">N38</div>
				<div class="nomal" onclick="reserveNomal()">N39</div>
				<div class="nomal" onclick="reserveNomal()">N40</div>
			</div>
		</div>
		</div>
	</div>
</div>
</div>
</div>		
<div id="layer_background">
	<div id="layer">
		<div class="head">
			{bvo.userid}님의 선택 좌석 : ${rvo.no }번 <p>
		</div>
			<div id="notice">
				<p> 본 도서관은 1인 최대 3시간까지 좌석 배정이 가능합니다. </p>
				<p> * 흰색 : 예약 가능 </p> 
				<p> * 주황색 : 예약 중 </p>
				<p> * 회  색 : 예약 불가 </p>
			</div>
			<form name="cf" method="post" action="reserve" onsubmit="return check(this)">
				<div class="touter">
					<div class="time" onclick="checktime(0,this)">9시~10시</div><input type="checkbox" name="chktime" class="chktime" value="time9"style="display:none;">
					<div class="time" onclick="checktime(1,this)">10시~11시</div><input type="checkbox" name="chktime" class="chktime" value="time10" style="display:none;">
					<div class="time" onclick="checktime(2,this)">11시~12시</div><input type="checkbox" name="chktime" class="chktime" value="time11" style="display:none;">
					<div class="time" onclick="checktime(3,this)">12시~13시</div><input type="checkbox" name="chktime" class="chktime" value="time12" style="display:none;">
					<div class="time" onclick="checktime(4,this)">13시~14시</div><input type="checkbox" name="chktime" class="chktime" value="time13" style="display:none;">
					<div class="time" onclick="checktime(5,this)">14시~15시</div><input type="checkbox" name="chktime" class="chktime" value="time14" style="display:none;">
					<div class="time" onclick="checktime(6,this)">15시~16시</div><input type="checkbox" name="chktime" class="chktime" value="time15" style="display:none;">
					<div class="time" onclick="checktime(7,this)">16시~17시</div><input type="checkbox" name="chktime" class="chktime" value="time16" style="display:none;">
					<div class="time" onclick="checktime(8,this)">17시~18시</div><input type="checkbox" name="chktime" class="chktime" value="time17" style="display:none;">
					<div class="time" onclick="checktime(9,this)">18시~19시</div><input type="checkbox" name="chktime" class="chktime" value="time18" style="display:none;">
				</div>
				<div class="sbouter">
					<input type="text" name="userid" placeholder="userid" id="userid">
					<input type="submit" value="좌석예약">
					<input type="button" value="뒤로가기" onclick="hideLayer()">
				</div>
			</form>
	</div>
</div>
<div id="end"></div>
</body>
</html>