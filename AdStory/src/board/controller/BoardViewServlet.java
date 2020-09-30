package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import board.model.vo.BoardComment;
import common.Utils;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1.파리미터 글번호
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
//		System.out.println("게시글등록 후boardNo@servlet = " + boardNo);

		// 2.비지니스로직 호출
		// 게시글 하나 가져오기
		BoardService boardService = new BoardService();
		Board board = boardService.selectOne(boardNo);
		List<BoardComment> commentList = 
				boardService.selectCommentList(boardNo);
		List<BoardCategory> categoryList = boardService.selectCategoryList(); 

		String view = "/WEB-INF/views/board/boardView.jsp";
		// 게시글 가져오기에 실패한경우
		if (board == null) {
			request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
			request.setAttribute("loc", request.getContextPath() + "/board/list");
			view = "/WEB-INF/views/common/msg.jsp";
		} else {

			// 제목
			String boardTitle = board.getTitle();
			boardTitle = Utils.getSecureString(boardTitle);
			board.setTitle(boardTitle);

			// 내용
			String boardContent = board.getContent();
			boardContent = Utils.getSecureString(boardContent);
			boardContent = Utils.getStringWithBr(boardContent);
			board.setContent(boardContent);

			board.setKey(boardNo);
		}

		request.setAttribute("board", board);
		request.setAttribute("commentList",commentList);
		request.setAttribute("categoryList", categoryList);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
