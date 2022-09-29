<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	//list에서 받아온 id 저장
	String id = request.getParameter("id");

	//1. DBCP로 변경
	//1-1. Context 객체 얻기
	Context initCtx = new InitialContext();
	//1-2. "java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	//1-3. "jdbc/alstjr"에 해당되는 객체를 찾아서 ds에 삽입
	DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
	//1-4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
	Connection con = ds.getConnection();
	
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