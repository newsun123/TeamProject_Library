<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:0px;
		padding:0px;
	}
	#section{
		width:1500px;
		margin:auto;
		padding-top:80px;
		text-align:center;
		border-radius:10px;
	}
	.nameTop{
		height: 60px;
		border-bottom: solid 2px #000;
		font-size: 25px;
		font-weight: bold;
		text-align: left;
	}
	.conWrap{
	    display: flex;
	    justify-content: ;
	    justify-content: space-between;
	    border-bottom: 1px solid #ddd;
	    box-sizing: border-box;
	    padding:20px 0;
	}
	.lf{
		width: 240px;
		height: 100%;
	}
	.ri{
		width: 1250px;
		padding:0 20px;
	}
	.lf img{
		width: 100%;
	    height: 100%;
	    object-fit: contain;
	    padding: 20px;
	}
	.ri > div{
		text-align: left;
    	height: 45px;
    	line-height: 45px;
	}
	.mark{
		font-size: 20px;
	    display: inline-block;
	    width: 140px;
	}
</style>
<script>

</script>
</head>
<body>
	<div id="section">
		<div class="nameTop">
		    ${avo.bookname}
		</div>
      	<div class="conWrap">
	      	<div class="lf">
	      	    <img src="/static/img/admin/${avo.bookimg}">
	      	</div>
	      	<div class="ri">
	      	  	<div>
					<span class="mark">도서명</span>
					${avo.bookname}
	      	  	</div>
	      	  	<div>
					<span class="mark">출판사</span>
					${avo.publisher}
	      	  	</div>
				<div>
				    <span class="mark">저자</span>
					${avo.writer}
				</div>
				<div>
		            <span class="mark">출판년도</span>
	      	  	    ${avo.writetime}
	      	    </div>
	      	    <div>
		            <span class="mark">도서 등록일</span>
	      	  	    ${avo.bwriteday}
	      	    </div>
	      	    <div>
		            <span class="mark">설명</span>
	      	  	    ${avo.ect}
	      	    </div>
	        </div>      
        </div>
        
        <table>
        	<tr>
        		<td>  </td>
														
        	</tr>
        </table>
	</div>
</body>
</html>