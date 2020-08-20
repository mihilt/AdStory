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
 * Servlet implementation class changePasswordServlet
 */
@WebServlet("/member/changePassword")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/changePassword.jsp");
		reqDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 전송값 꺼내서 변수에 기록하기.
				//String javax.servlet.ServletRequest.getParameter(String arg0)
				String memberId = request.getParameter("memberId");
				String password_new = Utils.getEncryptedPassword(request.getParameter("password_new"));
				
				System.out.println(memberId);
				
				System.out.println(password_new);
				
				//2.서비스로직호출
				Member member = new MemberService().selectOne(memberId);
				
				//3. 현재패스워드를 맞게 입력했으면, 비밀번호를 업데이트함. 
				//그렇지 않으면, 다시 팝업창 url을 호출함.
				String msg = "";
				String loc = "";
				String view = "/WEB-INF/views/common/msg.jsp";
					//현재 member객체에 갱신할 비밀번호를 업데이트
					member.setPassword(password_new);
					int result = new MemberService().updatePassword(member);
					if(result>0){
						msg = "비밀번호 변경이 완료되었습니다. 로그인해주세요";
						loc = request.getContextPath();
					}
						
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
				reqDispatcher.forward(request, response);
	}

}
