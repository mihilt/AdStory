package member.controller;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class MemberPointWithdrawActionServlet
 */
@WebServlet("/myPage/point/withdraw/action")
public class MemberPointWithdrawActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPointWithdrawActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		int pointAmount = Integer.parseInt(request.getParameter("pointAmount"));	
		
		String requirements = request.getParameter("requirements");
		
		if("".equals(requirements)) {
			requirements = " ";
		} 
		
		
		int result = new MemberService().applyWithdraw(memberId, pointAmount, requirements);
		
		
		
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath() + "/myPage/point/withdraw?memberId=" + memberId;
		
		DecimalFormat Commas = new DecimalFormat("#,###");
		
		if(result>0){
			msg = "성공적으로 " + (String)Commas.format(pointAmount) + "P 만큼 출금신청이 이루어졌습니다.";
		}
		else { 
			msg = "실패했습니다.";	
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
