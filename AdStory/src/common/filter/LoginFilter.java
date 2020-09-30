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

import member.model.vo.Member;

/**
 * 
 */
@WebFilter(urlPatterns = {
		"/enquiry/elist","/myPage","/board/view"
})
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
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
		//전처리
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session = httpReq.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		
		
		if(memberLoggedIn == null) {
			request.setAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			request.setAttribute("loc", ((HttpServletRequest) request).getHeader("Referer"));
			
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			
			return;
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
