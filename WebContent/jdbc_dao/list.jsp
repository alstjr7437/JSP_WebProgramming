<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="csdit.LoginDao"%>
<%@page import="csdit.LoginDto"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
<%

	LoginDao dao = new LoginDao();
	ArrayList<LoginDto> dtos = dao.list();
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
				for(LoginDto dto : dtos) {
			%>
			<!-- updateForm에 id값 넘겨주기 -->
			<td><a href="updateForm.jsp?id=<%=dto.getId() %>"><%=dto.getId() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getPwd() %></td>
		</tr>
<%
				}
%>
	</table>
</div>
</body>
</html>