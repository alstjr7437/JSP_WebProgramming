<%@page import="csdit.LoginDto"%>
<%@page import="csdit.LoginDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
		import = "java.sql.*"    
%>
<%
	//언어 설정
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto(id, name, pwd);
	dao.insert(dto);

	//페이지 수행하고 list페이지를 이동하기 위한 코드
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%= name%>의 데이터가 입력되었습니다!
</body>
</html>