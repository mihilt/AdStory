package tipboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tipboard.model.service.TipBoardService;

/**
 * Servlet implementation class TipBoardRecommendServlet
 */
@WebServlet("/tipBoard/recommend")
public class TipBoardRecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipBoardRecommendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo  = Integer.parseInt(request.getParameter("boardNo"));

		
		Cookie[] cookies = request.getCookies();
		String boardCookieVal = "";
		boolean isRecommended = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				if("boardCookie".equals(name)) {
					boardCookieVal = value;

					if(value.contains("[" + boardNo + "]")) {
						isRecommended = true;
						break;
					}				
				}
			}
		}
		
		if(isRecommended == false) {
			Cookie boardCookie = new Cookie("boardCookie", boardCookieVal + "[" + boardNo + "]");
			boardCookie.setMaxAge(365*24*60*60);
			boardCookie.setPath(request.getContextPath() + "/tipBoard");
			response.addCookie(boardCookie);
		}
		
		int result = 0;
		if(!isRecommended) {
			result = new TipBoardService().recommend(boardNo);
		}
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = request.getContextPath() + "/tipBoard/view?boardNo="+boardNo;

		if(result>0){
			view = "/tipBoard/view?boardNo="+boardNo;
		}
		else {
			msg = "이미 추천한 게시글 입니다.";				
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
