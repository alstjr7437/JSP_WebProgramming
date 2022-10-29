package cs.dit.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

public class CommentsService {
	CommentsDao dao = new CommentsDao();
	public void cList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bcode = Integer.parseInt(request.getParameter("bcode"));

		JSONArray list = dao.list(bcode);
		dao.list(bcode);
		System.out.println(list);
		response.getWriter().println(list);
	}
	public void cInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		String content = request.getParameter("content");
		
		CommentsDto dto = new CommentsDto(0, bcode, 0, content, null); 	
		dao.insert(dto);
		
	}
}
