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
	//1-1. Context 객체 얻기
	Context initCtx = new InitialContext();
	//1-2. "java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	//1-3. "jdbc/alstjr"에 해당되는 객체를 찾아서 ds에 삽입
	DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
	//1-4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
	Connection con = ds.getConnection();
		
	//3. SQL문(수정할때 쓰는 UPDATE set 쿼리)
	String sql = "UPDATE member set id=?, pwd=?, name=?, xname=?, gender=?, phone=?, email=?, rdate=? WHERE num=?";	//수정할때
		
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	//? 순서대로 번호 설정
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, xname);
	pstmt.setString(5, gender);
	pstmt.setString(6, phone);
	pstmt.setString(7, email);
	pstmt.setString(8, rdate);
	pstmt.setString(9, num);

	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	int i = pstmt.executeUpdate();
	
	//5.객체 해지
	con.close();

	//페이지 수행하고 list페이지를 이동하기 위한 코드
	response.sendRedirect("LoginList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update</title>
</head>
<body>
	<%=name %>의 데이터가 수정되었습니다!
</body>
</html>