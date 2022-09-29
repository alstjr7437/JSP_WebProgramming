<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
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
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<table class="table table-dark table-striped">
		<tr>
			<th>id</th>
			<th>pwd</th>
		</tr>
		<tr>
	<% 
		//4. 반환 데이터 출력
		while(rs.next()){
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
	%>
			<td><%=id %></td>
			<td><%=pwd %></td>
		</tr>
	<% } 
	%>
	</table>

</body>
</html>