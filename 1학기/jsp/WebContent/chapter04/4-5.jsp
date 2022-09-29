<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	아이디 : <%=request.getParameter("id"  ) %><br> 
	비밀번호 : <%=request.getParameter("pw"  ) %><br> 
	성 별 : <%=request.getParameter("gender"  ) %><br> 
	가입 경로 : <%=request.getParameter("intro"  ) %><br>
	주 소 : <%=request.getParameter("addr"  ) %><br>
	메 모 : <%=request.getParameter("memo"  ) %><br>
</body>
</html>