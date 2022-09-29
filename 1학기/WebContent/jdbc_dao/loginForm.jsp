<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id2 = (String)session.getAttribute("id");
	if(id2!= null){
		out.println(id2 + "님 반갑습니다.");
	} else {
		out.println("로그인 ㄱ");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
<body>

<div class="container">
  <h2>로그인 화면</h2>
  <form action="loginPro.jsp" method="post">
  
    <div class="form-group">
      <label for="id">id:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
    </div> 
    
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>