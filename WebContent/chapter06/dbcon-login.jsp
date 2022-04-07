<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login 데이터 조회</title>
</head>
<body>
	<%
		//1. jdbc driver 로드
		Class.forName("org.mariadb.jdbc.Driver");
		//2. 커넥션 얻기
		String url = "jdbc:mariadb://localhost:3306/alstjrdb";
		String user = "alstjr";
		String password = "1111";
		Connection con = DriverManager.getConnection(url, user, password);
		//3. 연결 설정
		String sql = "select * from login";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		//4. 반환데이터 출력하기
		while(rs.next()) {
			out.println(rs.getString("id"));
			out.println(rs.getString("pwd"));
			out.println("<br>");
		}
		//5. 객체 해지
		rs.close();
		con.close();
		stmt.close();
	%>
</body>
</html>