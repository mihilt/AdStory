package tipboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import common.Utils;
import tipboard.model.service.TipBoardService;
import tipboard.model.vo.TipBoard;

/**
 * Servlet implementation class TipBoardServlet
 */
@WebServlet("/tipBoard/list/recommended")
public class TipBoardListRecommendedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipBoardListRecommendedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int numPerPage = 10;
		int cPage = 1;
		
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){
		
		}

		List<TipBoard> list = new TipBoardService().selectTipBoardListRecommended(cPage, numPerPage);
		
		
		int totalContents = new TipBoardService().selectTipBoardListRecommendedCount();
		
		String url = request.getRequestURI();
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);
	
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);	
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/tipBoard/BoardListRecommended.jsp");
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
