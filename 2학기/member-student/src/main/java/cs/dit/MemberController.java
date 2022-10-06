package cs.dit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	request.setCharacterEncoding("utf-8");
    	String viewPage = null;
    	
    	String uri = request.getRequestURI();
    	String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
    	System.out.println(com);
    	
    	if(com != null && com.trim().equals("list")) {
    		MemberService service = new MListService();
    		service.execute(request, response);
    		viewPage = "/WEB-INF/view/list.jsp";
    	} else if(com != null && com.equals("index")) { 
    		viewPage = "/WEB-INF/view/index.jsp";
    	} else if(com != null && com.equals("insertForm")) {
    		viewPage = "/WEB-INF/view/insertForm.jsp";
    	} else if(com != null && com.equals("insert")) {
    		MemberService service = new MInsertService();
    		service.execute(request, response);
    		viewPage = "list.do";
    	} else if(com != null && com.equals("updateForm")) {
    		MemberService service = new MViewService();
    		service.execute(request, response);
    		viewPage = "/WEB-INF/view/updateForm.jsp";
    	} else if(com != null && com.equals("update")) {
    		MemberService service = new MUpdateService();
    		service.execute(request, response);
    		viewPage = "list.do";
    	} else if(com != null && com.equals("delete")) {
    		MemberService service = new MDeleteService();
    		service.execute(request, response);
    		viewPage = "list.do";
    	}
    	RequestDispatcher rd = request.getRequestDispatcher(viewPage);
    	rd.forward(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

}
