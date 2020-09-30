package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import common.Utils;

/**
 * Servlet implementation class BoardApplyServlet
 */
@WebServlet("/board/apply")
public class BoardApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파리미터 글번호
				int postKey  = Integer.parseInt(request.getParameter("postKey"));
				int userKey = Integer.parseInt(request.getParameter("userKey"));
				
				//2.비지니스로직 호출
				//게시글 하나 가져오기
				BoardService boardService = new BoardService();
				int result = boardService.insertAdList(postKey,userKey);
				int postR = boardService.updateBoardApply(postKey);

				
				String view = request.getContextPath()+"/board/view?boardNo="+postKey;
				//게시글 신청하기에 실패한경우
				if(result == 0){
					request.setAttribute("msg", "광고게시글 신청에 실패하였습니다.");
					request.setAttribute("loc", request.getContextPath()+"/board/view?boardNo="+postKey);
					view = "/WEB-INF/views/common/msg.jsp";
				}
				else {
					
					request.setAttribute("msg", "신청 완료되었습니다.");
					request.setAttribute("loc", request.getContextPath()+"/board/view?boardNo="+postKey);
					view = "/WEB-INF/views/common/msg.jsp";
				}
				
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
