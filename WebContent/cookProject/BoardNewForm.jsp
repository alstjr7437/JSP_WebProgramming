<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
<body>

 <form action="BoardNewPro.jsp" method = "post">
    <table>
        <tr>
            <td>고유 번호</td>
            <td><input type = "text" name="num"></td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td><input type = "text" name="bname"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="bpwd"></td>
        </tr>
        <tr>
            <td>유형</td>
            <td>
                <input type="radio" name = "btype" value="잡" checked>잡
                <input type="radio" name = "btype" value="QnA">QnA
                <input type="radio" name = "btype" value="레시피">레시피
                <input type="radio" name = "btype" value="이벤트">이벤트
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type = "text" name="btitle"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name = "btag" rows="10"></textarea>
            </td>
        </tr>
        <tr>
            <td>작성날짜</td>
            <td>
               <input type="date" name = "bdate">
            </td>
        </tr>	
    </table>
    <input type="submit" value="작성하기">
</form>

</body>
</html>