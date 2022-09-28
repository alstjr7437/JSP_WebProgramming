<%@page import="csdit.LoginDao"%>
<%
	//한글 처리
	request.setCharacterEncoding("utf-8");
	//id, pwd 가져오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//db연동으로 테이블에서 가져온 id, pwd가 일치하는지 확인	
	LoginDao dao = new LoginDao();
	int check = dao.checkUser(id, pwd);
	
	if(check == 1){
		session.setAttribute("id", id);
		out.println(id + "님 안녕하세요!!!!");
	} else {
		out.println("회원가입을 먼저 하세요");
	}
	response.sendRedirect("loginForm.jsp");

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	반가워요
</body>
</html>