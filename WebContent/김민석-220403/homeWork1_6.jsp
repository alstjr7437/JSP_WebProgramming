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
	<!-- 가능 요리를 제외하곤 모두 단일 값 입력 태그 활용 -->
	아이디 : <%=request.getParameter("id"  ) %><br> 
	비밀번호 : <%=request.getParameter("pw"  ) %><br> 
	이름 : <%=request.getParameter("name"  ) %><br> 
	<% 	
		//다중 선택 입력 태그 활용 부분 (배열로)
		String[] lang = request.getParameterValues("lang");
		out.println("가능 요리 : ");
		for(int i = 0; i < lang.length; i++){
			out.println(lang[i]);
		}
	%>
	<br>
	성 별 : <%=request.getParameter("gender"  ) %><br> 
	가입 경로 : <%=request.getParameter("intro"  ) %><br>
	주 소 : <%=request.getParameter("addr"  ) %><br>
	메 모 : <%=request.getParameter("pri"  ) %><br>
</body>
</html>