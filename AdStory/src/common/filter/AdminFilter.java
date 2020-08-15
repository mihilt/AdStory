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
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//관리자가 아닌 부정요청에 대한 처리
		HttpSession session = ((HttpServletRequest)request).getSession();
		Member memberLoggedIn = ((Member)session.getAttribute("memberLoggedIn"));
		
		if(memberLoggedIn==null || !MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())){
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", ((HttpServletRequest)request).getContextPath());
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
