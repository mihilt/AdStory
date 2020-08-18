package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class BusinessEnrollServlet
 */
@WebServlet("/member/businessEnroll")
public class BusinessEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/businessEnroll.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		
		String password = request.getParameter("password");
		password = Utils.getEncryptedPassword(password);
		
		
		String phoneNum = request.getParameter("phone");
		String bank = request.getParameter("bank");
		String accountNum = request.getParameter("acountNum");
		String businessNum = request.getParameter("BusinessNum");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		Member member = 
				new Member(0, memberId, password,MemberService.COMPANY_MEMBER_ROLE,
						0,phoneNum,bank, accountNum, businessNum, name, email, address,  null);
	
		int result = new MemberService().insertMember(member);
		System.out.println(result);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath();
		
		if(result>0)
			msg = "성공적으로 회원가입되었습니다.";
		else 
			msg = "회원등록에 실패했습니다.";	
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
	}

}
