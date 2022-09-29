<%@page import="cs.dit.MemberDto"%>
<%@page import="cs.dit.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%
	MemberDao dao = new MemberDao();
	ArrayList<MemberDto> dtos = dao.list();
	pageContext.setAttribute("dtos", dtos);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container"><br>	
	<h2 class="text-center font-weight-bold">사용자 목록</h2>
	<br>
	<table class="table table-hover">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>email</th>
			<th>joinDate</th>
		</tr>

		<c:forEach var='dto' items='${dtos}'>
			<tr>
			
				<!-- 5. updateForm.jsp로 id를 get 방식으로 전송하고 화면에 id를 출력할 것 -->
				<td><a href="updateForm.jsp?bcode=${dto.id}">${dto.id}</a></td>
				
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td><fmt:formatDate value="${dto.joinDate}"/></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<input type="button" value ="홈으로" onclick ="location.href='index.jsp'">
	<input type="button" value ="멤버 등록" onclick ="location.href='insertForm.jsp'">
	</div>	
</body>
</html>