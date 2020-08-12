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
import common.Utils;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한페이지당 5개의 게시물 : numPerPage = 5 
		//페이지바 사이즈 5개 : pageBarSize = 5
		// /WEB-INF/views/board/boardList.jsp
		//1. 파라미터값 변수에 담기
		int numPerPage = 12;//한페이지당 수
		int cPage = 1;//요청페이지
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){
		
		}
//		System.out.println("cPage="+cPage);
		
		//2.업무로직처리
		//2.1 현재페이지의 회원구하기
		List<Board> list = new BoardService().selectBoardList(cPage, numPerPage);
		
		System.out.println("list="+list);
		
		//2.2 전체게시글수, 전체페이지수 구하기
		int totalContents = new BoardService().selectBoardCount();
		System.out.println("totalContents = " + totalContents);
		
		String url = request.getRequestURI();//  /mvc/board/list
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);
		System.out.println("pageBar = " + pageBar);
		//4.뷰단 포워딩		
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);	
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/board/BoardList.jsp");
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
