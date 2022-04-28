<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
<body>

 <form action="LoginNewPro.jsp" method = "post">
    <table>
        <tr>
            <td>고유 번호</td>
            <td><input type = "text" name="num"></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td><input type = "text" name="id"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pwd"></td>
        </tr>
        <tr>
            <td>이 름</td>
            <td><input type = "text" name="name"></td>
        </tr>
        <tr>
            <td>별 명</td>
            <td><input type = "text" name="xname"></td>
        </tr>
        <tr>
            <td>성 별</td>
            <td>
                <input type="radio" name = "gender" value="남" checked>남
                <input type="radio" name = "gender" value="여">여
            </td>
        </tr>
        <tr>
            <td>폰 번호</td>
            <td><input type = "text" name="phone"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type = "text" name="email"></td>
        </tr>
        <tr>
            <td>생년월일</td>
            <td>
               <input type="date" name = "rdate">
            </td>
        </tr>	
    </table>
    <input type="submit" value="가입">
</form>

</body>
</html>