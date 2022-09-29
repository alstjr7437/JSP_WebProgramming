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
<head>
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
		<input type="hidden" name="bcode" value="${dto.bcode}">
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
	</form>
</div>
</body>
</html>