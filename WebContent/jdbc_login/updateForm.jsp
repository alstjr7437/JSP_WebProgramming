<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	//list에서 받아온 id 저장
	String id = request.getParameter("id");

	//1. jdbc driver 로드
	Class.forName("org.mariadb.jdbc.Driver");		
	
	//2. 커넥션 얻기
	String url ="jdbc:mariadb://localhost:3306/alstjrdb";
	String user="alstjr";
	String password="1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
	//3. 연결 설정(select문으로 id 맞는값 찾아오기)
	String sql = "select * from login where id =?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	ResultSet rs = pstmt.executeQuery();
	//미리 변수 비어주기
	String name = "";
	String pwd = "";
	
	//차례대로 id가 있는지 확인해서 name이랑 pwd 붙여주기
	if(rs.next()){
		name = rs.getString("name");
		pwd = rs.getString("pwd");
	}
	//닫아주기
	rs.close();
	pstmt.close();
	con.close();
%>    
    	
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원정보 업데이트</title>
  <meta charset="utf-8">
<body>

<div class="container">
  <h2>회원정보 업데이트</h2>
  <form action="updatePro.jsp" method="post">
    <div class="form-group">
      <label for="id">id:</label>
      <input type="text" class="form-control" id="id" name="id" value ="<%=id %>">
    </div>    
    <div class="form-group">
      <label for="name">name:</label>
      <input type="text" class="form-control" id="name" name="name" value ="<%=name %>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>	
      <input type="password" class="form-control" id="pwd" name="pwd" value ="<%=pwd %>">
    </div>

    <button type="submit" class="btn btn-primary">저장</button>
    <button class="btn btn-primary" onclick = "location.href='delete.jsp?id=<%=id%>'">삭제</button>
    <button class="btn btn-primary" onclick = "location.href=list.jsp">사용자 조회</button>
  </form>
</div>

</body>
</html>