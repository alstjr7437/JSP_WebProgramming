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
	
	//2. 연결 설정(selecte문으로 전부 num순서대로 찾아오기)
	String sql = "select * from board order by num";
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
<body><div><h2 style = "text-align:center">게시판 조회</h2></div>
	
<div class="container">
	<table class="table table-bordered">
	<caption style = "text-align:end;"> <input type="submit" value ="생성" onclick = "location.href=BoardNewForm.jsp"> </caption>
	<thead>
		<tr>
			<th>고유번호</th>
			<th>작성자</th>
			<th>비밀번호</th>
			<th>유형</th>
			<th>제목</th>
			<th>내용</th>
			<th>댓글</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<%	
				//4. 반환데이터 출력(html 보일부분 수정)
				while(rs.next()){
					String num = rs.getString("num");
					String bname = rs.getString("bname");
					String bpwd = rs.getString("bpwd");
					String btype = rs.getString("btype");
					String btitle = rs.getString("btitle");
					String btag = rs.getString("btag");
					String bcmt = rs.getString("bcmt");
					String bview = rs.getString("bview");
					String bdate = rs.getString("bdate");
			%>
			<!-- updateForm에 id값 넘겨주기 -->
			<td><a href="BoardUpdateForm.jsp?num=<%=num %>"><%=num %></td>
			<td><%=bname %></td>
			<td><%=bpwd %></td>
			<td><%=btype %></td>
			<td><%=btitle %></td>
			<td><%=btag %></td>
			<td><%=bcmt %></td>
			<td><%=bview %></td>
			<td><%=bdate %></td>
		</tr>
	</tbody>
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