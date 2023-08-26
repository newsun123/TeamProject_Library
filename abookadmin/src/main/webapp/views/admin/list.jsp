<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	#section {
		width:1500px;
		margin:auto;
		padding-top:80px;
		text-align:center;
	}
   .list {
	   	width:100%;
	   	border:1px solid black;
	}
    .searchtext {
    	width:1500px;
    	margin-bottom:20px;
    }
	
    .searchbutton {
    	background-color:#007bff;
    	padding:10px 20px;
    	border-radius:5px;
    	color:white;
    	margin-left:10px;
    	margin-bottom:20px;
    	width:100px;
    }
    #section h3{
    	font-size: 25px;
    	margin-bottom: 30px;
    	font-family: NotoSansM;
    }
	#searchCon{
		width: 630px;
	    position: relative;
	    right: 0;
	    display: flex;
    	justify-content: space-between;
    	align-items: center;
	}     
	#searchCon input{
		width:500px;
	}
    #section table {
     	border-spacing:0px;
    }
    table{
    	border:1px solid #333;
    }
    table tr{
    	height: 120px;
    	cursor: pointer;
    }
    table tr.on{
    	background:#eee;
    }
    table tr:first-child{
    	height: 65px;
    	cursor:default;
    	pointer-events: none;
    }    
    table tr:first-child td{
    	border-bottom: 1px solid #eeee;
    }
    table tr td img{
    	object-fit:cover;
    	height: 100px;
    }
    #pagein{
    	text-align:center;
    }
</style>
<script>
	$(function(){
		$("table tr").hover(function(){
			$(this).toggleClass("on");
		});
	});
	
	function addBook(bookId)
	{
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			if(chk.status == 200) // status는 응답상태를 말하고 200은 요청에 성공했다는 뜻이다.
				alert("도서가 추가되었습니다.");
			else
				alert("도서 추가에 실패했습니다.");
		}
		chk.open("get","addbookea?bookId="+bookId);
		chk.send();
	}
	function delBook(bookId)
	{
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			if(chk.status==200)
				alert("도서가 삭제되었습니다.");	
			else
				alert("도서 삭제에 실패했습니다.")
		}
		chk.open("get","delbookea?bookId="+bookId);
		chk.send();
	}
</script>
</head>
<body>
	<div id="section">
	    <form name="bform" method="post" cellspancing="0">
    		<h3> 도서 추가/삭제 </h3>
    		<div id="searchCon">
    			<input type="text" class="searchtext" maxlength="100" placeholder="검색어 입력">
    			<button type="submit" class="searchbutton">검색</button>			
    		</div>
	    	<table align="center">
					<tr>
						<td> 이미지 </td>
						<td> 도서명 </td>
						<td> 저자 </td>
						<td> 출판사 </td>
						<td> 출판년도 </td>
						<td> 갯수 </td>
						<td> 비고 </td>
						<td> 추가/삭제 </td>
					</tr>
						   					
				<c:forEach items="${alist}" var="avo">
				
					<tr onclick="corH(this)">
						<td> <img src="/static/img/admin/${avo.bookimg}"></td>
						<td><a href="content?no=${avo.no}&page=${page}"> ${avo.bookname} </a></td>
						<td> ${avo.writer} </td>
						<td> ${avo.publisher} </td>
						<td> ${avo.writetime} </td>
						<td> ${avo.bookea} </td>
						<td> ${avo.ect} </td>
						<td>
							<input type="button" onclick="addBook(${avo.no})" value="도서 추가">
							<input type="button" onclick="delBook(${avo.no})" value="도서 삭제">
						</td>
					</tr>
				</c:forEach>
				
					<tr>
						<td id="pagein" colspan="8">
						
						<!-- 10페이지 왼쪽 이동 -->  
						<c:if test="${pstart != 1}">
							<a href="list?poge="${pstart-1}"> << </a>
						</c:if>
						<c:if test="${pstart == 1}">
							<<
						</c:if>
						
						<!-- 1페이지 왼쪽이동 -->
						<c:if test="${page != 1}">
							<a href="list?page="${page-1}"> < </a>
						</c:if>
						<c:if test="${page == 1}">
							<
						</c:if>
						
						<c:forEach begin="${pstart}" end="${pend}" var="i">
							<c:if test="${page != i}">
								<a href="list?page=${i}"> ${i} </a>
							</c:if>
							<c:if test="${page == i}">
								<a href="list?page=${i}" style="color:red"> ${i} </a>
							</c:if>
						</c:forEach>
						
						<!-- 1페이지 오른쪽 이동 -->
						<c:if test="${page != chong}">
							<a href="list?page=${page+1}"> > </a>
						</c:if>
						<c:if test="${page == chong}">
							>
						</c:if>
						
						<!-- 10페이지 오른쪽 이동 -->
						<c:if test="${pend != chong}">
							<a href="list?page=${pend+1}"> >> </a>
						</c:if>
						<c:if test="${pend == chong}">
							>>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="8"> <a href="write"> 도서 등록 </a> </td>
				</tr>
	    	</table>
	    </form>
    </div>
</body>
</html>