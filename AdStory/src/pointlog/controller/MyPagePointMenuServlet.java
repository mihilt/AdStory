package pointlog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import pointlog.service.PointLogService;
import pointlog.vo.PointLog;

/**
 * Servlet implementation class MyPagePointViewServlet
 */
@WebServlet("/myPage/point")
public class MyPagePointMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPagePointMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int numPerPage = 20;//한페이지당 수
		int cPage = 1;//요청페이지
		
		String memberId = request.getParameter("memberId");
		
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){
		
		}
		
		List<PointLog> list = new PointLogService().selectMemberPointLogList(cPage, numPerPage, memberId);
		
		//2.2 전체게시글수, 전체페이지수 구하기
		int totalContents = new PointLogService().selectMemberPointLogCount(memberId);

		
		String url = request.getRequestURI()+"?memberId="+memberId;
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);

		//4.뷰단 포워딩		
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);	
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/myPage/myPagePointMenu.jsp");
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
