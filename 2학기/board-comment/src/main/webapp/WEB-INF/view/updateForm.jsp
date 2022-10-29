<%@page import="cs.dit.board.BoardDao"%>
<%@page import="cs.dit.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import = "java.util.List, java.sql.Date" %>

<!DOCTYPE html>
<html>
<head>ㅇ
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<title>게시판</title>
</head>
<body>  
<div class="container">
	<h2 class="text-center font-weight-bold">상세보기</h2>
	<br/>
	<form action="update.do" method="post">
		<input type="hidden" name="bcode" value="${dto.bcode}" id = "bcode">
		<table class="table table-striped table-hover">
			<tr>
				<th>bcode</th><td>${dto.bcode}</td>
				<th>subject</th><td><input type="text" value="${dto.subject}" name="subject"></td>
			</tr>
			<tr>
				<th>content</th>
				<td colspan="3"><textarea rows="10" cols="80" name="content">${dto.content}</textarea></td>	
			</tr>
			<tr>
				<th>writer</th><td><input type="text" value="${dto.writer}" name="writer"></td>
				<th>regDate</th><td><input type="text" value="${dto.regDate}" name="regDate"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value ="게시글 수정" >
					<input type="button" value ="게시글 삭제" onclick ="location.href='delete.do?bcode=${dto.bcode}'">
					<input type="button" value ="게시글 목록" onclick ="location.href='list.do'">
					<input type="button" value ="게시글 등록" onclick ="location.href='insertForm.do'">
				</td>
			</tr>
		</table><br><br>
		<script>
		int bcode = document.getElementById("bcode")
		function cList(){
			var xhr = new XMLHttpRequest();
			var table = document.getElementById("commentsTable");
			xhr.onreadystatechange = function(){
				
				if(xhr.readyState == 4 && xhr.status == 400){
					var list = JSON.parse(this.responseText);

					for(i in list){
						var row = table.insertRow(0);
						var c1 = row.insertCell(0);
						var c2 = row.insertCell(1);
						var c3 = row.insertCell(2);
						c1.innerHTML = list[i].ccode;
						c2.innerHTML = list[i].content;
						c3.innerHTML = list[i].regdate;
					}
				}
			};
			xhr.open("POST", "/board-comment/cList.ct", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoder");
			xhr.send("bcode="+ bcode);
		}
		function cInsert() {
			var xhr = new XMLHttpRequest();
			var content = document.getElementById("comments").value;
			xhr.onreadystatechange = function(){
				
				if(xhr.readyState == 4 && xhr.status == 400){
					document.getElementById("comments").innerHTML = "";
					cList();
					
				}
			};
			xhr.open("POST", "/board-comment/cInsert.ct", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoder");
			xhr.send("bcode="+ bcode + '&content=' + content);
			
		}
		window.load = function() {cList();}
		</script>
		<table class="table table-striped table-hover">
			<tr>
				<td>한줄 댓글 : </td>
				<td><input type="text" name="comments"></td>
				<td><input type="button" onclick=""></td>
			</tr>
		</table>
		<table class="table table-striped table-hover">
			<tbody id="commentsTable">
			</tbody>
		</table>
	</form>
</div>
</body>
</html>