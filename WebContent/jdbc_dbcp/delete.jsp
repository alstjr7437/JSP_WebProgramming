<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.sql.*"    
%>
<%
	request.setCharacterEncoding("utf-8");
	
	//클라이언트에서 전달된 데이터
	String id = request.getParameter("id");
	
	//1. DBCP로 변경
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
	Connection con = ds.getConnection();
		
	//3. SQL문 (삭제를 위한 DELETE FROM 쿼리)
	String sql = "DELETE FROM login WHERE id=?";	//수정할때
		
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	System.out.println(sql);
	pstmt.setString(1, id);

	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	int i = pstmt.executeUpdate();
		
	//5.객체 해지
	pstmt.close();
	con.close();

	//페이지 수행하고 list페이지를 이동하기 위한 코드
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Delete</title>
</head>
<body>
 	<%=i %>개의 데이터가 삭제되었습니다!
</body>
</html>
	