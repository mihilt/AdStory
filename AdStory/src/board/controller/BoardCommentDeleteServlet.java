package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardCommentDeleteServlet
 */
@WebServlet("/board/comment/delete")
public class BoardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터값 가져오기
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int boardCommentNo = Integer.parseInt(request.getParameter("boardCommentNo"));
		String role = request.getParameter("role");
//		System.out.println("boardNo="+boardNo+", boardCommentNo="+boardCommentNo);

		//2. 비지니스로직 호출
		int result = new BoardService().deleteBoardComment(boardCommentNo,role);
		
		//3. 받은 결과에 따라 view단 처리위임.
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		//javascript/html에서 사용할 url은 contextPath를 포함한다.
		String loc = request.getContextPath() + "/board/view?boardNo="+boardNo;

		if(result>0)
			msg = "댓글 삭제 성공!";
			
		else 
			msg = "댓글 삭제 실패!";	
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
