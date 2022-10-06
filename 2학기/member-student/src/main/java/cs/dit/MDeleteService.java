package cs.dit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MDeleteService implements MemberService {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   	request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		
		MemberDao dao = new MemberDao();
		dao.delete(id);
      
   }
}