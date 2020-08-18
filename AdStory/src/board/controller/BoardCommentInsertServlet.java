package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardComment;

/**
 * Servlet implementation class BoardCommentInsertServlet
 */
@WebServlet("/board/comment/insert")
public class BoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.파라미터값 핸들링
			//파라미터값과 vo변수명 주의할 것.
			int postKey = Integer.parseInt(request.getParameter("postKey"));
			int userKey = Integer.parseInt(request.getParameter("userKey"));
			String content = request.getParameter("content");
			int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
			int commentRef = Integer.parseInt(request.getParameter("commentRef"));
			
			BoardComment boardComment = new BoardComment(0, postKey, userKey, content, null, commentLevel,commentRef,null);
			System.out.println("boardComment@servlet"+boardComment);
			
			//2.비지니스로직 
			int result = new BoardService().insertBoardComment(boardComment);
			
			////3. 처리결과에 따른 view단에 처리위임.
			String view = "/WEB-INF/views/common/msg.jsp";
			String msg = "";
			String loc = request.getContextPath() + "/board/view?boardNo="+postKey;
	
			if(result>0){
				msg = "댓글 등록 성공!";
			}
			else {
				msg = "댓글 등록 실패!";				
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
			reqDispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
			//WAS WebContainer쪽으로 던져서 error페이지가 사용자에게 전달되도록함.
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
