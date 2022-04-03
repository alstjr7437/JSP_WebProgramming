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
	
		String cate = request.getParameter("cate");
		String name = request.getParameter("name");
		String human = request.getParameter("human");
		int password = Integer.parseInt(request.getParameter("password"));
		String text  = request.getParameter("text");
		
		//출력 부분
		out.println("카테고리 : "+ cate + "<br>");
		out.println("제목 : "+ name + "<br>");
		out.println("작성자 : "+ human + "<br>");
		out.println("비밀번호 : "+ password + "<br>");
		out.println("내용 <br>"+ text + "<br>");
	%>
	<br>
</body>
</html>