package cs.dit.board;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BUpdateService implements BoardService {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("utf-8");

  		int bcode = Integer.parseInt(request.getParameter("bcode"));
  		String subject = request.getParameter("subject");
  		String content = request.getParameter("content");
  		String writer = request.getParameter("writer");
  		Date regDate = Date.valueOf(request.getParameter("regDate"));
  		String filename = request.getParameter("filename");
  	
  		BoardDto dto = new BoardDto(bcode, subject, content, writer, regDate, filename); 
  		BoardDao dao = new BoardDao();
  	
  		dao.update(dto);		
      
   }
}