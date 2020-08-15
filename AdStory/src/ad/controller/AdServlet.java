package ad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.model.service.AdClickService;
import ad.model.vo.AdClick;

/**
 * Servlet implementation class AdServlet
 */
@WebServlet("/AD")
public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		
		String clientIp = null != request.getHeader("X-FORWARDED-FOR") ? request.getHeader("X-FORWARDED-FOR") : request.getRemoteAddr();
		System.out.println(clientIp);
		
		AdClick adClick = new AdClickService().click(num ,clientIp);
		


//		일단 광고 URL 접속시
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
