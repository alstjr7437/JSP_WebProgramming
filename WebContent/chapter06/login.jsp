<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">	
  <h2>Stacked form</h2>
  <form action="loginPro.jsp" method="post">
    <div class="form-group">
              아이디  
      <input type="text" class="form-control" id="email" placeholder="Enter id" name="id">
    </div>
    <div class="form-group">
              비밀번호 
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <div class="form-group form-check">
    
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>