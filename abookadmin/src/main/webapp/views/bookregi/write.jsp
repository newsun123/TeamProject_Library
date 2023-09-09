<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#bookregiWrap{
		padding-bottom: 30px;
	}
	form{
		width: 100%;
	    display: block;
	}
	h4{
		font-size: 25px;
	    font-family: 'NotoSansM';
	    text-align: center;
	    padding:30px 0;
	}
	table{
		border-top: 2px solid #cecece;
	}
	table tr{
		height: 55px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table tr td:first-child {
		padding-left: 10px;
	    background: #f8f8fa;
	    width: 121px;
	    border-right: 1px solid #e4e4e4;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	}
	table input{
		width: 100%;
		font-size: 15px;
		border:none!important;
		padding:0!important;	
	}
	#btn{
		text-align: right;
		padding: 30px 0;
	}
	input[type=submit]{
	    color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    font-family: 'NotoSansM';
	    height: 50px;
	    width: 130px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display: inline-block;
	    line-height: 50px;
	}
	input[type=file]::file-selector-button {
	    height: 38px;
	    border: 1px solid #cccccc;
	    cursor: pointer;
	    vertical-align: middle;
	    background: #fff;
	    font-weight: bold;
	    margin-right: 10px;
	    outline:none;
	    padding:5px 10px;
	}
	input[type=file]{
		font-size: 14px;
	}
</style>
<script>

	function check(my) {
		if (my.title.value.trim().length == 0) {
			alert("도서명을 입력하세요.");
			return false;
		} else if (my.publi.value.trim().length == 0) {
			alert("출판사를 입력하세요.");
			return false;
		} else if (my.writer.value.trim().length == 0) {
			alert("저자를 입력하세요.");
			return false;
		} else if (my.writeyear.value.trim().length == 0) {
			alert("출판년도를 입력하세요.");
			return false;
		} else if (my.bea.value.trim().length == 0) {
			alert("갯수를 입력하세요.");
			return false;
		} else if (my.ect.value.trim().length == 0) {
			alert("설명을 입력하세요.");
			return false;
		} else if (my.bimg.value.trim().length == 0) {
			alert("책이미지를 넣어주세요.");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관리</span></h2>
				<ul id="lnb">
					<li class="on"><a><span>도서등록</span></a></li>
					<li><a href="/loanstatus/list"><span>대출현황</span></a></li>
					<li><a href="/reservestatus/list"><span>예약현황</span></a></li>
					<li><a href="#"><span>신청현황</span></a></li>
					<li><a href="#"><span>희망도서</span></a></li>
					<li><a href="#"><span>월별대출</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서등록</h3>
					<p>도서관리&nbsp;&nbsp;>&nbsp;&nbsp;도서등록</p>
				</div>
				<div id="contents">
					<div id="bookregiWrap">
						<form name="bform" method="post" action="write_ok" enctype="multipart/form-data" onsubmit="return check(this)">
							<table>
								<tr>
									<td>도서명</td>
									<td><input type="text" id="title" name="title"></td>
								</tr>
								<tr>
									<td>출판사</td>
									<td><input type="text" id="publi" name="publi"></td>
								</tr>
								<tr>
									<td>저자</td>
									<td><input type="text" id="writer" name="writer"></td>
								</tr>
								<tr>
									<td>출판년도</td>
									<td><input type="text" id="writeyear" name="writeyear"></td>
								</tr>
								<tr>
									<td>갯수</td>
									<td><input type="text" id="bea" name="bea"></td>
								</tr>
								<tr>
									<td>설명</td>
									<td><input type="text" id="ect" name="ect" onclick="aaa()"></td>
								</tr>
								<tr>
									<td>책이미지</td>
									<td><input type="file" id="bimg" name="bimg" ></td>
								</tr>
							</table>
							<div id="btn"><input type="submit" value="도서등록"></div> 
						</form>						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>