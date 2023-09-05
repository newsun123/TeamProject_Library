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
	margin-bottom:80px;
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
    margin-bottom:50px;
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
	var tname = document.getElementsByClassName("tablename")[n].value;
	 tname = document.getElementsByClassName("tablename")[n].innerText;
	//alert(tname);
	location="stopTable?tname="+tname;
}
function starttable(n) {
	var tname = document.getElementsByClassName("tablename")[n].value;
	 tname = document.getElementsByClassName("tablename")[n].innerText;
	 //alert(tname);
	 location="startTable?tname="+tname;
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
					<h3>사용불가 지정zz</h3>
					<p>좌석 관리&nbsp;&nbsp;>&nbsp;&nbsp;사용불가 지정</p>
				</div>
				<div id="contents">
				<div id="reserveWrap">
					<h3> 사용불가 지정</h3>
					<div class="ruletab">
					<div class="inner_right">
					<div class="pc_left_line">
						<div class="pc_line">
							<c:if test="${list.get(0).close==1}">
								<div class="pc tablename" onclick="starttable(0)" style="background:gray;color:white;">pc1</div>
							</c:if>
							<c:if test="${list.get(0).close==0}">
								<div class="pc tablename" onclick="stoptable(0)">pc1</div>
							</c:if>
							<c:if test="${list.get(1).close==1}">
								<div class="pc tablename" onclick="starttable(1)" style="background:gray;color:white;">pc2</div>
							</c:if>
							<c:if test="${list.get(1).close==0}">
								<div class="pc tablename" onclick="stoptable(1)">pc2</div>
							</c:if>
							<c:if test="${list.get(2).close==1}">
								<div class="pc tablename" onclick="starttable(2)" style="background:gray;color:white;">pc3</div>
							</c:if>
							<c:if test="${list.get(2).close==0}">
								<div class="pc tablename" onclick="stoptable(2)">pc3</div>
							</c:if>	
							<c:if test="${list.get(3).close==1}">
								<div class="pc tablename" onclick="starttable(3)" style="background:gray;color:white;">pc4</div>
							</c:if>
							<c:if test="${list.get(3).close==0}">
								<div class="pc tablename" onclick="stoptable(3)">pc4</div>
							</c:if>
							<c:if test="${list.get(4).close==1}">	
								<div class="pc tablename" onclick="starttable(4)" style="background:gray;color:white;">pc5</div>
							</c:if>
							<c:if test="${list.get(4).close==0}">
								<div class="pc tablename" onclick="stoptable(4)">pc5</div>
							</c:if>	
							<c:if test="${list.get(5).close==1}">
								<div class="pc tablename" onclick="starttable(5)" style="background:gray;color:white;">pc6</div>
							</c:if>
							<c:if test="${list.get(5).close==0}">
								<div class="pc tablename" onclick="stoptable(5)">pc6</div>
							</c:if>
							<c:if test="${list.get(6).close==1}">
								<div class="pc tablename" onclick="starttable(6)" style="background:gray;color:white;">pc7</div>
							</c:if>	
							<c:if test="${list.get(6).close==0}">
								<div class="pc tablename" onclick="stoptable(6)">pc7</div>
							</c:if>
							<c:if test="${list.get(7).close==1}">	
								<div class="pc tablename" onclick="starttable(7)" style="background:gray;color:white;">pc8</div>
							</c:if>
							<c:if test="${list.get(7).close==0}">	
								<div class="pc tablename" onclick="stoptable(7)">pc8</div>
							</c:if>
							<c:if test="${list.get(8).close==1}">	
								<div class="pc tablename" onclick="starttable(8)" style="background:gray;color:white;">pc9</div>
							</c:if>
							<c:if test="${list.get(8).close==0}">		
								<div class="pc tablename" onclick="stoptable(8)">pc9</div>
							</c:if>
							<c:if test="${list.get(9).close==1}">	
								<div class="pc tablename" onclick="starttable(9)" style="background:gray;color:white;">pc10</div>
							</c:if>
							<c:if test="${list.get(9).close==0}">
								<div class="pc tablename" onclick="stoptable(9)">pc10</div>
							</c:if>
							<c:if test="${list.get(10).close==1}">
								<div class="pc tablename" onclick="starttable(10)" style="background:gray;color:white;">pc11</div>
							</c:if>
							<c:if test="${list.get(10).close==0}">	
								<div class="pc tablename" onclick="stoptable(10)">pc11</div>
							</c:if>
							<c:if test="${list.get(11).close==1}">	
								<div class="pc tablename" onclick="starttable(11)" style="background:gray;color:white;">pc12</div>
							</c:if>
							<c:if test="${list.get(11).close==0}">	
								<div class="pc tablename" onclick="stoptable(11)">pc12</div>
							</c:if>	
						</div>
						<div class="pc_line">
							<c:if test="${list.get(12).close==1}">	
								<div class="pc tablename" onclick="starttable(12)" style="background:gray;color:white;">pc13</div>
							</c:if>	
							<c:if test="${list.get(12).close==0}">	
								<div class="pc tablename" onclick="stoptable(12)">pc13</div>
							</c:if>	
							<c:if test="${list.get(13).close==1}">		
								<div class="pc tablename" onclick="starttable(13)" style="background:gray;color:white;">pc14</div>
							</c:if>	
							<c:if test="${list.get(13).close==0}">	
								<div class="pc tablename" onclick="stoptable(13)">pc14</div>
							</c:if>	
							<c:if test="${list.get(14).close==1}">		
								<div class="pc tablename" onclick="starttable(14)" style="background:gray;color:white;">pc15</div>
							</c:if>	
							<c:if test="${list.get(14).close==0}">	
								<div class="pc tablename" onclick="stoptable(14)">pc15</div>
							</c:if>	
							<c:if test="${list.get(15).close==1}">		
								<div class="pc tablename" onclick="starttable(15)" style="background:gray;color:white;">pc16</div>
							</c:if>	
							<c:if test="${list.get(15).close==0}">	
								<div class="pc tablename" onclick="stoptable(15)">pc16</div>
							</c:if>	
							<c:if test="${list.get(16).close==1}">		
								<div class="pc tablename" onclick="starttable(16)" style="background:gray;color:white;">pc17</div>
							</c:if>	
							<c:if test="${list.get(16).close==0}">	
								<div class="pc tablename" onclick="stoptable(16)">pc17</div>
							</c:if>	
							<c:if test="${list.get(17).close==1}">		
								<div class="pc tablename" onclick="starttable(17)" style="background:gray;color:white;">pc18</div>
							</c:if>	
							<c:if test="${list.get(17).close==0}">	
								<div class="pc tablename" onclick="stoptable(17)">pc18</div>
							</c:if>	
							<c:if test="${list.get(18).close==1}">		
								<div class="pc tablename" onclick="starttable(18)" style="background:gray;color:white;">pc19</div>
							</c:if>	
							<c:if test="${list.get(18).close==0}">	
								<div class="pc tablename" onclick="stoptable(18)">pc19</div>
							</c:if>	
							<c:if test="${list.get(19).close==1}">		
								<div class="pc tablename" onclick="starttable(19)" style="background:gray;color:white;">pc20</div>
							</c:if>	
							<c:if test="${list.get(19).close==0}">	
								<div class="pc tablename" onclick="stoptable(19)">pc20</div>
							</c:if>	
							<c:if test="${list.get(20).close==1}">		
								<div class="pc tablename" onclick="starttable(20)" style="background:gray;color:white;">pc21</div>
							</c:if>	
							<c:if test="${list.get(20).close==0}">	
								<div class="pc tablename" onclick="stoptable(20)">pc21</div>
							</c:if>	
							<c:if test="${list.get(21).close==1}">		
								<div class="pc tablename" onclick="starttable(21)" style="background:gray;color:white;">pc22</div>
							</c:if>	
							<c:if test="${list.get(21).close==0}">	
								<div class="pc tablename" onclick="stoptable(21)">pc22</div>
							</c:if>	
							<c:if test="${list.get(22).close==1}">		
								<div class="pc tablename" onclick="starttable(22)" style="background:gray;color:white;">pc23</div>
							</c:if>	
							<c:if test="${list.get(22).close==0}">	
								<div class="pc tablename" onclick="stoptable(22)">pc23</div>
							</c:if>	
							<c:if test="${list.get(23).close==1}">		
								<div class="pc tablename" onclick="starttable(23)" style="background:gray;color:white;">pc24</div>
							</c:if>	
							<c:if test="${list.get(23).close==0}">	
								<div class="pc tablename" onclick="stoptable(23)">pc24</div>
							</c:if>
						</div>
					</div>
					<div class="pc_right_line">
						<div class="pc_line_two">
							<c:if test="${list.get(24).close==1}">	
								<div class="nomal tablename" onclick="starttable(24)" style="background:gray;color:white;">N1</div>
							</c:if>	
							<c:if test="${list.get(24).close==0}">		
								<div class="nomal tablename" onclick="stoptable(24)">N1</div>
							</c:if>	
							<c:if test="${list.get(25).close==1}">		
								<div class="nomal tablename" onclick="starttable(25)" style="background:gray;color:white;">N2</div>
							</c:if>	
							<c:if test="${list.get(25).close==0}">		
								<div class="nomal tablename" onclick="stoptable(25)">N2</div>
							</c:if>	
							<c:if test="${list.get(26).close==1}">		
								<div class="nomal tablename" onclick="starttable(26)" style="background:gray;color:white;">N3</div>
							</c:if>	
							<c:if test="${list.get(26).close==0}">		
								<div class="nomal tablename" onclick="stoptable(26)">N3</div>
							</c:if>	
							<c:if test="${list.get(27).close==1}">		
								<div class="nomal tablename" onclick="starttable(27)" style="background:gray;color:white;">N4</div>
							</c:if>	
							<c:if test="${list.get(27).close==0}">		
								<div class="nomal tablename" onclick="stoptable(27)">N4</div>
							</c:if>	
							<c:if test="${list.get(28).close==1}">		
								<div class="nomal tablename" onclick="starttable(28)" style="background:gray;color:white;">N5</div>
							</c:if>	
							<c:if test="${list.get(28).close==0}">		
								<div class="nomal tablename" onclick="stoptable(28)">N5</div>
							</c:if>	
							<c:if test="${list.get(29).close==1}">		
								<div class="nomal tablename" onclick="starttable(29)" style="background:gray;color:white;">N6</div>
							</c:if>	
							<c:if test="${list.get(29).close==0}">		
								<div class="nomal tablename" onclick="stoptable(29)">N6</div>
							</c:if>	
							<c:if test="${list.get(30).close==1}">		
								<div class="nomal tablename" onclick="starttable(30)" style="background:gray;color:white;">N7</div>
							</c:if>	
							<c:if test="${list.get(30).close==0}">		
								<div class="nomal tablename" onclick="stoptable(30)">N7</div>
							</c:if>	
							<c:if test="${list.get(31).close==1}">		
								<div class="nomal tablename" onclick="starttable(31)" style="background:gray;color:white;">N8</div>
							</c:if>	
							<c:if test="${list.get(31).close==0}">		
								<div class="nomal tablename" onclick="stoptable(31)">N8</div>
							</c:if>	
							<c:if test="${list.get(32).close==1}">		
								<div class="nomal tablename" onclick="starttable(32)" style="background:gray;color:white;">N9</div>
							</c:if>	
							<c:if test="${list.get(32).close==0}">		
								<div class="nomal tablename" onclick="stoptable(32)">N9</div>
							</c:if>	
							<c:if test="${list.get(33).close==1}">		
								<div class="nomal tablename" onclick="starttable(33)" style="background:gray;color:white;">N10</div>
							</c:if>
							<c:if test="${list.get(33).close==0}">		
								<div class="nomal tablename" onclick="stoptable(33)">N10</div>
							</c:if>	
							<c:if test="${list.get(34).close==1}">		
								<div class="nomal tablename" onclick="starttable(34)" style="background:gray;color:white;">N11</div>
							</c:if>	
							<c:if test="${list.get(34).close==0}">		
								<div class="nomal tablename" onclick="stoptable(34)">N11</div>
							</c:if>	
							<c:if test="${list.get(35).close==1}">	
								<div class="nomal tablename" onclick="starttable(35)" style="background:gray;color:white;">N12</div>
							</c:if>	
							<c:if test="${list.get(35).close==0}">		
								<div class="nomal tablename" onclick="stoptable(35)">N12</div>
							</c:if>	
							<c:if test="${list.get(36).close==1}">		
								<div class="nomal tablename" onclick="starttable(36)" style="background:gray;color:white;">N13</div>
							</c:if>	
							<c:if test="${list.get(36).close==0}">		
								<div class="nomal tablename" onclick="stoptable(36)">N13</div>
							</c:if>	
							<c:if test="${list.get(37).close==1}">		
								<div class="nomal tablename" onclick="starttable(37)" style="background:gray;color:white;">N14</div>
							</c:if>	
							<c:if test="${list.get(37).close==0}">		
								<div class="nomal tablename" onclick="stoptable(37)">N14</div>
							</c:if>	
							<c:if test="${list.get(38).close==1}">		
								<div class="nomal tablename" onclick="starttable(38)" style="background:gray;color:white;">N15</div>
							</c:if>	
							<c:if test="${list.get(38).close==0}">		
								<div class="nomal tablename" onclick="stoptable(38)">N15</div>
							</c:if>	
							<c:if test="${list.get(39).close==1}">		
								<div class="nomal tablename" onclick="starttable(39)" style="background:gray;color:white;">N16</div>
							</c:if>	
							<c:if test="${list.get(39).close==0}">		
								<div class="nomal tablename" onclick="stoptable(39)">N16</div>
							</c:if>	
							<c:if test="${list.get(40).close==1}">		
								<div class="nomal tablename" onclick="starttable(40)" style="background:gray;color:white;">N17</div>
							</c:if>	
							<c:if test="${list.get(40).close==0}">		
								<div class="nomal tablename" onclick="stoptable(40)">N17</div>
							</c:if>
							<c:if test="${list.get(41).close==1}">	
								<div class="nomal tablename" onclick="starttable(41)" style="background:gray;color:white;">N18</div>
							</c:if>	
							<c:if test="${list.get(41).close==0}">		
								<div class="nomal tablename" onclick="stoptable(41)">N18</div>
							</c:if>	
							<c:if test="${list.get(42).close==1}">		
								<div class="nomal tablename" onclick="starttable(42)" style="background:gray;color:white;">N19</div>
							</c:if>	
							<c:if test="${list.get(42).close==0}">		
								<div class="nomal tablename" onclick="stoptable(42)">N19</div>
							</c:if>	
							<c:if test="${list.get(43).close==1}">		
								<div class="nomal tablename" onclick="starttable(43)" style="background:gray;color:white;">N20</div>
							</c:if>	
							<c:if test="${list.get(43).close==0}">		
								<div class="nomal tablename" onclick="stoptable(43)">N20</div>
							</c:if>
						</div>
					</div>
					<div class="pc_right_line_two">
						<div class="pc_line_three">
							<c:if test="${list.get(44).close==1}">	
								<div class="nomal tablename" onclick="starttable(44)" style="background:gray;color:white;">N21</div>
							</c:if>	
							<c:if test="${list.get(44).close==0}">		
								<div class="nomal tablename" onclick="stoptable(44)">N21</div>
							</c:if>	
							<c:if test="${list.get(45).close==1}">		
								<div class="nomal tablename" onclick="starttable(45)" style="background:gray;color:white;">N22</div>
							</c:if>	
							<c:if test="${list.get(45).close==0}">		
								<div class="nomal tablename" onclick="stoptable(45)">N22</div>
							</c:if>	
							<c:if test="${list.get(46).close==1}">		
								<div class="nomal tablename" onclick="starttable(46)" style="background:gray;color:white;">N23</div>
							</c:if>	
							<c:if test="${list.get(46).close==0}">		
								<div class="nomal tablename" onclick="stoptable(46)">N23</div>
							</c:if>	
							<c:if test="${list.get(47).close==1}">		
								<div class="nomal tablename" onclick="starttable(47)" style="background:gray;color:white;">N24</div>
							</c:if>	
							<c:if test="${list.get(47).close==0}">		
								<div class="nomal tablename" onclick="stoptable(47)">N24</div>
							</c:if>	
							<c:if test="${list.get(48).close==1}">		
								<div class="nomal tablename" onclick="starttable(48)" style="background:gray;color:white;">N25</div>
							</c:if>	
							<c:if test="${list.get(48).close==0}">		
								<div class="nomal tablename" onclick="stoptable(48)">N25</div>
							</c:if>	
							<c:if test="${list.get(49).close==1}">		
								<div class="nomal tablename" onclick="starttable(49)" style="background:gray;color:white;">N26</div>
							</c:if>	
							<c:if test="${list.get(49).close==0}">		
								<div class="nomal tablename" onclick="stoptable(49)">N26</div>
							</c:if>	
							<c:if test="${list.get(50).close==1}">		
								<div class="nomal tablename" onclick="starttable(50)" style="background:gray;color:white;">N27</div>
							</c:if>	
							<c:if test="${list.get(50).close==0}">		
								<div class="nomal tablename" onclick="stoptable(50)">N27</div>
							</c:if>	
							<c:if test="${list.get(51).close==1}">		
								<div class="nomal tablename" onclick="starttable(51)" style="background:gray;color:white;">N28</div>
							</c:if>	
							<c:if test="${list.get(51).close==0}">		
								<div class="nomal tablename" onclick="stoptable(51)">N28</div>
							</c:if>	
							<c:if test="${list.get(52).close==1}">		
								<div class="nomal tablename" onclick="starttable(52)" style="background:gray;color:white;">N29</div>
							</c:if>	
							<c:if test="${list.get(52).close==0}">		
								<div class="nomal tablename" onclick="stoptable(52)">N29</div>
							</c:if>	
							<c:if test="${list.get(53).close==1}">		
								<div class="nomal tablename" onclick="starttable(53)" style="background:gray;color:white;">N30</div>
							</c:if>	
							<c:if test="${list.get(53).close==0}">		
								<div class="nomal tablename" onclick="stoptable(53)">N30</div>
							</c:if>	
							<c:if test="${list.get(54).close==1}">		
								<div class="nomal tablename" onclick="starttable(54)" style="background:gray;color:white;">N31</div>
							</c:if>	
							<c:if test="${list.get(54).close==0}">		
								<div class="nomal tablename" onclick="stoptable(54)">N31</div>
							</c:if>	
							<c:if test="${list.get(55).close==1}">		
								<div class="nomal tablename" onclick="starttable(55)" style="background:gray;color:white;">N32</div>
							</c:if>	
							<c:if test="${list.get(55).close==0}">		
								<div class="nomal tablename" onclick="stoptable(55)">N32</div>
							</c:if>	
							<c:if test="${list.get(56).close==1}">		
								<div class="nomal tablename" onclick="starttable(56)" style="background:gray;color:white;">N33</div>
							</c:if>	
							<c:if test="${list.get(56).close==0}">		
								<div class="nomal tablename" onclick="stoptable(56)">N33</div>
							</c:if>	
							<c:if test="${list.get(57).close==1}">		
								<div class="nomal tablename" onclick="starttable(57)" style="background:gray;color:white;">N34</div>
							</c:if>	
							<c:if test="${list.get(57).close==0}">		
								<div class="nomal tablename" onclick="stoptable(57)">N34</div>
							</c:if>	
							<c:if test="${list.get(58).close==1}">		
								<div class="nomal tablename" onclick="starttable(58)" style="background:gray;color:white;">N35</div>
							</c:if>	
							<c:if test="${list.get(58).close==0}">		
								<div class="nomal tablename" onclick="stoptable(58)">N35</div>
							</c:if>	
							<c:if test="${list.get(59).close==1}">		
								<div class="nomal tablename" onclick="starttable(59)" style="background:gray;color:white;">N36</div>
							</c:if>	
							<c:if test="${list.get(59).close==0}">		
								<div class="nomal tablename" onclick="stoptable(59)">N36</div>
							</c:if>	
							<c:if test="${list.get(60).close==1}">		
								<div class="nomal tablename" onclick="starttable(60)" style="background:gray;color:white;">N37</div>
							</c:if>	
							<c:if test="${list.get(60).close==0}">		
								<div class="nomal tablename" onclick="stoptable(60)">N37</div>
							</c:if>	
							<c:if test="${list.get(61).close==1}">		
								<div class="nomal tablename" onclick="starttable(61)" style="background:gray;color:white;">N38</div>
							</c:if>	
							<c:if test="${list.get(61).close==0}">		
								<div class="nomal tablename" onclick="stoptable(61)">N38</div>
							</c:if>	
							<c:if test="${list.get(62).close==1}">		
								<div class="nomal tablename" onclick="starttable(62)" style="background:gray;color:white;">N39</div>
							</c:if>	
							<c:if test="${list.get(62).close==0}">		
								<div class="nomal tablename" onclick="stoptable(62)">N39</div>
							</c:if>	
							<c:if test="${list.get(63).close==1}">		
								<div class="nomal tablename" onclick="starttable(63)" style="background:gray;color:white;">N40</div>
							</c:if>	
							<c:if test="${list.get(63).close==0}">		
								<div class="nomal tablename" onclick="stoptable(63)">N40</div>
							</c:if>	
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