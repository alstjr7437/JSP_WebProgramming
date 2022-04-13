
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"
			import = "java.sql.*"    
	%>
	<%
		request.setCharacterEncoding("utf-8");
	
		//클라이언트에서 전달된 데이터
		String id = request.getParameter("id");
		//1. jdbc 드라이브 로드
		Class.forName("org.mariadb.jdbc.Driver");
	
		//2. 커넥션 객체 얻기
		String url ="jdbc:mariadb://localhost:3306/alstjrdb";
		String user="alstjr";
		String password="1111";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. SQL문 
		//String sql = "insert into login(id, name, pwd) values(?, ?, ?)";	//삽입할때
		String sql = "DELETE FROM login WHERE id=?";	//수정할때
		
		//4. SQL 실행
		//Statement stmt = con.createStatement();
		PreparedStatement pstmt = con.prepareStatement(sql);
		System.out.println(sql);
		pstmt.setString(1, id);
		
		int i = pstmt.executeUpdate();
		//int i = stmt.executeUpdate(sql);
		
		//5.객체 해지
		pstmt.close();
		con.close();
		
		response.sendRedirect("list.jsp");
	%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Delete title here</title>
	</head>
	<body>
	 	<%=i %>개의 데이터가 삭제되었습니다!
	</body>
	</html>
	