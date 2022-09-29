<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>    
<%@ page import="cs.dit.board.BoardDao, cs.dit.board.BoardDto" %>
<% 		
		request.setCharacterEncoding("utf-8");
		
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		BoardDao dao = new BoardDao();
		dao.delete(bcode);
		
		//8. list.jsp 파일로 이동하기
		response.sendRedirect("list.jsp");
		
		
%>