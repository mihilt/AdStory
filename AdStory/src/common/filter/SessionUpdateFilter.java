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
 * Servlet Filter implementation class SessionUpdateFilter
 */
@WebFilter("/SessionUpdateFilter")
public class SessionUpdateFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SessionUpdateFilter() {
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
	@Override
	public void doFilter(ServletRequest request, 
						 ServletResponse response, 
						 FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session = httpReq.getSession();
		
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		
		if( memberLoggedIn != null) {
			String memberId = memberLoggedIn.getMemberId();
			Member updateMember = new MemberService().selectOne(memberId);
			session.setAttribute("memberLoggedIn", updateMember);
		}
		
	
		chain.doFilter(request, response);
		
		//후처리
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
