<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
    
<%@ page import="cs.dit.board.BoardDao,cs.dit.board.BoardDto" %>

<%
	
	request.setCharacterEncoding("utf-8");

	//7. insertForm 에서 입력한 subject, content, writer 를 받아와 알맞는 변수에 입력하세요.
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	BoardDto dto = new BoardDto(0, subject, content, writer, null); 
	BoardDao dao = new BoardDao();
	dao.insert(dto);
	
	response.sendRedirect("list.jsp");
%>