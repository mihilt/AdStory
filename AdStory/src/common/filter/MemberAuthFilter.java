package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet Filter implementation class MemberAuthFilter
 */
@WebFilter(urlPatterns = {
	"/myPage/view","/myPage/adRegisterList","/myPage/point","/myPage/adList"
})
public class MemberAuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public MemberAuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session = httpReq.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		String memberId = request.getParameter("memberId");
		

		if( memberLoggedIn == null 
		 || memberId == null
		 || !(
			   memberId.equals(memberLoggedIn.getMemberId())
			|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())
			)
		 ) {
			
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", httpReq.getContextPath());
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			
			return;
		}
		
	
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
