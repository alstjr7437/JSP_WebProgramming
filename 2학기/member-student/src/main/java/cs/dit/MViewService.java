package cs.dit;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MViewService implements MemberService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		dto = dao.selectOne(id);

		request.setAttribute("dto", dto);
		
	}
}
