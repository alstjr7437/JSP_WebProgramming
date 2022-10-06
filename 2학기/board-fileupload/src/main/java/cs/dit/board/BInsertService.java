package cs.dit.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BInsertService implements BoardService {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");

      //7. insertForm 에서 입력한 subject, content, writer 를 받아와 알맞는 변수에 입력하세요.
      String subject = request.getParameter("subject");
      String content = request.getParameter("content");
      String writer = request.getParameter("writer");
      String filename = request.getParameter("filename");
      
      
      BoardDto dto = new BoardDto(0, subject, content, writer, null, filename); 
      BoardDao dao = new BoardDao();
      dao.insert(dto);
      
   }
}