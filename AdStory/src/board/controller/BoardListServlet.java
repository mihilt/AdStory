package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import common.Utils;
import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.MemberWishList;

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
		int userKey=0;
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session = httpReq.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		if(memberLoggedIn != null) {
			
			userKey = memberLoggedIn.getKey();
		}
		try{
			
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){}
//		}try {
//			
//			userKey = Integer.parseInt(request.getParameter("userKey"));
//		}catch(NumberFormatException e) {
//			
//		}
//		System.out.println("-----userKey@servlet="+userKey);
		BoardService boardService = new BoardService();
		List<Board> list = boardService.selectBoardList(cPage, numPerPage,userKey);
		List<BoardCategory> categoryList = boardService.selectCategoryList();
//		List<MemberWishList> wishList = new MemberService().selectWishList(userKey);
		
		
//		System.out.println("***********boardlist@servlet="+list);
		
		//2.2 전체게시글수, 전체페이지수 구하기
		int totalContents = new BoardService().selectBoardCount();
		
		String url = request.getRequestURI();//  /mvc/board/list
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);
	
		//4.뷰단 포워딩		
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("categoryList", categoryList);
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
