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
	function tableName(n) {
		var tname = document.getElementsByClassName("tablename")[n].innerText;
		location="table?tname="+tname;
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
			<h2><span>열람실 이용</span></h2>
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

<div id="end"></div>
</body>
</html>