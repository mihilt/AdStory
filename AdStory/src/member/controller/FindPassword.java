package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPassword
 */
@WebServlet("/member/findPassword")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String memberId = request.getParameter("memberId");
		String name = request.getParameter("name");
		String email = request.getParameter("receiver");
		
		Member member = new MemberService().selectPW(memberId,name,email);
		
		boolean isUsable = member == null ? true : false;
		System.out.println("isUsable@servlet = " + isUsable);
		
		if (isUsable != false) {
			
			request.getRequestDispatcher("/WEB-INF/views/member/changePassword.jsp").forward(request, response);
			
		} else {
			
			String view = "/WEB-INF/views/common/msg.jsp";
			String msg = "회원정보가 일치하지 않습니다..";
			String loc = request.getContextPath()+"/member/findPasswordInput";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
			reqDispatcher.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
