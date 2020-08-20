package tipboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tipboard.model.service.TipBoardService;
import tipboard.model.vo.TipBoard;

/**
 * Servlet implementation class TipBoardUpdateServlet
 */
@WebServlet("/tipBoard/update")
public class TipBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		

		TipBoard board = new TipBoardService().selectOne(boardNo);
		System.out.println("board@servlet = " + board);
		

		request.setAttribute("board", board);
		request.getRequestDispatcher("/WEB-INF/views/tipBoard/boardUpdate.jsp")
			   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		int key = Integer.parseInt(request.getParameter("boardKey"));
	
		TipBoard tipBoard = new TipBoard(key, 0, boardTitle, boardContent, null, 0, 0, null, null);
		
		int result = new TipBoardService().updateTipBoard(tipBoard);
		int boardNo = tipBoard.getKey();

		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath() + "/tipBoard/view?boardNo=" + boardNo;
		
		if(result > 0) {
			view = "/tipBoard/view?boardNo=" + boardNo;
		}
		else {
			msg = "게시글 수정 실패!";
			loc = request.getContextPath() + "/tipBoard/list";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view)
			   .forward(request, response);
	}

}
