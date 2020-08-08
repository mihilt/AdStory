package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberViewServlet
 */
@WebServlet("/member/view")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.사용자입력값 처리 
		String memberId = request.getParameter("memberId");
		System.out.println("memberId@servlet = " + memberId);
		
		//2. 업무로직
		Member member = new MemberService().selectOne(memberId);
		System.out.println("member@servlet = " + member);
		
		//3. view단 처리
//		String view = "";
//		if(member != null) {
//			view = "/WEB-INF/views/member/memberView.jsp";
//			request.setAttribute("member", member);
//		}
//		else {
//			view = "/WEB-INF/views/common/msg.jsp";
//			request.setAttribute("msg", "해당하는 회원이 없습니다");
//			request.setAttribute("loc", request.getContextPath());
//		}
//		
//		request.getRequestDispatcher(view)
//			   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
