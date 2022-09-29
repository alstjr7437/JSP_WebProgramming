package cs.dit.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BViewService implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		BoardDto dto = new BoardDto();
		BoardDao dao = new BoardDao();
		
		//6. BoardDao에 정의된 selectOne 메소드를 호출하여 원하는 레코드를 dto에 저장하시오.
		dto = dao.selectOne(bcode);
		System.out.println(dto.getSubject());

		request.setAttribute("dto", dto);
		

	}

}
