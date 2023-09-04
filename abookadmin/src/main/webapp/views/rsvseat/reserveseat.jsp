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
	/* display:none; */
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function stoptable(n) {
	
}
</script>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>좌석 관리</span></h2>
			<ul id="lnb">
				<li class="on"><a><span>사용불가 지정</span></a></li>
				<li><a href="/rsvseat/cancelseat"><span>퇴실 처리</span></a></li>
			</ul>
		</div>
		<div id="contentCore">
				<div class="naviTit">
					<h3>사용불가 지정</h3>
					<p>좌석 관리&nbsp;&nbsp;>&nbsp;&nbsp;사용불가 지정</p>
				</div>
				<div id="contents">
				<div id="reserveWrap">
					<h3> 사용불가 지정</h3>
					<div class="ruletab">
					<div class="inner_right">
					<div class="pc_left_line">
						<div class="pc_line">
							<div class="pc tablename" onclick="stoptable(0)">pc1</div>
							<div class="pc tablename" onclick="stoptable(1)">pc2</div>
							<div class="pc tablename" onclick="stoptable(2)">pc3</div>
							<div class="pc tablename" onclick="stoptable(3)">pc4</div>
							<div class="pc tablename" onclick="stoptable(4)">pc5</div>
							<div class="pc tablename" onclick="stoptable(5)">pc6</div>
							<div class="pc tablename" onclick="stoptable(6)">pc7</div>
							<div class="pc tablename" onclick="stoptable(7)">pc8</div>
							<div class="pc tablename" onclick="stoptable(8)">pc9</div>
							<div class="pc tablename" onclick="stoptable(9)">pc10</div>
							<div class="pc tablename" onclick="stoptable(10)">pc11</div>
							<div class="pc tablename" onclick="stoptable(11)">pc12</div>
						</div>
						<div class="pc_line">
							<div class="pc tablename" onclick="stoptable(12)">pc13</div>
							<div class="pc tablename" onclick="stoptable(13)">pc14</div>
							<div class="pc tablename" onclick="stoptable(14)">pc15</div>
							<div class="pc tablename" onclick="stoptable(15)">pc16</div>
							<div class="pc tablename" onclick="stoptable(16)">pc17</div>
							<div class="pc tablename" onclick="stoptable(17)">pc18</div>
							<div class="pc tablename" onclick="stoptable(18)">pc19</div>
							<div class="pc tablename" onclick="stoptable(19)">pc20</div>
							<div class="pc tablename" onclick="stoptable(20)">pc21</div>
							<div class="pc tablename" onclick="stoptable(21)">pc22</div>
							<div class="pc tablename" onclick="stoptable(22)">pc23</div>
							<div class="pc tablename" onclick="stoptable(23)">pc24</div>
						</div>
					</div>
					<div class="pc_right_line">
						<div class="pc_line_two">
							<div class="nomal tablename" onclick="stoptable(24)">N1</div>
							<div class="nomal tablename" onclick="stoptable(25)">N2</div>
							<div class="nomal tablename" onclick="stoptable(26)">N3</div>
							<div class="nomal tablename" onclick="stoptable(27)">N4</div>
							<div class="nomal tablename" onclick="stoptable(28)">N5</div>
							<div class="nomal tablename" onclick="stoptable(29)">N6</div>
							<div class="nomal tablename" onclick="stoptable(30)">N7</div>
							<div class="nomal tablename" onclick="stoptable(31)">N8</div>
							<div class="nomal tablename" onclick="stoptable(32)">N9</div>
							<div class="nomal tablename" onclick="stoptable(33)">N10</div>
							<div class="nomal tablename" onclick="stoptable(34)">N11</div>
							<div class="nomal tablename" onclick="stoptable(35)">N12</div>
							<div class="nomal tablename" onclick="stoptable(36)">N13</div>
							<div class="nomal tablename" onclick="stoptable(37)">N14</div>
							<div class="nomal tablename" onclick="stoptable(38)">N15</div>
							<div class="nomal tablename" onclick="stoptable(39)">N16</div>
							<div class="nomal tablename" onclick="stoptable(40)">N17</div>
							<div class="nomal tablename" onclick="stoptable(41)">N18</div>
							<div class="nomal tablename" onclick="stoptable(42)">N19</div>
							<div class="nomal tablename" onclick="stoptable(43)">N20</div>
						</div>
					</div>
					<div class="pc_right_line_two">
						<div class="pc_line_three">
							<div class="nomal tablename" onclick="stoptable(44)">N21</div>
							<div class="nomal tablename" onclick="stoptable(45)">N22</div>
							<div class="nomal tablename" onclick="stoptable(46)">N23</div>
							<div class="nomal tablename" onclick="stoptable(47)">N24</div>
							<div class="nomal tablename" onclick="stoptable(48)">N25</div>
							<div class="nomal tablename" onclick="stoptable(49)">N26</div>
							<div class="nomal tablename" onclick="stoptable(50)">N27</div>
							<div class="nomal tablename" onclick="stoptable(51)">N28</div>
							<div class="nomal tablename" onclick="stoptable(52)">N29</div>
							<div class="nomal tablename" onclick="stoptable(53)">N30</div>
							<div class="nomal tablename" onclick="stoptable(54)">N31</div>
							<div class="nomal tablename" onclick="stoptable(55)">N32</div>
							<div class="nomal tablename" onclick="stoptable(56)">N33</div>
							<div class="nomal tablename" onclick="stoptable(57)">N34</div>
							<div class="nomal tablename" onclick="stoptable(58)">N35</div>
							<div class="nomal tablename" onclick="stoptable(59)">N36</div>
							<div class="nomal tablename" onclick="stoptable(60)">N37</div>
							<div class="nomal tablename" onclick="stoptable(61)">N38</div>
							<div class="nomal tablename" onclick="stoptable(62)">N39</div>
							<div class="nomal tablename" onclick="stoptable(63)">N40</div>
						</div>
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