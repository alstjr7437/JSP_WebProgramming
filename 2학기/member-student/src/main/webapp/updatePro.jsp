<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
    
<%@ page import="cs.dit.MemberDao, cs.dit.MemberDto" %>

<% request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	//8. 위의 얻어온 데이터를 MemberDto의 dto를 만들다. joinDate에는 현재 날짜(new Date(System.currentTimeMillis())가 입력된다.
	MemberDto dto = new MemberDto(id, pwd, name, email, new Date(System.currentTimeMillis())); 
	MemberDao dao = new MemberDao();
	

	dao.update(dto);
	
	response.sendRedirect("list.jsp");
%>