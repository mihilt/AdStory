package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값 꺼내서 변수에 기록하기.
		//String javax.servlet.ServletRequest.getParameter(String arg0)
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		//2.서비스로직호출
		Board board = new BoardService().selectOne(boardNo);
//		String renamedFileName = board.getRenamedFileName();
		int result = new BoardService().deleteBoard(boardNo);
		
		//파일삭제
//		if(renamedFileName != null) {
//			String saveDirectory = getServletContext().getRealPath("/upload/board");
//			File delFile = new File(saveDirectory,renamedFileName);
//			delFile.delete();
//		}
				
		//3. 받은 결과에 따라 뷰페이지 내보내기
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath() + "/board/list";

		if(result>0)
			msg = "게시글 마감 성공!";
		else 
			msg = "게시글 마감 실패!";	
		
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
