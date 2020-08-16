package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import member.model.service.MemberService;
import pointlog.service.PointLogService;
import pointlog.vo.PointLog;

/**
 * Servlet implementation class AdminUserPointLogViewSearchServlet
 */
@WebServlet("/admin/userPointLogView/search")
public class AdminUserPointLogViewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserPointLogViewSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		
		int numPerPage = 20;//한페이지당 수
		int cPage = 1;//요청페이지
	
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){
		
		}
		
		List<PointLog> list = new PointLogService().selectMemberPointLogList(cPage, numPerPage, memberId);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println(list);
		int totalContents = new PointLogService().selectMemberPointLogCount(memberId);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println(totalContents);
		
		String url = request.getRequestURI();
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);
				
		request.setAttribute("memberId", memberId);
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);	
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/AdminUserPointLogListView.jsp");
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
