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
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));		//문자를 숫자로 바꾸는 Integer.parseInt
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int sum = kor + eng + math;
		float a = (float)sum / 3;		//int를 float형으로 변환(안하면 소수점 출력이 안됨)
		
		//출력 부분
		out.println(request.getParameter("name")+ "의 <br>"); 
		out.println("국어 점수는 "+ kor + "<br>");
		out.println("영어 점수는 "+ eng + "<br>");
		out.println("수학 점수는 "+ math + "<br>");
		out.println("총 점수는 "+ sum + "<br>");
		out.println("평균 점수는 "+ Math.round(a*100)/100.0 + "<br>");		//2자리 반올림을 위한 Math.round
	%>
</body>
</html>