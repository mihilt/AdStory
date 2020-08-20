package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ScrapingTaxTypeFromNts;

/**
 * Servlet implementation class CheckBusinessNumServlet
 */
@WebServlet("/member/checkBusinessNum")
public class CheckBusinessNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckBusinessNumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		System.out.println("test");
		String BusinessNum = request.getParameter("BusinessNum");
		System.out.println(BusinessNum);
		
		//2. 업무로직
		
		ScrapingTaxTypeFromNts scrapingTaxTypeFromNts = new ScrapingTaxTypeFromNts();
		List<String> listBusinessRegNo = new ArrayList<>();
		listBusinessRegNo.add(BusinessNum);
		
		
		List<Map<String, String>> listResult = scrapingTaxTypeFromNts.selectTaxTypeFromNts(listBusinessRegNo);
		for (String businessRegNo : listBusinessRegNo) {
			String result = listResult.stream() .filter(map -> map.containsKey(businessRegNo)) .map(map -> map.get(businessRegNo)) 
					.collect(Collectors.joining()); 
			System.out.println(businessRegNo + " = " + result);
			
			
		
			request.setAttribute("result", result);
		}
		request.setAttribute("BusinessNum", BusinessNum);
		request.getRequestDispatcher("/WEB-INF/views/member/checkBusinessNum.jsp")
		.forward(request, response); 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
