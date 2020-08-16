package member.controller;

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
import member.model.vo.MemberWithdraw;
import pointlog.service.PointLogService;

/**
 * Servlet implementation class MemberPointWithdrawServlet
 */
@WebServlet("/myPage/point/withdraw")
public class MemberPointWithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPointWithdrawServlet() {
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
		
		List<MemberWithdraw> list = new MemberService().showMemberWithdraw(cPage, numPerPage,memberId);
		System.out.println("list@Servlet = "+list);
		
		int totalWithdrawCount = new MemberService().showMemberWithdrawCount(memberId);
		System.out.println("totalWithdrawCount@Servlet =" + totalWithdrawCount);
		
		
		String url = request.getRequestURI()+"?memberId="+memberId;
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalWithdrawCount, url);

		//4.뷰단 포워딩		
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/myPage/myPagePointWithdraw.jsp");
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
