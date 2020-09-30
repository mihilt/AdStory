package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/myPage/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String name = request.getParameter("name");
		String phoneNum = request.getParameter("phoneNum");
		String accountName = request.getParameter("accountName");
		String accountNum = request.getParameter("accountNum");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		

		
		Member member = new Member(0, memberId, null, null, 0, phoneNum, accountName, accountNum, null, name, email, address, null);

		
		//3.서비스로직호출
		int result = new MemberService().updateMember(member);  
		
		//4. 받은 결과에 따라 뷰페이지 내보내기
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath() + "/myPage/view?memberId="+memberId;

		if(result>0){
			msg = "성공적으로 회원정보를 수정했습니다.";
			
			//세션에 저장된 member객체 갱신
			HttpSession session = request.getSession();
			Member updateMember = new MemberService().selectOne(memberId);
			Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
			
			if(memberId.equals(memberLoggedIn.getMemberId()))
				session.setAttribute("memberLoggedIn", updateMember);
			
		}
		else { 
			msg = "회원정보수정에 실패했습니다.";	
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
