<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String[] lang = request.getParameterValues("lang");
		String[] hobby = request.getParameterValues("hobby");
		
		out.println("관심 언어<br>");
		for(int i = 0; i < lang.length; i++){
			out.println(lang[i]);
		}
		out.println("<br>");
		out.println("<br>");
		
		out.println("취미 <br>");
		for(int i = 0; i < hobby.length; i++){
			out.println(hobby[i]);
		}
	%>
	<br>
</body>
</html>