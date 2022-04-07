<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//클라이언트에서 전달된 데이터
 	request.setCharacterEncoding("utf-8");
 	String id = request.getParameter("id");
 	String pwd = request.getParameter("pwd");
 	//1. jdbc 드라이버 로드
 	Class.forName("org.mariadb.jdbc.Driver");
 	//2. 커넥션 객체 얻기
 	String url = "jdbc:mariadb://localhost:3306/alstjrdb";
 	String user = "alstjr";
 	String password = "1111";
 	Connection cn = DriverManager.getConnection(url, user, password);
 	//3. SQL문
 	String sql = "insert into login(id, pwd) values(?, ?)";
 	//4. SQL실행
 	PreparedStatement pstmt = cn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	
	int i = pstmt.executeUpdate();
 	//5. 객체 해지
 	cn.close();
 	pstmt.close();
 	
 	response.sendRedirect("dbcon-login.jsp");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=i %>개의 데이터가 입력됐습니다
</body>
</html>