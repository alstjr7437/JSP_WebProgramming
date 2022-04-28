<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	//list에서 받아온 id 저장
	String num = request.getParameter("num");

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
	String sql = "select * from member where num =?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, num);
	
	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	ResultSet rs = pstmt.executeQuery();
	//미리 변수 비어주기
	String id = "";
	String pwd = "";
	String name = "";
	String xname = "";
	String gender = "";
	String phone = "";
	String email = "";
	String rdate = "";
	
	//차례대로 id가 있는지 확인해서 name이랑 pwd 붙여주기
	if(rs.next()){
		id = rs.getString("id");
		pwd = rs.getString("pwd");
		name = rs.getString("name");
		xname = rs.getString("xname");
		gender = rs.getString("gender");
		phone = rs.getString("phone");
		email = rs.getString("email");
		rdate = rs.getString("rdate");
	}
	//닫아주기
	rs.close();
	pstmt.close();
	con.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원 업데이트</title>
  <meta charset="utf-8">
<body>

 <form action="LoginUpdatePro.jsp" method = "post">
    <table>
        <tr>
            <td>고유 번호</td>
            <td><input type = "text" name="num" value = "<%=num%>"></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td><input type = "text" name="id" value = "<%=id%>"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pwd" value = "<%=pwd%>"></td>
        </tr>
        <tr>
            <td>이 름</td>
            <td><input type = "text" name="name" value = "<%=name%>"></td>
        </tr>
        <tr>
            <td>별 명</td>
            <td><input type = "text" name="xname" value = "<%=xname%>"></td>
        </tr>
        <tr>
            <td>성 별</td>
            <td>
            <% if(gender.equals("남")) {
            	out.println("<input type='radio' name = 'gender' value='남' checked>남 <input type='radio' name = 'gender' value='여'>여");
            } else {
            	out.println("<input type='radio' name = 'gender' value='남' >남 <input type='radio' name = 'gender' value='여' checked>여");
            }
        	%>
                
            </td>
        </tr>
        <tr>
            <td>폰 번호</td>
            <td><input type = "text" name="phone" value = "<%=phone%>"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type = "text" name="email" value = "<%=email%>"></td>
        </tr>
        <tr>
            <td>생년월일</td>
            <td>
               <input type="date" name = "rdate" value = "<%=rdate%>">
            </td>
        </tr>	
    </table>
    <input type="submit" value="수정"> 
    <input type="submit" value ="삭제" onclick = "location.href='LoginDelete.jsp?num=<%=num%>'"> 
    <input type="submit" value ="조회" onclick = "location.href=LoginList.jsp"> 
</form>

</body>
</html>