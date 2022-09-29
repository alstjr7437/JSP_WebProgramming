<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import="cs.dit.MemberDao, cs.dit.MemberDto" %>

<% request.setCharacterEncoding("utf-8");

	//3. id, name, pwd, email 을 폼으로부터 가져오기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");

	
	
	
	MemberDto dto = new MemberDto(id, pwd, name, email, new Date(System.currentTimeMillis())); 
	MemberDao dao = new MemberDao();
	
	//4. dto를 MemberDao에 적당한 메소드를 호출하여 데이터베이스에 입력
	dao.insert(dto);
	 
	
	response.sendRedirect("list.jsp");
%>