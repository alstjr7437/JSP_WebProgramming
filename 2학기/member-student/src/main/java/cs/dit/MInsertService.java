package cs.dit;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MInsertService implements MemberService {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");

  	String id = request.getParameter("id");
  	String name = request.getParameter("name");
  	String pwd = request.getParameter("pwd");
  	String email = request.getParameter("email");
  	
  	MemberDto dto = new MemberDto(id, pwd, name, email, null); 
  	MemberDao dao = new MemberDao();
  	
  	dao.insert(dto);
      
   }
}