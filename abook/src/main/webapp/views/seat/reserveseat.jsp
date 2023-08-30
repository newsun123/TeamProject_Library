<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reserveWrap{
    position: relative;
    border: 4px solid #f1f1f1;
    padding: 7px;
    text-align: center;
	}
	#reserveWrap h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		text-align:center;
		margin-bottom: 65px;
	    margin-top: 30px;
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
.chktime {
	display:none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	function tableName(n) {
		var tname = document.getElementsByClassName("tablename")[n].innerText;
		alert(tname);
		var cyd = new XMLHttpRequest();
		cyd.onload = function() {
			//alert(cyd.responseText);
			var aa = JSON.parse(cyd.responseText);
			document.getElementById("layer_background").style.display = "inline-block"; //레이어 표시
			document.getElementById("tn").innerText = aa.tname; // 레이어창 tname 표시
			document.cf.tname.value= aa.tname; //tname값 입력
			for(i=9; i<19; i++) {
				if(eval("aa.time"+i) == 1) {
					eval("document.getElementById('time"+i+"').style.background='gray'");
					eval("document.getElementById('time"+i+"').style.pointerEvents='none'");
				}
			}	
		}
		cyd.open("GET", "tableName?tname="+tname);
		cyd.send();
	}
	function hideLayer() {
		document.getElementById("layer_background").style.display = "none";
		var chk = document.getElementsByClassName("chktime").length;
		for (i = 0; i <= chk; i++) {
			if (document.getElementsByClassName("chktime")[i].checked) {
				document.getElementsByClassName("chktime")[i].checked = false;
				document.getElementsByClassName("time")[i].style.background = "white";
				document.getElementById("userid").innerText = "";

			}
		}
	}

	function checktime(n, my) {
		var t = document.getElementsByClassName("chktime")[n];
		const chk = document.querySelectorAll('input[type="checkbox"]:checked');
		if (t.checked) {
			t.checked = false;
			my.style.background = "white";
		} else {
			t.checked = true;
			my.style.background = "green";
			if (chk.length > 2) {
				alert("최대 3시간까지 가능합니다.");
				my.style.background = "white";
				t.checked = false;
			}
		}
	}

	function check(my) {
		var chk = document.querySelectorAll('input[type="checkbox"]:checked');
		 if (chk.length > 3) {
			alert("최대 3시간까지 가능합니다.");
			return false;
		} else if (chk.length == 0) {
			alert("시간을 예약하세요");
			return false;
		}else {
			var chktime = document.getElementsByClassName("chktime");
			var len = chktime.length;
			alert(len);
			var arrychktime="";			
			for(i=0;i<len;i++){
				if(chktime[i].checked){
					chktime[i].value=1;
					arrychktime= arrychktime+chktime[i].value+",";
				}else {
					chktime[i].value=0;
					arrychktime= arrychktime+chktime[i].value+",";
				}
			}
		}
		 document.cf.arrychktime.value= arrychktime;
		return true;
	}
</script>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>열람실 이용</span></h2>
			<ul id="lnb">
				<li><a href="/seat/rulelibrary"><span>이용규칙</span></a></li>
				<li class="on"><a><span>좌석예약</span></a></li>
			</ul>
		</div>
		<div id="contentCore">
				<div class="naviTit">
					<h3>좌석 당일 예약</h3>
					<p>열람실 이용&nbsp;&nbsp;>&nbsp;&nbsp;좌석 당일 예약</p>
				</div>
				<div id="contents">
				<div id="reserveWrap">
					<h3> 좌석 당일 예약</h3>
					<div class="ruletab">
					<div class="inner_right">
					<div class="pc_left_line">
						<div class="pc_line">
							<div class="pc tablename" onclick="tableName(0)">pc1</div>
							<div class="pc tablename" onclick="tableName(1)">pc2</div>
							<div class="pc tablename" onclick="tableName(2)">pc3</div>
							<div class="pc tablename" onclick="tableName(3)">pc4</div>
							<div class="pc tablename" onclick="tableName(4)">pc5</div>
							<div class="pc tablename" onclick="tableName(5)">pc6</div>
							<div class="pc tablename" onclick="tableName(6)">pc7</div>
							<div class="pc tablename" onclick="tableName(7)">pc8</div>
							<div class="pc tablename" onclick="tableName(8)">pc9</div>
							<div class="pc tablename" onclick="tableName(9)">pc10</div>
							<div class="pc tablename" onclick="tableName(10)">pc11</div>
							<div class="pc tablename" onclick="tableName(11)">pc12</div>
						</div>
						<div class="pc_line">
							<div class="pc tablename" onclick="tableName(12)">pc13</div>
							<div class="pc tablename" onclick="tableName(13)">pc14</div>
							<div class="pc tablename" onclick="tableName(14)">pc15</div>
							<div class="pc tablename" onclick="tableName(15)">pc16</div>
							<div class="pc tablename" onclick="tableName(16)">pc17</div>
							<div class="pc tablename" onclick="tableName(17)">pc18</div>
							<div class="pc tablename" onclick="tableName(18)">pc19</div>
							<div class="pc tablename" onclick="tableName(19)">pc20</div>
							<div class="pc tablename" onclick="tableName(20)">pc21</div>
							<div class="pc tablename" onclick="tableName(21)">pc22</div>
							<div class="pc tablename" onclick="tableName(22)">pc23</div>
							<div class="pc tablename" onclick="tableName(23)">pc24</div>
						</div>
					</div>
					<div class="pc_right_line">
						<div class="pc_line_two">
							<div class="nomal tablename" onclick="tableName(24)">N1</div>
							<div class="nomal tablename" onclick="tableName(25)">N2</div>
							<div class="nomal tablename" onclick="tableName(26)">N3</div>
							<div class="nomal tablename" onclick="tableName(27)">N4</div>
							<div class="nomal tablename" onclick="tableName(28)">N5</div>
							<div class="nomal tablename" onclick="tableName(29)">N6</div>
							<div class="nomal tablename" onclick="tableName(30)">N7</div>
							<div class="nomal tablename" onclick="tableName(31)">N8</div>
							<div class="nomal tablename" onclick="tableName(32)">N9</div>
							<div class="nomal tablename" onclick="tableName(33)">N10</div>
							<div class="nomal tablename" onclick="tableName(34)">N11</div>
							<div class="nomal tablename" onclick="tableName(35)">N12</div>
							<div class="nomal tablename" onclick="tableName(36)">N13</div>
							<div class="nomal tablename" onclick="tableName(37)">N14</div>
							<div class="nomal tablename" onclick="tableName(38)">N15</div>
							<div class="nomal tablename" onclick="tableName(39)">N16</div>
							<div class="nomal tablename" onclick="tableName(40)">N17</div>
							<div class="nomal tablename" onclick="tableName(41)">N18</div>
							<div class="nomal tablename" onclick="tableName(42)">N19</div>
							<div class="nomal tablename" onclick="tableName(43)">N20</div>
						</div>
					</div>
					<div class="pc_right_line_two">
						<div class="pc_line_three">
							<div class="nomal tablename" onclick="tableName(44)">N21</div>
							<div class="nomal tablename" onclick="tableName(45)">N22</div>
							<div class="nomal tablename" onclick="tableName(46)">N23</div>
							<div class="nomal tablename" onclick="tableName(47)">N24</div>
							<div class="nomal tablename" onclick="tableName(48)">N25</div>
							<div class="nomal tablename" onclick="tableName(49)">N26</div>
							<div class="nomal tablename" onclick="tableName(50)">N27</div>
							<div class="nomal tablename" onclick="tableName(51)">N28</div>
							<div class="nomal tablename" onclick="tableName(52)">N29</div>
							<div class="nomal tablename" onclick="tableName(53)">N30</div>
							<div class="nomal tablename" onclick="tableName(54)">N31</div>
							<div class="nomal tablename" onclick="tableName(55)">N32</div>
							<div class="nomal tablename" onclick="tableName(56)">N33</div>
							<div class="nomal tablename" onclick="tableName(57)">N34</div>
							<div class="nomal tablename" onclick="tableName(58)">N35</div>
							<div class="nomal tablename" onclick="tableName(59)">N36</div>
							<div class="nomal tablename" onclick="tableName(60)">N37</div>
							<div class="nomal tablename" onclick="tableName(61)">N38</div>
							<div class="nomal tablename" onclick="tableName(62)">N39</div>
							<div class="nomal tablename" onclick="tableName(63)">N40</div>
						</div>
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

				${name}님의 선택 좌석 : <span id="tn"></span>  번 <p>

			</div>
				<div id="notice">
					<p> 본 도서관은 1인 최대 3시간까지 좌석 배정이 가능합니다. </p>
					<p> * 흰색 : 예약 가능 </p> 
					<p> * 회  색 : 예약중 또는 예약 불가 </p>
				</div>
				<form name="cf" method="post" action="reserveSeater" onsubmit="return check(this)">
				<input type="hidden" name="tname" value=""> 
				<input type="hidden" name="arrychktime">
					<div class="touter">
						<div class="time" id="time9" onclick="checktime(0,this)">9시~10시</div><input type="checkbox" name="time9" class="chktime" value="0">
						<div class="time" id="time10" onclick="checktime(1,this)">10시~11시</div><input type="checkbox" name="time10" class="chktime" value="0">
						<div class="time" id="time11" onclick="checktime(2,this)">11시~12시</div><input type="checkbox" name="time11" class="chktime" value="0">
						<div class="time" id="time11" onclick="checktime(3,this)">12시~13시</div><input type="checkbox" name="time12" class="chktime" value="0">
						<div class="time" id="time13" onclick="checktime(4,this)">13시~14시</div><input type="checkbox" name="time13" class="chktime" value="0">
						<div class="time" id="time14" onclick="checktime(5,this)">14시~15시</div><input type="checkbox" name="time14" class="chktime" value="0">
						<div class="time" id="time15" onclick="checktime(6,this)">15시~16시</div><input type="checkbox" name="time15" class="chktime" value="0">
						<div class="time" id="time16" onclick="checktime(7,this)">16시~17시</div><input type="checkbox" name="time16" class="chktime" value="0">
						<div class="time" id="time17" onclick="checktime(8,this)">17시~18시</div><input type="checkbox" name="time17" class="chktime" value="0">
						<div class="time" id="time18" onclick="checktime(9,this)">18시~19시</div><input type="checkbox" name="time18" class="chktime" value="0">
					</div>
					<div class="sbouter">
						<input type="submit" value="좌석예약">
						<input type="button" value="뒤로가기" onclick="hideLayer()">
					</div>
				</form>
	</div>
</div>
<div id="end"></div>
</body>
</html>