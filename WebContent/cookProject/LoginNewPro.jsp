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
	String num = request.getParameter("num");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String xname = request.getParameter("xname");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String rdate = request.getParameter("rdate");
	//1. DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
	Connection con = ds.getConnection();
	
	//3. SQL문(인서트로 삽입하기)
	String sql = "insert into member(num, id, pwd, name, xname, gender, phone, email, rdate) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	//4. SQL 실행하기
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//첫번째부터 id name pwd를 ?로 처리했기 때문에 순서대로 사용
	pstmt.setString(1, num);
	pstmt.setString(2, id);
	pstmt.setString(3, pwd);
	pstmt.setString(4, name);
	pstmt.setString(5, xname);
	pstmt.setString(6, gender);
	pstmt.setString(7, phone);
	pstmt.setString(8, email);
	pstmt.setString(9, rdate);
	
	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	int i = pstmt.executeUpdate();
	
	//5.객체 해지
	pstmt.close();
	con.close();

	//페이지 수행하고 list페이지를 이동하기 위한 코드
	response.sendRedirect("LoginList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=name %>님의  데이터가 입력되었습니다!
</body>
</html>