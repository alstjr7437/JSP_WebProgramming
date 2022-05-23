<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
<%
	//1. DBCP로 변경
	//1-1. Context 객체 얻기
	Context initCtx = new InitialContext();
	//1-2. "java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	//1-3. "jdbc/alstjr"에 해당되는 객체를 찾아서 ds에 삽입
	DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
	//1-4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
	Connection con = ds.getConnection();
	
	//3. 연결 설정(selecte문으로 전부 id순서대로 찾아오기)
	String sql = "select * from login order by id";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login 데이터 조회</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h2 style = "text-align:center">회원 목록 조희</h2>
<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>pwd</th>
		</tr>
		<tr>
			<%	
				//4. 반환데이터 출력(html 보일부분 수정)
				while(rs.next()){
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String name = rs.getString("name");
			%>
			<!-- updateForm에 id값 넘겨주기 -->
			<td><a href="updateForm.jsp?id=<%=id %>"><%=id %></td>
			<td><%=name %></td>
			<td><%=pwd %></td>
		</tr>
<%
				}
%>
	</table>
</div>
<%
	//5. 객체 해지
	rs.close();
	stmt.close();
	con.close();
%>
</body>
</html>