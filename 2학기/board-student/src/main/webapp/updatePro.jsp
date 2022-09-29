<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
    
<%@ page import="cs.dit.board.BoardDao, cs.dit.board.BoardDto" %>

<% 
	request.setCharacterEncoding("utf-8");
	
	int bcode = Integer.parseInt(request.getParameter("bcode"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	Date regDate = Date.valueOf(request.getParameter("regDate"));
	
	BoardDto dto = new BoardDto(bcode, subject, content, writer, regDate); 
	BoardDao dao = new BoardDao();
	
	dao.update(dto);		
	
	response.sendRedirect("list.jsp");
%>