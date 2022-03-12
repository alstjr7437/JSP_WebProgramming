<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <tilte>테스트 페이지</tilte>
</head>
<body>
    <%
        /*
            여러줄 주석 : 
            Java 코드 시작
        */
        out.println("오늘 날짜 : " + LocalDate.now() + "<br>");
        out.println("현재 시간 : " + LocalTime.now());
    %>
    <br><br>
    /* HTML 영역에서는
    JSP의 주석이 */
    // 일반 텍스트로 인식됩니다.
    <!--
        HTML 영역에서는 HTML 주석을 사용하세요.
        이 주석은 "소스보기"를 하면 보입니다.
    -->
    <%--
        HTML영역에서
    --%>
</body>
</html>