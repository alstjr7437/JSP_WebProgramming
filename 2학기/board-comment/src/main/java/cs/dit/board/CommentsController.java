package cs.dit.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ct")
public class CommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hi, ct come");

    	String uri = request.getRequestURI();
    	String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".ct"));
    	System.out.println(com);
    	
    	if(com != null && com.equals("cList")) {
    		System.out.println("안녕");
    		CommentsService service = new CommentsService();
    		service.cList(request, response);
    	} else if(com != null && com.equals("cInsert")) { 
    		System.out.println("하세요");
    	}
    	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
