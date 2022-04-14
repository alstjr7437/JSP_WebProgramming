<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
<%
	//1. jdbc driver 로드
	Class.forName("org.mariadb.jdbc.Driver");		
		
	//2. 커넥션 얻기
	String url ="jdbc:mariadb://localhost:3306/alstjrdb";
	String user="alstjr";
	String password="1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
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