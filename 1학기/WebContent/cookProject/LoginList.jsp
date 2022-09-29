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
	
	//3. 연결 설정(selecte문으로 전부 num순서대로 찾아오기)
	String sql = "select * from member order by num";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 데이터 조회</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h2 style = "text-align:center">회원 목록 조회</h2>
<div class="container">
	<table class="table table-bordered">
		<caption style = "text-align:end;"> <input type="submit" value ="생성" onclick = "location.href='LoginNewForm.jsp'"> </caption>
		<tr>
			<th>고유 번호</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>성별</th>
			<th>폰 번호</th>
			<th>이메일</th>
			<th>생일</th>
		</tr>
		<tr>
			<%	
				// 반환데이터 값 가져오기
				while(rs.next()){
					String num = rs.getString("num");
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String name = rs.getString("name");
					String xname = rs.getString("xname");
					String gender = rs.getString("gender");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String rdate = rs.getString("rdate");
			%>
			<!-- updateForm에 num값 넘겨주기 -->
			<td><a href="LoginUpdateForm.jsp?num=<%=num %>"><%=num %></td>
			<td><%=id %></td>
			<td><%=pwd %></td>
			<td><%=name %></td>
			<td><%=xname %></td>
			<td><%=gender %></td>
			<td><%=phone %></td>
			<td><%=email %></td>
			<td><%=rdate %></td>
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