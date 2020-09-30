package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Utils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력값 처리
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		
		String password = request.getParameter("password");
		password = Utils.getEncryptedPassword(password);
		
		String saveId = request.getParameter("saveId");
		
		//2. 업무로직
		Member member = new MemberService().selectOne(memberId);
		
		//3. 뷰단(응답)처리
		//a. 아이디/비번 모두 맞은 경우: 로그인 성공
		//b. 비번만 틀린 경우: 로그인 실패
		//c. 존재하지 않는 아이디인 경우: 로그인 실패
	
		String view = "";
		//로그인 성공
		if(member != null && password.equals(member.getPassword())) {
			//로그인한 사용자정보를 session객체에 속성으로 저장
			//세션객체가 존재하면, 해당객체 반환.
			//세션객체가 존재하지 않으면, 생성해서 반환
			HttpSession session = request.getSession(true);
			session.setAttribute("memberLoggedIn", member);
			
			//마지막요청으로 부터 유효시간 설정(초)
//			session.setMaxInactiveInterval(10*60);
			
			//saveId관련 쿠키처리
			//아이디 저장을 체크했다면, saveId=honggd 쿠키생성
			//쿠키는 별도의 삭제메소드가 없어서 유효기간으로 삭제한다.
			Cookie cookie = new Cookie("saveId", memberId);
			cookie.setPath(request.getContextPath());// /mvc이하 디렉토리에서 사용
			
			if(saveId != null)
				cookie.setMaxAge(7*24*60*60); //7일간 브라우져에서 보관
			else
				cookie.setMaxAge(0);//즉시삭제. 브라우져에 이미 존재하는 쿠키를 삭제.
			
			response.addCookie(cookie);
			
			
			//로그인 성공시, 포워딩이 아닌 redirect처리함.
			//client에게 다시 요청할 주소를 응답으로 전달
			String referer = request.getHeader("referer");
			response.sendRedirect(referer);
			
		}
		//로그인 실패시, 경고창 띄움
		else {
			view = "/WEB-INF/views/common/msg.jsp";
			request.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			request.setAttribute("loc", request.getContextPath());
			request.getRequestDispatcher(view)
				   .forward(request, response);
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