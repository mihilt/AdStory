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
 * Servlet implementation class TipBoardInsertServlet
 */
@WebServlet("/tipBoard/insert")
public class TipBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipBoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/views/tipBoard/boardInsert.jsp")
		   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String boardWriter = request.getParameter("boardWriter");
		String boardContent = request.getParameter("boardContent");
		
		TipBoard tipBoard = new TipBoard(0, 0, boardTitle, boardContent, null, 0, 0, boardWriter, null);
		
		int result = new TipBoardService().insertTipBoard(tipBoard);
		int boardNo = tipBoard.getKey();

		String msg = "";
		String loc = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = request.getContextPath() + "/tipBoard/view?boardNo=" + boardNo;
		}
		else {
			msg = "게시글 등록 실패!";
			loc = request.getContextPath() + "/tipBoard/list";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			   .forward(request, response);
		
		
	}

}
