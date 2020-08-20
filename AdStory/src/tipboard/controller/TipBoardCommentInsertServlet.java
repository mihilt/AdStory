package tipboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tipboard.model.service.TipBoardService;
import tipboard.model.vo.TipBoardComment;

/**
 * Servlet implementation class TipBoardCommentInsertServlet
 */
@WebServlet("/tipBoard/comment/insert")
public class TipBoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipBoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int userKey = Integer.parseInt(request.getParameter("userKey"));
		int commLevel = Integer.parseInt(request.getParameter("commLevel"));
		int commRef = Integer.parseInt(request.getParameter("commRef"));
		String content = request.getParameter("content");
		
		TipBoardComment tipBoardComment = new TipBoardComment(0, userKey, boardNo, content, null, commLevel, commRef, "F", null, null);
		
		int result = new TipBoardService().insertTipBoardComment(tipBoardComment);

		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath() + "/tipBoard/view?boardNo="+boardNo;

		if(result>0){
			view = "/tipBoard/view?boardNo="+boardNo;
		}
		else {
			msg = "댓글 등록 실패!";				
		}
		
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
