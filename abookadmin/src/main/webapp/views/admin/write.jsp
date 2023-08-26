<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #section {
            width: 1500px;
            margin: auto;
            padding-top: 80px;
            text-align: center;
        }
        #section input {
        	width:600px;
        }
        .form-table {
            border-collapse: separate;
            margin: 0 auto;
            width:800px;
        }
        .form-table td {
            padding: 10px;
            border:1px solid black;
        }
        .button-box {
        	display:flex;
        	justify-content:center;
        	margin-top:10px;
        	text-align:center;
        }
        .button-container button {
        	padding:10px 20px;
        	margin:0 5px;
        	curser:pointer;
        	border:none;
        	background-color:#007bff;
        	color:white;
        	border-radius:5px;
        }
        caption {
        	margin-bottom:20px;
        	margin-top:20px;
        }
        
    </style>
   <!--  <script>
    function makeCode()
    {
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		// alert(chk.responseText)
    		document.getElementsByClassName("bookcode")[0].value=chk.responseText;
    	}
    	chk.open("get","getBcode");
    	chk.send();
    }
    </script> -->
</head>
<body>
<div id="section">
    <form method="post" action="write_ok" enctype="multipart/form-data">
        <input type="hidden" name="bookcode" class="bookcode" value="${bcode}">
        <div class="form-table">
            <table>
            <caption><h3> 도서등록 </h3></caption>
                <tr>
                    <td><label for="bookname">도서명</label></td>
                    <td><input type="text" id="bookname" name="bookname"></td>
                </tr>
                <tr>
                    <td><label for="writer">저자</label></td>
                    <td><input type="text" id="writer" name="writer"></td>
                </tr>
                <tr>
                    <td><label for="publisher">출판사</label></td>
                    <td><input type="text" id="publisher" name="publisher"></td>
                </tr>
                <tr>
                    <td><label for="writetime">출판년도</label></td>
                    <td><input type="text" id="writetime" name="writetime"></td>
                </tr>
                <tr>
                    <td><label for="bookea">갯수</label></td>
                    <td>
                        <input type="text" id="bookea" name="bookea">
                    </td>
                </tr>
                <tr>
                    <td><label for="bookimg">책이미지</label></td>
                    <td><input type="file" id="bookimg" name="bookimg"></td>
                </tr>
                <tr>
                    <td><label for="ect">설명</label></td>
                    <td><input type="text" id="ect" name="ect"></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                    <div class="button-box">
                    	<div class="button-container">
                        <button type="submit" value="등록"> 등록 </button>
                        </div>
                        <div class="button-container">
                        <button type="reset" value="초기화"> 초기화 </button>
                        </div>
                    </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
   </div>
</body>
</html>
