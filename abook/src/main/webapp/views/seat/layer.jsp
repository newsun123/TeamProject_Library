<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layer {
	margin:auto;
	width:900px;
	height:600px;
	border:1px solid black;
	position: relative;
}
.head {
	width:900px;
	height:50px;
	line-height:50px;
	text-align:center;
	font-size: 30px;
	margin-top:20px;	
}
.touter {
	width: 880px;
    position: absolute;
    left: 40px;
    top: 180px;
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
	margin-top:0;
	margin-bottom:0;
}
.sbouter {
	position:absolute;
	left:340px;
	top:450px;
}
input[type=submit] {	
	width:100px;
	height:30px;
}
input[type=button] {
	width:100px;
	height:30px;
}
</style>
<script>
	function checktime(n, my) {
		var t = document.getElementsByClassName("chktime")[n];
		const chk = document.querySelectorAll('input[type="checkbox"]:checked');
		if (t.checked) {
			t.checked = false;
			my.style.opacity = 1;
		} else {
			t.checked = true;
			my.style.opacity = 0.3;
			if(chk.length > 2) {
				alert("초대 3시간까지 가능합니다.");
				t.checked = false;				
			}
		}
	}
	function check(my) {
		const chk = document.querySelectorAll('input[type="checkbox"]:checked');
		if(chk.length > 3) {
			alert("최대 3시간까지 가능합니다.");
			return false;
		}else if(chk.length == null) {
			alert("시간을 예약하세요");
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>
<div class="layer">
	<div class="head">
		{bvo.userid}님의 선택 좌석 : {bvo.name}번 <p>
	</div>
		<div id="notice">
			<p> 본 도서관은 1인 최대 3시간까지 좌석 배정이 가능합니다. </p>
			<p> * 초록색 : 예약 가능 </p> 
			<p> * 주황색 : 예약 중 </p>
			<p> * 회  색 : 예약 불가 </p>
		</div>
		<form name="cf" method="post" action="reserve" onsubmit="return check(this)">
			<div class="touter">
				<div class="time" onclick="checktime(0,this)">9시~10시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(1,this)">10시~11시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(2,this)">11시~12시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(3,this)">12시~13시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(4,this)">13시~14시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(5,this)">14시~15시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(6,this)">15시~16시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(7,this)">16시~17시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(8,this)">17시~18시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
				<div class="time" onclick="checktime(9,this)">18시~19시</div><input type="checkbox" name="chktime" class="chktime" style="display:none;">
			</div>
			<div class="sbouter">
				<input type="submit" value="좌석예약">
				<input type="button" value="뒤로가기">
			</div>
		</form>
</div>
</body>
</html>