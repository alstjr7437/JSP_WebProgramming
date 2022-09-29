<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	//list에서 받아온  num 저장
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
	
	//2. 연결 설정(select문으로 num에 맞는값 찾아오기)
	String sql = "select * from board where num =?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, num);
	
	//변경하는 쿼리를 쓸때 executeUpdate를 이용
	ResultSet rs = pstmt.executeQuery();
	//미리 변수 비어주기
	String bname = "";
	String bpwd = "";
	String btype = "";
	String btitle = "";
	String btag = "";
	String bdate = "";
	
	//차례대로 num에 맞는 데이터 변수 넣어주기
	if(rs.next()){
		bname = rs.getString("bname");
		bpwd = rs.getString("bpwd");
		btype = rs.getString("btype");
		btitle = rs.getString("btitle");
		btag = rs.getString("btag");
		bdate = rs.getString("bdate");
	}
	//닫아주기
	rs.close();
	pstmt.close();
	con.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>게시판 수정</title>
  <meta charset="utf-8">
<body>

 <form action="BoardUpdatePro.jsp" method = "post">
    <table>
        <tr>
            <td>고유 번호</td>
            <td><input type = "text" name="num" value = "<%=num%>"></td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td><input type = "text" name="bname" value = "<%=bname%>"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="bpwd" value = "<%=bpwd%>"></td>
        </tr>
        <tr>
            <td>유형</td>
            <td>
            <% //if문으로 타입의 이름에 따른 체크 다르게 설정 하기
            if(btype.equals("잡")) {
            	out.println("<input type='radio' name = 'btype' value='잡' checked>잡 <input type='radio' name = 'btype' value='QnA'>QnA <input type='radio' name = 'btype' value='레시피'>레시피 <input type='radio' name = 'btype' value='이벤트'>이벤트");
            } else if(btype.equals("QnA")) {
            	out.println("<input type='radio' name = 'btype' value='잡' >잡 <input type='radio' name = 'btype' value='QnA' checked>QnA <input type='radio' name = 'btype' value='레시피'>레시피 <input type='radio' name = 'btype' value='이벤트'>이벤트");
            } else if(btype.equals("레시피")) {
            	out.println("<input type='radio' name = 'btype' value='잡' >잡 <input type='radio' name = 'btype' value='QnA'>QnA <input type='radio' name = 'btype' value='레시피' checked>레시피 <input type='radio' name = 'btype' value='이벤트'>이벤트");
            } else if(btype.equals("이벤트")) {
            	out.println("<input type='radio' name = 'btype' value='잡' >잡 <input type='radio' name = 'btype' value='QnA'>QnA <input type='radio' name = 'btype' value='레시피'>레시피 <input type='radio' name = 'btype' value='이벤트' checked>이벤트");
            }%>
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type = "text" name="btitle" value = "<%=btitle%>"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name = "btag" rows="10" value = "<%=btag%>"><%=btag%></textarea>
            </td>
        </tr>
        <tr>
            <td>작성날짜</td>
            <td>
               <input type="date" name = "bdate" value = "<%=bdate%>">
            </td>
        </tr>	
    </table>
    <input type="submit" value="수정"> 
    <input type="submit" value ="삭제" onclick = "location.href='BoardDelete.jsp?num=<%=num%>'"> 
    <input type="submit" value ="조회" onclick = "location.href=BoardList.jsp"> 
</form>

</body>
</html>