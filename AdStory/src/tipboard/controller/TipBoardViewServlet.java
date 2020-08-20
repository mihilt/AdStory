package tipboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import tipboard.model.service.TipBoardService;
import tipboard.model.vo.TipBoard;

/**
 * Servlet implementation class TipBoardViewServlet
 */
@WebServlet("/tipBoard/view")
public class TipBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipBoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo  = Integer.parseInt(request.getParameter("boardNo"));
		
		TipBoardService tipBoardService = new TipBoardService();
		TipBoard tipBoard = tipBoardService.selectOne(boardNo);
		
		/*
		 * 덧글리스트 가져오기
		 */
		
		String view = "/WEB-INF/views/tipBoard/BoardView.jsp";
		
		if(tipBoard == null){
			request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
			request.setAttribute("loc", request.getContextPath()+"/tipBoard/list");
			view = "/WEB-INF/views/common/msg.jsp";
		}
		else {
			
			String boardTitle = tipBoard.getTitle();
			boardTitle = Utils.getSecureString(boardTitle);
			tipBoard.setTitle(boardTitle);
			
			String boardContent = tipBoard.getContent();
			boardContent = Utils.getSecureString(boardContent);
			boardContent = Utils.getStringWithBr(boardContent);
			
			boardContent = boardContent.replaceAll("&lt;", "<");
			boardContent = boardContent.replaceAll("&gt;", ">");
			
			tipBoard.setContent(boardContent);		
		}
		
		request.setAttribute("tipBoard", tipBoard);

		
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
