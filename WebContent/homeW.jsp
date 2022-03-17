<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% String a = "&nbsp&nbsp&nbsp&nbsp&nbsp"; 
		int b = 25; int c = 10; 
		int sum = b + c; int mul = b * c;
	%>
	<% out.print(a); %> 공백을 5개 찍고 이 문장이 시작됩니다. <br>
	이 문장은 중간에 공백이 <% out.print(a); %> 5개 있습니다.
	<br><br>
	25 * 10 = <%= sum %>
	25 * 10 = <%= mul %>
</body>
</html>