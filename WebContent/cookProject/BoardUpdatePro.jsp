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
	String bname = request.getParameter("bname");
	String bpwd = request.getParameter("bpwd");
	String btype = request.getParameter("btype");
	String btitle = request.getParameter("btitle");
	String btag = request.getParameter("btag");
	String bdate = request.getParameter("bdate");
	//1. DBCP로 변경
	//1-1. Context 객체 얻기
	Context initCtx = new InitialContext();
	//1-2. "java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	//1-3. "jdbc/alstjr"에 해당되는 객체를 찾아서 ds에 삽입
	DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
	//1-4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
	Connection con = ds.getConnection();
	
	//2. SQL문(수정할때 쓰는 UPDATE set 쿼리)
	String sql = "UPDATE board set bname=?, bpwd=?, btype=?, btitle=?, btag=?, bdate=? WHERE num=?";	//수정할때
	
	//3. SQL 실행하기
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//순서대로 사용
	pstmt.setString(1, bname);
	pstmt.setString(2, bpwd);
	pstmt.setString(3, btype);
	pstmt.setString(4, btitle);
	pstmt.setString(5, btag);
	pstmt.setString(6, bdate);
	pstmt.setString(7, num);
	
	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	int i = pstmt.executeUpdate();
	
	//5.객체 해지
	pstmt.close();
	con.close();

	//페이지 수행하고 list페이지를 이동하기 위한 코드
	response.sendRedirect("BoardList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=bname %>님의  데이터가 입력되었습니다!
</body>
</html>